package it.quix.academy.qborrow.core.job;

import java.math.BigDecimal;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import it.quix.framework.core.scheduler.AbstractJob;
import it.quix.framework.core.validation.api.InvalidConstraint;
import it.quix.framework.util.exceptions.SystemException;

/**
 * Questa classe si occupa di mostrare come realizzare un job. Partendo da questo stampino
 * uno sviluppatore dovrebbe implementare la logica specifica e cambiare log e commenti
 * 
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class ExampleJob extends AbstractJob {

    private static final Log log = LogFactory.getLog(ExampleJob.class);

    /**
     * Questo metodo deve essere esteso nel job nel caso in cui vi siano delle configurazioni da utilizzare. <br>
     * La prima chiamata che deve fare questo metodo e' la chiamata al metodo della superclasse
     * in questo modo viene valorizzato il campo {@link #jobRunning} che viene poi utilizzato per costruire i codici
     * dei config.
     * 
     * @param jobName nome del job
     * @param errors insieme degli errori di validazione delle configurazioni, restituite all'interfaccia di configurazione del job
     */
    public void initAndValidate(String jobName, Set<InvalidConstraint<?>> errors) {
        super.initAndValidate(jobName, errors);
        // checkExistAndCreateConfigMetadata("configurazioneNumero1", ConfigTypeEnum.String, ConfigStructure.SIGNLE, true, false, false, errors);
        // checkExistAndCreateConfigMetadata("configurazioneNumero2", ConfigTypeEnum.String, ConfigStructure.SIGNLE, true, false, false, errors);
    }

    /**
     * Metodo da implementare con la logica del job
     * 
     * @return true se il job e' terminato correttamente, false o eccezione altrimenti
     */
    @Override
    protected boolean execute() {
        try {
            getJobConfigAsString("configurazioneNumero1", "DEFAULT");
            log.debug("Begin execution of Job " + getJobRunning().getName());
            for (int i = 0; i < 10; i++) {

                // Incremento la percentuale di avanzamento del job
                updateJobExcecutionPct(new BigDecimal(i * 100.0 / 10.0));
                // Controllo il flag di spegnimento controllato del job
                if (checkJobStop()) {
                    break;
                }
            }
            log.debug("Execution of Job " + getJobRunning().getName() + " end successfully.");
            return true;
        } catch (Exception e) {
            log.error("Error on execution of Job " + getJobRunning().getName(), e);
            // Rilancio l'eccezione in modo che venga inserita nella mail di errore del job
            throw new SystemException("Error on execution of Job " + getJobRunning().getName(), e);
        } finally {
            log.debug("End execution of Job " + getJobRunning().getName());
        }
    }

}
