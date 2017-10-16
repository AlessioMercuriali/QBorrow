package it.quix.academy.qborrow.core.model;

import java.io.Serializable;

import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import flexjson.JSON;

import it.quix.academy.qborrow.core.manager.QborrowManager;
import it.quix.framework.core.handler.SysAttributeHandler;
import it.quix.framework.core.manager.ManagerHolder;

import it.quix.framework.core.model.AbstractModel;

public class QborrowAbstractModel extends AbstractModel implements Serializable {

    /**
	 *
	 */
    private static final long serialVersionUID = 1764636486333100576L;

    @Transient
    protected boolean jdbc = false;

    @Transient
    private transient QborrowManager qborrowManager;

    @Transient
    private transient SysAttributeHandler sysAttributeHandler;

    protected static String stringSeparator = "|";

    public QborrowAbstractModel() {
        super();
        this.jdbc = true;
    }

    public QborrowAbstractModel(QborrowManager qborrowManager) {
        super();
        this.jdbc = true;
        this.qborrowManager = qborrowManager;
    }

    public QborrowAbstractModel(boolean jdbc, QborrowManager qborrowManager) {
        super();
        this.jdbc = jdbc;
        this.qborrowManager = qborrowManager;
    }

    @JSON(include = false)
    @XmlTransient
    public boolean isJdbc() {
        return jdbc;
    }

    public void setJdbc(boolean jdbc) {
        this.jdbc = jdbc;
    }

    @JSON(include = false)
    @XmlTransient
    public QborrowManager getQborrowManager() {
        if (qborrowManager != null) {
            return qborrowManager;
        }
        return (QborrowManager) ManagerHolder.getManagerOnThreadLocal("qborrowManager");
    }

    public void setQborrowManager(QborrowManager qborrowManager) {
        this.qborrowManager = qborrowManager;
    }

    @JSON(include = false)
    @XmlTransient
    public SysAttributeHandler getSysAttributeHandler() {
        if (sysAttributeHandler != null) {
            return sysAttributeHandler;
        }
        return (SysAttributeHandler) ManagerHolder.getManagerOnThreadLocal("sysAttributeHandler");
    }

    public void setSysAttributeHandler(SysAttributeHandler sysAttributeHandler) {
        this.sysAttributeHandler = sysAttributeHandler;
    }

}