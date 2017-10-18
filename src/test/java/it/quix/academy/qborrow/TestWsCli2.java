package it.quix.academy.qborrow;

import it.quix.academy.qborrow.web.ws.TestWs2;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;

public class TestWsCli2 {

    public static void main(String[] args) throws MalformedURLException {
        URL url = new URL("http://localhost:8083/ws/test2");

        QName qname = new QName("http://ws.web.qborrow.academy.quix.it/", "TestWsImpl2Service");

        Service service = Service.create(url, qname);

        TestWs2 cli = service.getPort(TestWs2.class);

        System.out.println(cli.getResponse());
    }

}
