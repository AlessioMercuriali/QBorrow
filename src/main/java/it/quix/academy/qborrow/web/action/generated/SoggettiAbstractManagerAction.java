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
import it.quix.academy.qborrow.core.model.Soggetti;
import it.quix.academy.qborrow.core.model.*;
import it.quix.academy.qborrow.core.search.SoggettiSearch;
import it.quix.academy.qborrow.core.manager.QborrowManager;
import it.quix.academy.qborrow.core.manager.QborrowException;
// import it.quix.academy.qborrow.core.handler.SoggettiHandler;
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
 * Action class for the Soggetti model.
 * 
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class SoggettiAbstractManagerAction extends QborrowManagerAction {

    /**
     * Serial Version UID
     */
    private static final long serialVersionUID = 1L;

    /**
     * Log
     */
    private static Log log = LogFactory.getLog(SoggettiAbstractManagerAction.class);

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
    private SoggettiSearch soggettiSearch = new SoggettiSearch();

    /**
     * Edit model
     */
    private Soggetti soggetti = null;

    /**
     * Method for prepare the list task called if the PrepareInterceptor is applied to the ActionConfig.
     * This method run after injection of value form Session and before injection of parameter from querystring.
     * This method is very useful for any situation where you need to ensure some logic runs before the actual
     * execute method runs.
     */
    public void prepareList() {
        // Read reset parameter. This method is invoked before injection of parameter,
        // this parameter must be read by ActionContext class.
        String[] reset = (String[]) ActionContext.getContext().getParameters().get("reset");
        // if reset = true then reset the search model
        if (reset != null && reset.length > 0 && reset[0].equals("true")) {
            if (log.isInfoEnabled()) {
                log.info("Reset the soggettiSearch model");
            }
            soggettiSearch = new SoggettiSearch();
            soggettiSearch.setRowPerPage(10);
        }
        // if first call the search model must be initialized
        if (soggettiSearch == null) {
            soggettiSearch = new SoggettiSearch();
            soggettiSearch.setRowPerPage(10);
            if (log.isInfoEnabled()) {
                log.info("soggettiSearch initialized");
            }
        }
    }

    /**
     * List task.
     * This method find soggetti that satisfy search filters.
     * 
     * @throws QborrowException if an error occurs
     */
    public String list() throws QborrowException {
        try {
            // Validate the search model
            getQborrowManager().validateSoggettiSearch(soggettiSearch);
            // Perform count of record that satisfy search filters
            long total = getQborrowManager().countSoggetti(soggettiSearch);
            // If there are results ...
            List<Soggetti> soggettiList = null;
            if (total > 0) {
                // Search the results to display
                do {
                    soggettiList = getQborrowManager().getSoggettiList(soggettiSearch);
                    if (soggettiList.isEmpty() && soggettiSearch.getPage() > 0) {
                        if (log.isInfoEnabled()) {
                            log.info("The request page " + soggettiSearch.getPage() + " was empty."
                                + ((soggettiSearch.getPage() > 1) ? " Try with page " + (soggettiSearch.getPage() - 1) + "." : ""));
                        }
                        soggettiSearch.setPage(soggettiSearch.getPage() - 1);
                    }
                } while (0 < soggettiSearch.getPage() && soggettiList.isEmpty());
            }

            // Compose the response
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("list", soggettiList);
            map.put("count", total);
            return manageSerialize(map, new JSONSerializer().include("list"));
        } catch (ValidationException e) {
            return manageValidationError(e.getInvalidConstraints(), "list");
        } catch (Exception e) {
            return manageException("Error on list Soggetti", e);
        }
    }

    /**
     * XLS Export task.
     * This method export all soggetti in xls format.
     * 
     * @throws Exception if an error occurs
     */
    public String exportXls() throws Exception {
        int page = soggettiSearch.getPage();
        soggettiSearch.setPage(-1);
        // retrieve the list from DB
        List<Soggetti> soggettiList = getQborrowManager().getSoggettiList(soggettiSearch);
        long countSoggetti = getQborrowManager().countSoggetti(soggettiSearch);

        // create the file
        File tmpXlsFile = File.createTempFile("SoggettiList", ".xls");
        // populate the file
        ExcelComposer c = new ExcelComposer() {

            @Override
            protected Object translate(Field field, Object value) {
                return super.translate(field, value);
            }
        };

        c.create(getUserContext(), soggettiList, Soggetti.class, "excel.soggetti", "excel.soggetti.name", 1, 2, countSoggetti, soggettiSearch, tmpXlsFile);
        soggettiSearch.setPage(page);
        return sendFileToClient(tmpXlsFile, "application/vnd.ms-excel");
    }

    /**
     * Edit task.
     * This method edit one soggetti instance.
     */
    public String edit() {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            soggetti = getQborrowManager().getSoggetti(soggetti.getUsername());
            return manageSerialize(soggetti);
        } catch (Exception e) {
            return manageException("Error on edit Soggetti", e);
        }
    }

    /**
     * Save task.
     * This method save one soggetti instance.
     */
    public String save() {
        if (soggetti == null) {
            // New Soggetti and all fields are empty. Create a new empty Soggetti to avoid NPE on validators.
            soggetti = new Soggetti();
        }
        try {
            getQborrowManager().saveSoggetti(soggetti);
            return manageOkMessage();
        } catch (ValidationException e) {
            return manageValidationError(e.getInvalidConstraints(), "save");
        } catch (Exception e) {
            return manageException("Error on save Soggetti", e);
        }
    }

    /**
     * Delete task.
     * This method delete one soggetti instance.
     */
    public String delete() {
        try {
            getQborrowManager().deleteSoggetti(soggetti.getUsername());
            return manageOkMessage();
        } catch (Exception e) {
            return manageException("Error on delete Soggetti", e);
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
     * @see #soggettiSearch
     * @return the soggettiSearch
     */
    public SoggettiSearch getSoggettiSearch() {
        return soggettiSearch;
    }

    /**
     * @see #soggettiSearch
     * @param soggettiSearch the soggettiSearch to set
     */
    public void setSoggettiSearch(SoggettiSearch soggettiSearch) {
        this.soggettiSearch = soggettiSearch;
    }

    /**
     * @see #soggetti
     * @return the soggetti
     */
    public Soggetti getSoggetti() {
        return soggetti;
    }

    /**
     * @see #soggetti
     * @param soggetti the soggetti to set
     */
    public void setSoggetti(Soggetti soggetti) {
        this.soggetti = soggetti;
    }
}
