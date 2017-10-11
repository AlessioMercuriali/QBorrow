package it.quix.academy.qborrow.web.action.generated;  

import java.util.HashSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Set;
import java.io.IOException;
import java.io.File;
import java.io.FileOutputStream;
import java.awt.Color;
import java.awt.Font;

import org.zefer.pd4ml.PD4ML;
import org.zefer.pd4ml.PD4PageMark;

import javax.annotation.Resource;
import it.quix.framework.core.composer.ExcelComposer;
import it.quix.framework.core.exception.DAOFinderException;
import it.quix.framework.core.handler.SysAttributeHandler;
import it.quix.framework.core.model.AttributeView;
import it.quix.framework.core.validation.InvalidConstraintImpl;
import it.quix.framework.core.validation.api.InvalidConstraint;
import it.quix.framework.core.validation.exception.ValidationException;
import it.quix.academy.qborrow.core.model.Prestiti;
import it.quix.academy.qborrow.core.model.*;
import it.quix.academy.qborrow.core.search.PrestitiSearch;
import it.quix.academy.qborrow.core.manager.QborrowManager;
import it.quix.academy.qborrow.core.manager.QborrowException;
//import it.quix.academy.qborrow.core.handler.PrestitiHandler;
import it.quix.academy.qborrow.web.action.QborrowManagerAction;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

import java.util.Date;
import java.lang.reflect.Field;
import java.math.*;

