package it.quix.academy.qborrow;

import it.quix.academy.qborrow.web.ws.TestWsImpl2;

import javax.xml.ws.Endpoint;

public class PubTestWs2 {

    public static void main(String[] args) {
        Endpoint.publish("http://localhost:8083/ws/test2", new TestWsImpl2());
    }
}
