package it.quix.academy.qborrow.web.ws;

import it.quix.academy.qborrow.core.model.Oggetti;

import javax.jws.WebService;

@WebService(endpointInterface = "it.quix.academy.qborrow.web.ws.TestWs2")
public class TestWsImpl2 {

    Oggetti oggetto = new Oggetti();

    public Oggetti getResponse() {
        oggetto.setId(2);
        return oggetto;
    }
}