/**
 * Action class for the Prestiti model.
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class PrestitiAbstractManagerAction extends QborrowManagerAction {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Log
	 */
	private static Log log = LogFactory.getLog(PrestitiAbstractManagerAction.class);
	/**
	 * QborrowManager injected by Spring
	 */
	@Resource(name = "qborrowManager")
	private QborrowManager qborrowManager;

	/**
	 * SysAttributeHandler injected by Spring
	 */
	@Resource(name = "sysAttributeHandler")
	private SysAttributeHandler sysAttributeHandler;

	/**
	 * Search filters
	 */
	private PrestitiSearch prestitiSearch = new PrestitiSearch();

	/**
	 * Edit model
	 */
	private Prestiti prestiti = null;

	/**
	 * Method for prepare the list task called if the PrepareInterceptor is applied to the ActionConfig.
	 * This method run after injection of value form Session and before injection of parameter from querystring.
	 * This method is very useful for any situation where you need to ensure some logic runs before the actual 
	 * execute method runs.
	 */
	public void prepareList() {
		// Read reset parameter. This method is invoked before injection of parameter, 
		// this parameter must be read by ActionContext class.
		String [] reset = (String [])ActionContext.getContext().getParameters().get("reset");
		// if reset = true then reset the search model
		if (reset != null && reset.length > 0 && reset[0].equals("true")) {
			if(log.isInfoEnabled()) {
				log.info("Reset the prestitiSearch model");
			}
			prestitiSearch = new PrestitiSearch();
			prestitiSearch.setRowPerPage(10);
		}
		// if first call the search model must be initialized
		if (prestitiSearch == null) {
			prestitiSearch = new PrestitiSearch();
			prestitiSearch.setRowPerPage(10);
			if(log.isInfoEnabled()) {
				log.info("prestitiSearch initialized");
			}
		}
	}

	/**
	 * List task.
	 * This method find prestiti that satisfy search filters.
	 * @throws QborrowException if an error occurs
	 */
	public String list() throws QborrowException {
		try {
			// Validate the search model
			getQborrowManager().validatePrestitiSearch(prestitiSearch);
			// Perform count of record that satisfy search filters
			long total = getQborrowManager().countPrestiti(prestitiSearch);
			// If there are results ...
			List<Prestiti> prestitiList = null;
			if(total > 0){
				// Search the results to display 
				do {
					prestitiList = getQborrowManager().getPrestitiList(prestitiSearch);
					if (prestitiList.isEmpty() && prestitiSearch.getPage() > 0) {
						if(log.isInfoEnabled()) {
							log.info("The request page "+prestitiSearch.getPage()+" was empty."+((prestitiSearch.getPage() > 1)?" Try with page "+(prestitiSearch.getPage() - 1)+".":""));
						}
						prestitiSearch.setPage(prestitiSearch.getPage() - 1);
					}
				} while (0 < prestitiSearch.getPage() && prestitiList.isEmpty());
			} 
			
			// Compose the response
    		Map<String, Object> map = new HashMap<String, Object>();
    		map.put("list", prestitiList);
    		map.put("count", total);
    		return manageSerialize(map, new JSONSerializer().include("list"));
    	} catch (ValidationException e) {
    		return manageValidationError(e.getInvalidConstraints(), "list");
	    } catch (Exception e) {
	        return manageException("Error on list Prestiti", e);
	    }
	}
	
	/**
	 * XLS Export task.
	 * This method export all prestiti in xls format.
	 * @throws Exception if an error occurs
	 */
	public String exportXls() throws Exception {
		int page = prestitiSearch.getPage();
		prestitiSearch.setPage(-1);
		//retrieve the list from DB
		List<Prestiti> prestitiList = getQborrowManager().getPrestitiList(prestitiSearch);
		long countPrestiti = getQborrowManager().countPrestiti(prestitiSearch);
		
		//create the file
		File tmpXlsFile = File.createTempFile("PrestitiList", ".xls"); 
		//populate the file
		ExcelComposer c = new ExcelComposer() {

			@Override
			protected Object translate(Field field, Object value) {
				return super.translate(field, value);
			}
		};

		c.create(getUserContext(), prestitiList, Prestiti.class, "excel.prestiti", "excel.prestiti.name", 1, 2, countPrestiti, prestitiSearch, tmpXlsFile);
		prestitiSearch.setPage(page);
		return sendFileToClient(tmpXlsFile, "application/vnd.ms-excel");
	}
	
	/**
	 * Edit task.
	 * This method edit one prestiti instance.
	 */
	public String edit() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			prestiti = getQborrowManager().getPrestiti(prestiti.getSoggetti_username(), prestiti.getOggetti_id());
    		return manageSerialize(prestiti);
	    } catch (Exception e) {
	        return manageException("Error on edit Prestiti", e);
	    }
	}
	
	/**
	 * Save task.
	 * This method save one prestiti instance.
	 */
	public String save() {
		if(prestiti == null) {
    		// New Prestiti and all fields are empty. Create a new empty Prestiti to avoid NPE on validators.
    		prestiti = new Prestiti();
    	}
		try {
			getQborrowManager().savePrestiti(prestiti);
			return manageOkMessage();
		} catch (ValidationException e) {
    		return manageValidationError(e.getInvalidConstraints(), "save");
	    } catch (Exception e) {
	        return manageException("Error on save Prestiti", e);
	    }
	} 
	
	/**
	 * Delete task.
	 * This method delete one prestiti instance.
	 */
	public String delete() {
		try {
			getQborrowManager().deletePrestiti(prestiti.getSoggetti_username(), prestiti.getOggetti_id());
			return manageOkMessage();
  		} catch (Exception e) {
	        return manageException("Error on delete Prestiti", e);
	    }
	}
	
	/**
	 * @see #qborrowManager
	 * @return the qborrowManager
	 */
	public QborrowManager getQborrowManager() {
		return qborrowManager;
	}

	/**
	 * @see #qborrowManager
	 * @param qborrowManager the qborrowManager to set
	 */
	public void setQborrowManager(QborrowManager qborrowManager) {
		this.qborrowManager = qborrowManager;
	}
	
	/**
	 * @see #SysAttributeHandler
	 * @return the SysAttributeHandler
	 */
	public SysAttributeHandler getSysAttributeHandler() {
		return sysAttributeHandler;
	}

	/**
	 * @see #SysAttributeHandler
	 * @param sysAttributeHandler the SysAttributeHandler to set
	 */
	public void setSysAttributeHandler(SysAttributeHandler sysAttributeHandler) {
		this.sysAttributeHandler = sysAttributeHandler;
	}

	/**
	 * @see #prestitiSearch
	 * @return the prestitiSearch
	 */
	public PrestitiSearch getPrestitiSearch() {
		return prestitiSearch;
	}

	/**
	 * @see #prestitiSearch
	 * @param prestitiSearch the prestitiSearch to set
	 */
	public void setPrestitiSearch(PrestitiSearch prestitiSearch) {
		this.prestitiSearch = prestitiSearch;
	}
	
	/**
	 * @see #prestiti
	 * @return the prestiti
	 */
	public Prestiti getPrestiti() {
		return prestiti;
	}

	/**
	 * @see #prestiti
	 * @param prestiti the prestiti to set
	 */
	public void setPrestiti(Prestiti prestiti) {
		this.prestiti = prestiti;
	}
}
