package it.quix.academy.qborrow.web.action;

import javax.annotation.Resource;

import it.quix.academy.qborrow.Configuration;
import java.io.UnsupportedEncodingException;

import it.quix.framework.web.action.QuixActionSupport;

import org.apache.struts2.ServletActionContext;

public class HomeManagerAction extends QuixActionSupport {

    /**
	 * 
	 */
    private static final long serialVersionUID = 5601539982310895917L;

    @Resource(name = "configuration")
    protected Configuration configuration;

    public String execute() {
        return "home";
    }

    public String checkSession() throws UnsupportedEncodingException {
        String characterEncoding = ServletActionContext.getRequest().getCharacterEncoding();
        return sendAjaxResponseToClient("OK", characterEncoding);
    }

    @Override
    public String getValidatedBeanName(String arg0) {
        return null;
    }

    public Configuration getConfiguration() {
        return configuration;
    }

    public void setConfiguration(Configuration configuration) {
        this.configuration = configuration;
    }

}
