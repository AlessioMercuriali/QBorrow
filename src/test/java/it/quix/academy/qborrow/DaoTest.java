package it.quix.academy.qborrow;

import java.util.Arrays;
import java.util.List;

import junit.framework.Assert;
import it.quix.academy.qborrow.core.dao.SoggettiDAO;
import it.quix.academy.qborrow.core.dao.generated.SoggettiAbstractDAO;
import it.quix.academy.qborrow.core.model.QborrowUserContext;
import it.quix.academy.qborrow.core.model.Soggetti;
import it.quix.academy.qborrow.core.search.SoggettiSearch;
import it.quix.framework.core.exception.DAOCreateException;
import it.quix.framework.core.exception.DAOStoreException;
import it.quix.framework.core.manager.ManagerHolder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.itextpdf.text.io.GetBufferedRandomAccessSource;

public class DaoTest {

    private static Log log = LogFactory.getLog(BaseTest.class);

    protected static ApplicationContext applicationContext;

    @BeforeClass
    public static void setUpClass() throws Exception {

        try {
            String[] contextFileNames = { "qborrow-test-spring.xml" };
            log.debug("loading application contexts=" + Arrays.toString(contextFileNames));
            applicationContext = new ClassPathXmlApplicationContext(contextFileNames);

            QborrowUserContext uc = new QborrowUserContext();
            it.quix.framework.core.manager.UserContextHolder.setUserContext(uc);

            ManagerHolder.setManagerOnThreadLocal("qborrowManager", applicationContext.getBean("qborrowManager"));

        } catch (Exception ex) {
            log.error(ex.getMessage(), ex);
            Assert.assertNull(ex);
        }
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
        applicationContext = null;
    }

    @Test
    public void nuovoSoggetto() {
        Soggetti soggetto = new Soggetti();
        soggetto.setUsername("utente");
        soggetto.setEmail("provaInserimento@prova.it");
        soggetto.setNome("provaNome");
        soggetto.setCognome("provaCognome");
        soggetto.setImmagine("pathimmagine");

        SoggettiDAO insertSoggetto = applicationContext.getBean(SoggettiDAO.class);

        try {
            insertSoggetto.create(soggetto);
        } catch (DAOCreateException e) {
            log.info("Errore query inserimento", e);
        }
    }

    @Test
    public void listaSoggetti() {
        SoggettiDAO soggettiDAO = applicationContext.getBean(SoggettiDAO.class);
        try {
            SoggettiSearch soggettiSearch = new SoggettiSearch();
            List<Soggetti> listaSoggetti = soggettiDAO.getList(soggettiSearch);
            for (Soggetti soggetti : listaSoggetti) {
                log.info(soggetti.toString());
            }
        } catch (Exception e) {
            log.info("errore creazione lista", e);
        }
    }

    @Test
    public void updateSoggetti() {
        Soggetti soggetto = new Soggetti();
        SoggettiSearch soggettiSearch = new SoggettiSearch();
        SoggettiDAO soggettiDAO = applicationContext.getBean(SoggettiDAO.class);
        List<Soggetti> listaSoggetti = soggettiDAO.getList(soggettiSearch);
        if (listaSoggetti != null && listaSoggetti.size() > 0) {
            soggetto = listaSoggetti.get(0);
            soggetto.setEmail("emailCambiata@prova.it");
            try {
                soggettiDAO.update(soggetto);
            } catch (DAOStoreException e) {
                log.info("Errore update", e);
            }
        }
    }

}
