package it.quix.academy.qborrow.web.action;

import java.util.HashSet;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.io.IOException;
import java.io.File;
import java.io.FileOutputStream;
import java.awt.Color;
import java.awt.Font;

import org.zefer.pd4ml.PD4ML;
import org.zefer.pd4ml.PD4PageMark;

import javax.annotation.Resource;

import flexjson.JSONSerializer;
import it.quix.framework.core.validation.InvalidConstraintImpl;
import it.quix.framework.core.validation.api.InvalidConstraint;
import it.quix.framework.core.validation.exception.ValidationException;
import it.quix.academy.qborrow.core.model.Oggetti;
import it.quix.academy.qborrow.core.search.OggettiSearch;
import it.quix.academy.qborrow.core.manager.QborrowManager;
import it.quix.academy.qborrow.core.manager.QborrowException;
// import it.quix.academy.qborrow.core.handler.OggettiHandler;
import it.quix.academy.qborrow.web.action.generated.OggettiAbstractManagerAction;
import it.quix.framework.web.annotation.QwScope;
import it.quix.framework.web.result.IncludeResultAware;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

/**
 * Action class for the Oggetti model.
 * 
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class OggettiManagerAction extends OggettiAbstractManagerAction {

    /**
     * Serial Version UID
     */
    private static final long serialVersionUID = 1L;

    /**
     * Search filters
     */
    private OggettiSearch oggettiSearch = new OggettiSearch();

    /**
     * Log
     */
    private static Log log = LogFactory.getLog(OggettiManagerAction.class);

    public String mieiOggetti() {
        return "mieiOggetti";
    }

    /**
     * Metodo di lista che torna solo i miei oggetti
     * This method find oggetti that satisfy search filters.
     * 
     * @throws QborrowException if an error occurs
     */
    public String listMieiOggetti() throws QborrowException {
        try {
            log.debug("Il mio username è: " + getUserContext().getRealUserDn());
            oggettiSearch.setSoggetti_username(getUserContext().getRealUserDn());
            // Validate the search model
            getQborrowManager().validateOggettiSearch(oggettiSearch);
            // Perform count of record that satisfy search filters
            long total = getQborrowManager().countMieiOggetti(oggettiSearch);
            // If there are results ...
            List<Oggetti> oggettiList = null;
            if (total > 0) {
                // Search the results to display
                do {
                    oggettiList = getQborrowManager().getMieiOggettiList(oggettiSearch);
                    if (oggettiList.isEmpty() && oggettiSearch.getPage() > 0) {
                        if (log.isInfoEnabled()) {
                            log.info("The request page " + oggettiSearch.getPage() + " was empty."
                                + ((oggettiSearch.getPage() > 1) ? " Try with page " + (oggettiSearch.getPage() - 1) + "." : ""));
                        }
                        oggettiSearch.setPage(oggettiSearch.getPage() - 1);
                    }
                } while (0 < oggettiSearch.getPage() && oggettiList.isEmpty());
            }

            // Compose the response
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("list", oggettiList);
            map.put("count", total);
            return manageSerialize(map, new JSONSerializer().include("list"));
        } catch (ValidationException e) {
            return manageValidationError(e.getInvalidConstraints(), "list");
        } catch (Exception e) {
            return manageException("Error on list Oggetti", e);
        }
    }

    public String list() throws QborrowException {
        try {
            // Validate the search model
            getQborrowManager().validateOggettiSearch(oggettiSearch);
            // Perform count of record that satisfy search filters
            long total = getQborrowManager().countOggetti(oggettiSearch);
            // If there are results ...
            List<Oggetti> oggettiList = null;
            if (total > 0) {
                // Search the results to display
                do {
                    oggettiList = getQborrowManager().getOggettiList(oggettiSearch);
                    if (oggettiList.isEmpty() && oggettiSearch.getPage() > 0) {
                        if (log.isInfoEnabled()) {
                            log.info("The request page " + oggettiSearch.getPage() + " was empty."
                                + ((oggettiSearch.getPage() > 1) ? " Try with page " + (oggettiSearch.getPage() - 1) + "." : ""));
                        }
                        oggettiSearch.setPage(oggettiSearch.getPage() - 1);
                    }
                } while (0 < oggettiSearch.getPage() && oggettiList.isEmpty());
            }

            // Compose the response
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("list", oggettiList);
            map.put("count", total);
            return manageSerialize(map, new JSONSerializer().include("list"));
        } catch (ValidationException e) {
            return manageValidationError(e.getInvalidConstraints(), "list");
        } catch (Exception e) {
            return manageException("Error on list Oggetti", e);
        }
    }

    public OggettiSearch getOggettiSearch() {
        return oggettiSearch;
    }

    public void setOggettiSearch(OggettiSearch oggettiSearch) {
        this.oggettiSearch = oggettiSearch;
    }

}
