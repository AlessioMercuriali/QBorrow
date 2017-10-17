package it.quix.academy.qborrow.web.ws;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public interface TestWs {

    @WebMethod
    public String getResponse(String nome);
}
