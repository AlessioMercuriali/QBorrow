package it.quix.academy.qborrow.core.dao;

import javax.annotation.Resource;

import it.quix.framework.core.dao.AbstractDaoFactory;

/**
 * DAO Factory class for every model DAO.<br>
 * Uses injection to retrieve all DAO implementation.
 * 
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class DAOFactory extends AbstractDaoFactory {

    /**
     * Dao for Oggetti model.
     * 
     * @see OggettiDAO
     */
    @Resource(name = "oggettiDAO")
    private OggettiDAO oggettiDAO;

    /**
     * Dao for Prestiti model.
     * 
     * @see PrestitiDAO
     */
    @Resource(name = "prestitiDAO")
    private PrestitiDAO prestitiDAO;

    /**
     * Dao for Soggetti model.
     * 
     * @see SoggettiDAO
     */
    @Resource(name = "soggettiDAO")
    private SoggettiDAO soggettiDAO;

    // ///////////////////////////////////////////////////////////////////////////

    /**
     * oggettiDAO getter.
     * 
     * @return the Oggetti DAO implementation
     * @see OggettiDAO
     */
    public OggettiDAO getOggettiDAO() {
        return oggettiDAO;
    }

    /**
     * oggettiDAO setter.
     * 
     * @param oggettiDAO the Oggetti DAO implementation
     * @see OggettiDAO
     */
    public void setOggettiDAO(OggettiDAO oggettiDAO) {
        this.oggettiDAO = oggettiDAO;
    }

    /**
     * prestitiDAO getter.
     * 
     * @return the Prestiti DAO implementation
     * @see PrestitiDAO
     */
    public PrestitiDAO getPrestitiDAO() {
        return prestitiDAO;
    }

    /**
     * prestitiDAO setter.
     * 
     * @param prestitiDAO the Prestiti DAO implementation
     * @see PrestitiDAO
     */
    public void setPrestitiDAO(PrestitiDAO prestitiDAO) {
        this.prestitiDAO = prestitiDAO;
    }

    /**
     * soggettiDAO getter.
     * 
     * @return the Soggetti DAO implementation
     * @see SoggettiDAO
     */
    public SoggettiDAO getSoggettiDAO() {
        return soggettiDAO;
    }

    /**
     * soggettiDAO setter.
     * 
     * @param soggettiDAO the Soggetti DAO implementation
     * @see SoggettiDAO
     */
    public void setSoggettiDAO(SoggettiDAO soggettiDAO) {
        this.soggettiDAO = soggettiDAO;
    }

}
