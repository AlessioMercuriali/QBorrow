package it.quix.academy.qborrow.web.ws;

import javax.jws.*;

@WebService(endpointInterface = "it.quix.academy.qborrow.web.ws.TestWs")
public class TestWsImpl implements TestWs {

    public String getResponse(String nome) {
        return "response : " + nome;
    }

}
