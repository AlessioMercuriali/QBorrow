
package it.quix.academy.qborrow.core.dao;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import it.quix.academy.qborrow.core.dao.generated.SoggettiAbstractDAO;

/**
 * The DAO for Soggetti entity.
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT, generated 11/10/2017 15:17:53
 */
public class SoggettiDAO extends SoggettiAbstractDAO {

	private static Log log = LogFactory.getLog(SoggettiDAO.class);

	public SoggettiDAO(DataSource dataSource) {
		super(dataSource);
		if(log.isDebugEnabled()) {
			log.debug("SoggettiDAO initialized!");
		}
	}


}