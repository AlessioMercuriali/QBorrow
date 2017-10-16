package it.quix.academy.qborrow.mailservice;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class MailServiceCustom {

    private String mittente;

    private String destinatario;

    private String soggetto;

    private String messaggio;

    private MailSender mailSenderCustom;

    private static Log log = LogFactory.getLog(MailServiceCustom.class);

    public void sendEmail(String destinatario, String subject, String messaggio) {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setFrom(this.mittente);
        simpleMailMessage.setTo(destinatario);
        simpleMailMessage.setText(messaggio);
        try {
            mailSenderCustom.send(simpleMailMessage);
        } catch (MailException e) {
            log.info("Non funziono", e);
        }
    }

    public void init() {
        log.info("MailServiceCustom initialized");
    }

    public MailSender getMailSenderCustom() {
        return mailSenderCustom;
    }

    public void setMailSenderCustom(MailSender mailSenderCustom) {
        this.mailSenderCustom = mailSenderCustom;
    }

    public String getMittente() {
        return mittente;
    }

    public void setMittente(String mittente) {
        this.mittente = mittente;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getSoggetto() {
        return soggetto;
    }

    public void setSoggetto(String soggetto) {
        this.soggetto = soggetto;
    }

    public String getMessaggio() {
        return messaggio;
    }

    public void setMessaggio(String messaggio) {
        this.messaggio = messaggio;
    }

}
