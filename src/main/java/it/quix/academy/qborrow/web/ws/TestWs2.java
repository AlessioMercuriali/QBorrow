package it.quix.academy.qborrow.web.ws;
import it.quix.academy.qborrow.core.model.Oggetti;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public interface TestWs2 {
	    @WebMethod
	    public Oggetti getResponse();
}
