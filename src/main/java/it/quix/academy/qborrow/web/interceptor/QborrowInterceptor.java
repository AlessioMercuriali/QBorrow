package it.quix.academy.qborrow.web.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import it.quix.framework.core.handler.SysAttributeHandler;
import it.quix.framework.core.manager.ManagerHolder;
import it.quix.academy.qborrow.core.manager.QborrowManager;

/**
 *
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class QborrowInterceptor extends AbstractInterceptor {

    /**
     * Serial Version UID
     */
    private static final long serialVersionUID = 1L;

    /**
     * QborrowManager
     */
    private QborrowManager qborrowManager;

    /**
     * SysAttributeHandler
     */
    private SysAttributeHandler sysAttributeHandler;

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        HttpServletRequest request = (HttpServletRequest) invocation.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);

        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
        qborrowManager = (QborrowManager) wac.getBean("qborrowManager");
        sysAttributeHandler = (SysAttributeHandler) wac.getBean("sysAttributeHandler");

        ManagerHolder.setManagerOnThreadLocal("qborrowManager", qborrowManager);
        ManagerHolder.setManagerOnThreadLocal("sysAttributeHandler", sysAttributeHandler);

        return invocation.invoke();
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
     * @see #sysAttributeHandler
     * @return the sysAttributeHandler
     */
    public SysAttributeHandler getSysAttributeHandler() {
        return sysAttributeHandler;
    }

    /**
     * @see #sysAttributeHandler
     * @param sysAttributeHandler the sysAttributeHandler to set
     */
    public void setSysAttributeHandler(SysAttributeHandler sysAttributeHandler) {
        this.sysAttributeHandler = sysAttributeHandler;
    }
}