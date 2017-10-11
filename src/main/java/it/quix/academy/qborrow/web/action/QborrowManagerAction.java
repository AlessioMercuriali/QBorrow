
package it.quix.academy.qborrow.web.action;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import it.quix.academy.qborrow.Configuration;
import it.quix.academy.qborrow.core.model.QborrowUserContext;
import it.quix.framework.web.action.QuixActionSupport;
import it.quix.framework.core.manager.FrameworkCoreManager;
import it.quix.framework.core.utils.ExceptionLogUtils;
import it.quix.framework.core.validation.api.InvalidConstraint;
import flexjson.JSONSerializer;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public abstract class QborrowManagerAction extends QuixActionSupport {

	/**
     * Serial Version UID per la serializzazione della classe
     */
	private static final long serialVersionUID = 1L;
	
	/**
     * Numero massimo di getCausedBy chiamate per serializzare un eccezione
     */
    private static final int MAX_EXCEPTION_CAUSEDBY = 20;
    
    private static final Log log = LogFactory.getLog(QborrowManagerAction.class);
	
	@Resource(name = "configuration")
	protected Configuration configuration;
	
	@Resource(name = "frameworkCoreManager")
    protected FrameworkCoreManager frameworkCoreManager;
		
	/**
	 * Metodo non piu' necessario, le validazioni usano il nome del form gestito lato client 
	 */
    @Override
	public String getValidatedBeanName(String arg0) {
		return null;
	}
	 
    /**
     * Questo metodo si occupa di serializzare una eccezione all'interno di una stringa che possa 
     * essere inclusa in un json di una chiamata AJAX.
     * 
     * @param e
     * @param message
     * @return
     */
    private String getExceptionParameter(Exception e, String message) {
        int i = 0;
        Throwable preve = e;
        StringBuilder sb = new StringBuilder(message);
        sb.append(" ");
        while (i < QborrowManagerAction.MAX_EXCEPTION_CAUSEDBY) {
            sb.append(preve.getMessage()).append(" ");
            if (preve.getCause() == null || preve.equals(preve.getCause())) {
                break;
            }
            preve = preve.getCause();
        }
        String string = sb.toString();
        return string;
    }
    
    /**
     * Si occupa di gestire un'eccezione all'interno di una chiamata AJAX. Il metodo si occupa di accodare tra loro tutti i
     * messaggi delle varie eccezioni (recuperate tramite {@link Exception#getCause()}) e di concatenarle fino a un massimo di
     * 20.
     * 
     * Questo metodo non si occupa di loggare l'eccezione (il log deve essere esterno prima di questa chiamata).
     * 
     * In caso di charset non supportato viene loggato un errore a livello FATAL e viene restituito null (sono in una chiamata
     * che si aspetta una risposta JSON che non riesco a gestire, quindi non posso sollevare un'altra eccezione). Per completezza dei
     * log (e per non perdere in nessun caso l'errore) in caso di mancata risposta ri-loggo comunque anche l'eccezione iniziale
     * in modo da non perdermi niente in caso non sia stata loggata prima per errore.
     * 
     * @param message messaggio principale del errore
     * @param e eccezione da serializzare
     * @return la risposta con il JSON di ritorno
     */
    protected String manageException(String message, Exception e) {
        return manageException(message, e, null);
    }
    
    /**
     * Si occupa di gestire un messaggio di errore al client di una chiamata REST
     * 
     * In caso di charset non supportato viene loggato un errore a livello FATAL e viene restituito null (sono in una chiamata
     * che si aspetta una risposta JSON che non riesco a gestire, quindi non posso sollevare un'altra eccezione). Per completezza dei
     * log (e per non perdere in nessun caso l'errore) in caso di mancata risposta ri-loggo comunque anche l'eccezione iniziale
     * in modo da non perdermi niente in caso non sia stata loggata prima per errore.
     * 
     * @param message messaggio principale del errore
     * @return la risposta con il JSON di ritorno
     */
    protected String manageException(String message) {
        return manageException(message, null, null);
    }
    
    /**
     * Si occupa di gestire un'eccezione all'interno di una chiamata AJAX. Il metodo si occupa di accodare tra loro tutti i
     * messaggi delle varie eccezioni (recuperate tramite {@link Exception#getCause()}) e di concatenarle fino a un massimo di
     * 20.
     * 
     * Questo metodo non si occupa di loggare l'eccezione (il log deve essere esterno prima di questa chiamata).
     * 
     * In caso di charset non supportato viene loggato un errore a livello FATAL e viene restituito null (sono in una chiamata
     * che si aspetta una risposta JSON che non riesco a gestire, quindi non posso sollevare un'altra eccezione). Per completezza dei
     * log (e per non perdere in nessun caso l'errore) in caso di mancata risposta ri-loggo comunque anche l'eccezione iniziale
     * in modo da non perdermi niente in caso non sia stata loggata prima per errore.
     * 
     * @param message messaggio principale del errore
     * @param e eccezione da serializzare
     * @param additionalData oggetto con i dati addizionali da serializzare su database
     * @return la risposta con il JSON di ritorno
     */
    protected String manageException(String message, Exception e, Object additionalData) {
        log.error(message, e);
        try {
            String charset = ServletActionContext.getResponse().getCharacterEncoding();
        	String string = "";
        	if(e != null) {
	            string = getExceptionParameter(e, message);
	            try {
	                String context = ServletActionContext.getRequest().getContextPath();
	                ExceptionLogUtils.handleDbLogging(e, message, userContext, context, new Date(System.currentTimeMillis()), frameworkCoreManager, additionalData);
	            } catch (Exception e2) {
	                log.warn("Error on log exception on database", e);
	            }
        	} else {
        		string = message;
        	}
        	string = StringEscapeUtils.escapeJson(string);
            return sendAjaxResponseToClient("{\"error\": true, \"message\": \"" + string + "\"}", charset);
        } catch (UnsupportedEncodingException e1) {
            log.fatal("Error on write JSON message on response. Check log for details!", e1);
            log.fatal("Original error (linked to previous message).", e);
            return null;
        }
    }

    /**
     * Questo metodo si occupa di serializzare un oggetto generico in JSON e inviarlo al client con l'opportuno charser.
     * Attenzione, questo metodo utilizza la deepSerialize quindi non va chiamato se l'oggetto di ritorno ? o contiene dei model
     * con dei getter "intelligenti".
     * 
     * @param o oggetto da inviare al client
     * @return la risposta con il JSON di ritorno
     * @throws UnsupportedEncodingException se la codifica dei caratteri impostata nella response non e' supportata.
     */
    protected String manageDeepSerialize(Object o) throws UnsupportedEncodingException {
        return manageDeepSerialize(o, new JSONSerializer());
    }

    /**
     * Questo metodo si occupa di serializzare un oggetto generico in JSON e inviarlo al client con l'opportuno charser.
     * Attenzione, questo metodo utilizza la deepSerialize quindi non va chiamato se l'oggetto di ritorno ? o contiene dei model
     * con dei getter "intelligenti".
     * 
     * Il secondo parametro di questo metodo permette di passare un serializzatore del oggetto con gli incluede e gli exclude gia'
     * impostati.
     * 
     * @param o oggetto da inviare al client
     * @param s serializzatore da utilizzare
     * @return la risposta con il JSON di ritorno
     * @throws UnsupportedEncodingException se la codifica dei caratteri impostata nella response non e' supportata.
     */
    protected String manageDeepSerialize(Object o, JSONSerializer s) throws UnsupportedEncodingException {
        String jsonString = s.prettyPrint(true).deepSerialize(o);
        String charset = ServletActionContext.getResponse().getCharacterEncoding();
        return sendAjaxResponseToClient(jsonString, charset);
    }

  	/**
     * Questo metodo si occupa di serializzare un oggetto generico in JSON e inviarlo al client con l'opportuno charser.
     * Attenzione, questo metodo utilizza la serialize quindi non va chiamato se l'oggetto di ritorno ? o contiene delle proprieta'
     * multiple.
     *
     * @param o oggetto da inviare al client
     * @return la risposta con il JSON di ritorno
     * @throws UnsupportedEncodingException se la codifica dei caratteri impostata nella response non e' supportata.
     */
    protected String manageSerialize(Object o) throws UnsupportedEncodingException {
        return manageSerialize(o, new JSONSerializer());
    }

    /**
     * Questo metodo si occupa di serializzare un oggetto generico in JSON e inviarlo al client con l'opportuno charser.
     * Attenzione, questo metodo utilizza la serialize quindi non va chiamato se l'oggetto di ritorno ? o contiene delle proprieta'
     * multiple.
     * 
     * Il secondo parametro di questo metodo permette di passare un serializzatore del oggetto con gli incluede e gli exclude gia'
     * impostati.
     * 
     * @param o oggetto da inviare al client
     * @param s serializzatore da utilizzare
     * @return la risposta con il JSON di ritorno
     * @throws UnsupportedEncodingException se la codifica dei caratteri impostata nella response non e' supportata.
     */
    protected String manageSerialize(Object o, JSONSerializer s) throws UnsupportedEncodingException {
        String jsonString = s.prettyPrint(true).serialize(o);
        String charset = ServletActionContext.getResponse().getCharacterEncoding();
        return sendAjaxResponseToClient(jsonString, charset);
    }

    /**
     * Questo metodo si occuppa di fornire la risposta di "OK" standard al client
     * 
     * @return la risposta con il JSON di ritorno
     * @throws UnsupportedEncodingException se la codifica dei caratteri impostata nella response non e' supportata.
     */
    protected String manageOkMessage() throws UnsupportedEncodingException {
        String charset = ServletActionContext.getResponse().getCharacterEncoding();
        return sendAjaxResponseToClient("{\"error\": false, \"message\": \"OK\"}", charset);
    }
		
	/**
     * Questo metodo si occupa di serializzare una serie di errori di validazione all'interno di un json e 
     * restituire la risposta al client
     * @param ics
     * @param task
     * @return
     */
    protected String manageValidationError(Set<InvalidConstraint<?>> ics, String task) {
    	Map<String, Object> manageValidationErrorObject = manageValidationErrorObject(ics, task);
    	try {
        	return manageDeepSerialize(manageValidationErrorObject);
         } catch (UnsupportedEncodingException e1) {
            log.fatal("Error on write JSON message on response. ", e1);
            return null;
        }
    }
    
    /**
     * Questo metodo si occupa di preparare un oggetto con gli errori di validazione pronto per essere serializzato
     * in json. E' utile quando si vogliono restituire, oltre agli errori di validazione anche altri dati.
     * @param ics
     * @param task
     * @return
     */
    protected Map<String, Object> manageValidationErrorObject(Set<InvalidConstraint<?>> ics, String task) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("error", false);
    	map.put("message", "KO");
    	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
    	for (InvalidConstraint<?> ic : ics) {
			String property = ic.getPropertyPath();
			if(property.startsWith(".")) {
				property = property.substring(1);
			}
			String message = ic.getMessage();
			if(message.startsWith("error.")) {
				message = message.substring(6);
			}
			//message = getText(message);
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("property", property);
			m.put("message", message);
			list.add(m);
    	}
    	map.put("errors", list);
    	return map;
    }
    
    /**
     * Questo metodo si occuppa di fornire la risposta di "KO" standard al client
     * 
     * @return la risposta con il JSON di ritorno
     * @throws UnsupportedEncodingException se la codifica dei caratteri impostata nella response non e' supportata.
     */
    protected String manageKoMessage() throws UnsupportedEncodingException {
        String charset = ServletActionContext.getResponse().getCharacterEncoding();
        return sendAjaxResponseToClient("{\"error\": false, \"message\": \"KO\"}", charset);
    }

    public FrameworkCoreManager getFrameworkCoreManager() {
        return frameworkCoreManager;
    }

    public void setFrameworkCoreManager(FrameworkCoreManager frameworkCoreManager) {
        this.frameworkCoreManager = frameworkCoreManager;
    }	
		
	public QborrowUserContext getUserContext() {
		return (QborrowUserContext) super.getUserContext();
	}
	
	public Configuration getConfiguration() {
		return configuration;
	}

	public void setConfiguration(Configuration configuration) {
		this.configuration = configuration;
	}

}