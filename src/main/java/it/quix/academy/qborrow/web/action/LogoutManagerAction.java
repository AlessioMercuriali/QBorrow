package it.quix.academy.qborrow.web.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import it.quix.framework.web.action.QuixActionSupport;

import it.quix.framework.web.annotation.QsPublic;

@QsPublic
public class LogoutManagerAction extends QuixActionSupport implements ServletRequestAware {

    /**
	 * 
	 */
    private static final long serialVersionUID = 5601539982310895917L;

    private HttpServletRequest request;

    private boolean noRedirect;

    public String execute() {
        request.getSession().invalidate();
        if (noRedirect) {
            return null;
        } else {
            return "index";
        }
    }

    @Override
    public String getValidatedBeanName(String arg0) {
        return null;
    }

    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    public void setNoRedirect(boolean noRedirect) {
        this.noRedirect = noRedirect;
    }

    public boolean isNoRedirect() {
        return noRedirect;
    }
}
