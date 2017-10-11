


package it.quix.academy.qborrow;


import it.quix.framework.core.manager.ManagerHolder;
import it.quix.framework.core.model.UserContextHolder;
import it.quix.academy.qborrow.core.model.QborrowUserContext;

import java.util.Arrays;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import junit.framework.Assert;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.support.TransactionSynchronizationManager;

/**
 * BaseTest for jUnit tests.<br>
 * All jUnit classes should inherit from this class.
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class BaseTest {

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

}
