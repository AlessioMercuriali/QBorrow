package it.quix.academy.qborrow.web.action;

import it.quix.framework.web.action.QuixActionSupport;

import org.apache.commons.lang.StringUtils;

public class LoginManagerAction extends QuixActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5601539982310895917L;
	
	private String redirectUrl;
	
	public String execute(){
		if (StringUtils.isEmpty(redirectUrl)) {
			return "home";
		} else {
			return "redirect";
		}
	}
	
	@Override
	public String getValidatedBeanName(String arg0) {
		return null;
	}
	
	public String getRedirectUrl() {
		return redirectUrl;
	}
	
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	
}
