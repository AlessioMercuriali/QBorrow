package it.quix.academy.qborrow.core.dao.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import it.quix.academy.qborrow.Configuration;
import it.quix.academy.qborrow.core.manager.QborrowManager;
import it.quix.academy.qborrow.core.model.Soggetti;
import it.quix.academy.qborrow.core.search.SoggettiSearch;
import it.quix.framework.core.dao.AbstractJDBCDAO;
import it.quix.framework.core.exception.DAOCreateException;
import it.quix.framework.core.exception.DAODeleteException;
import it.quix.framework.core.exception.DAOFinderException;
import it.quix.framework.core.exception.DAOStoreException;
import it.quix.framework.core.exception.ModelJdbcException;
import it.quix.framework.util.FrameworkStringUtils;
import it.quix.framework.util.exceptions.SystemException;

/**
 * The Abstract DAO for Soggetti entity.
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT, generated 11/10/2017 15:17:53
 */
public abstract class SoggettiAbstractDAO extends AbstractJDBCDAO {

	private static final Log log = LogFactory.getLog(SoggettiAbstractDAO.class);

	@Resource(name="qborrowManager")
	protected QborrowManager qborrowManager;
	
	@Resource(name="configuration")
	protected Configuration configuration;

	public SoggettiAbstractDAO(DataSource dataSource) {
		super(dataSource);
	}

	/**
	 * Create a new record of type Soggetti on table soggetti
	 * 
	 * @param soggetti The Soggetti to create on database
	 * @throws DAOCreateException if no record is created on database
	 */
	public void create(Soggetti soggetti) throws DAOCreateException {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			// Compose the insert query
			StringBuilder query = new StringBuilder(EOL);
			query.append("INSERT INTO soggetti ").append(EOL);
			query.append("   (USERNAME, EMAIL, RAGIONE_SOCIALE, NOME, COGNOME, IMMAGINE, DATA_ULTIMA_MODIFICA) ").append(EOL);
			query.append(" VALUES ").append(EOL);
			query.append(" (?, ?, ?, ?, ?, ?, ?) ").append(EOL);
			
			// Query logging
			if (queryLog.isInfoEnabled()) {
				queryLog.info(query);
			}
			// Get connection
			connection = getConnection();
			// Prepare the statement
			statement = connection.prepareStatement(query.toString());
			//set prePersist
			soggetti.prePersist(configuration);
			// Set the parameters
			int p = 1;
			super.setParameterString(statement, p++, soggetti.getUsername());
			super.setParameterString(statement, p++, soggetti.getEmail());
			super.setParameterString(statement, p++, soggetti.getRagione_sociale());
			super.setParameterString(statement, p++, soggetti.getNome());
			super.setParameterString(statement, p++, soggetti.getCognome());
			super.setParameterString(statement, p++, soggetti.getImmagine());
			super.setParameterDateTime(statement, p++, soggetti.getData_ultima_modifica());

			// Execute the query
			long startTime = System.currentTimeMillis();
			int numberOfCreatedRecord = statement.executeUpdate();
			long endTime = System.currentTimeMillis();
			long time = endTime - startTime;
			String msgTime = FrameworkStringUtils.concat("Query time: ", time);
			if (queryLog.isDebugEnabled()) {
				queryLog.debug(msgTime);
			}
			if (numberOfCreatedRecord < 1) {
				String msg = FrameworkStringUtils.concat("An error occurred creating Soggetti on database. No record created. Number of inserted rows: ", numberOfCreatedRecord);
				if (log.isWarnEnabled()) {
					log.warn(msg); 
				}
				throw new DAOCreateException(msg);
			}
		} catch (SQLException ex) {
			String msg = "Unexpeted error on create Soggetti on database.";
			if (log.isErrorEnabled()) {
				log.error(msg, ex);
			}
			throw new SystemException(msg, ex);
		} finally {
			closeStatement(statement);
			closeConnection(connection);
		}
	}

	/**
	 * Updates a record of type Soggetti on table soggetti
	 * 
	 * @param soggetti The Soggetti to update on database
	 * @throws DAOStoreException if no record is updated on database
	 */
	public void update(Soggetti soggetti) throws DAOStoreException {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			// Compose the update query
			StringBuilder query = new StringBuilder(EOL);
			query.append(" UPDATE soggetti SET ").append(EOL);
			query.append(" email = ? , ragione_sociale = ? , nome = ? , cognome = ? , immagine = ? , data_ultima_modifica = ?  ").append(EOL);
			query.append("  WHERE username = ? ").append(EOL); 
			
			// Query logging
			if (queryLog.isInfoEnabled()) {
				queryLog.info(query);
			}
			// Get connection
			connection = getConnection();
			// Prepare the statement
			statement = connection.prepareStatement(query.toString());
			
			// set preUpdate 
			soggetti.preUpdate(configuration);
			
			// Set the parameters
			int p = 1;
			super.setParameterString(statement, p++, soggetti.getEmail());
			super.setParameterString(statement, p++, soggetti.getRagione_sociale());
			super.setParameterString(statement, p++, soggetti.getNome());
			super.setParameterString(statement, p++, soggetti.getCognome());
			super.setParameterString(statement, p++, soggetti.getImmagine());
			super.setParameterDateTime(statement, p++, soggetti.getData_ultima_modifica());

			// Set the primary key
			super.setParameterString(statement, p++, soggetti.getUsername());

			// Execute the query
			long startTime = System.currentTimeMillis();
			int numberOfUpdatedRecord = statement.executeUpdate();
			long endTime = System.currentTimeMillis();
			long time = endTime - startTime;
			String msgTime = FrameworkStringUtils.concat("Query time: ", time);
			if (queryLog.isDebugEnabled()) {
				queryLog.debug(msgTime);
			}
			if (numberOfUpdatedRecord < 1) {
				String msg = FrameworkStringUtils.concat("Error while updating the record of type Soggetti ", soggetti, " on database. Number of updated rows: ", numberOfUpdatedRecord);
				if (log.isWarnEnabled()) {
					log.warn(msg);
				}
				throw new DAOStoreException(msg);
			}
		} catch (SQLException ex) {
			String msg = FrameworkStringUtils.concat("Unexpeted error during update of record of type Soggetti ", soggetti, " on database.");
			if (log.isErrorEnabled()) {
				log.error(msg, ex);
			}
			throw new SystemException(msg, ex);
		} finally {
			closeStatement(statement);
			closeConnection(connection);
		}
	}
	
	/**
	 * Return true if oldSoggetti and newSoggetti are different
	 * 
	 * @param oldSoggetti first model to compare
	 * @param newSoggetti second model to compare
	 * @return if the first model is different to the second model
	 */
	protected boolean isDirty(Soggetti oldSoggetti, Soggetti newSoggetti) {
		if (oldSoggetti.getUsername() != null && !oldSoggetti.getUsername().equals(newSoggetti.getUsername())) return true;
		if (oldSoggetti.getUsername() == null && newSoggetti.getUsername() != null) return true;
		if (oldSoggetti.getEmail() != null && !oldSoggetti.getEmail().equals(newSoggetti.getEmail())) return true;
		if (oldSoggetti.getEmail() == null && newSoggetti.getEmail() != null) return true;
		if (oldSoggetti.getRagione_sociale() != null && !oldSoggetti.getRagione_sociale().equals(newSoggetti.getRagione_sociale())) return true;
		if (oldSoggetti.getRagione_sociale() == null && newSoggetti.getRagione_sociale() != null) return true;
		if (oldSoggetti.getNome() != null && !oldSoggetti.getNome().equals(newSoggetti.getNome())) return true;
		if (oldSoggetti.getNome() == null && newSoggetti.getNome() != null) return true;
		if (oldSoggetti.getCognome() != null && !oldSoggetti.getCognome().equals(newSoggetti.getCognome())) return true;
		if (oldSoggetti.getCognome() == null && newSoggetti.getCognome() != null) return true;
		if (oldSoggetti.getImmagine() != null && !oldSoggetti.getImmagine().equals(newSoggetti.getImmagine())) return true;
		if (oldSoggetti.getImmagine() == null && newSoggetti.getImmagine() != null) return true;
		if (oldSoggetti.getData_ultima_modifica() != null && !oldSoggetti.getData_ultima_modifica().equals(newSoggetti.getData_ultima_modifica())) return true;
		if (oldSoggetti.getData_ultima_modifica() == null && newSoggetti.getData_ultima_modifica() != null) return true;

		return false;
	}
	
	/**
	 * Update on database the newSoggetti only if is different to the oldSoggetti
	 * 
	 * @param oldSoggetti the old model, used to find difference to the newSoggetti
	 * @param newSoggetti the model to store to database if it is different to oldSoggetti
	 * @throws DAOStoreException if no record is updated on database
	 */
	public void updateIfDirty(Soggetti oldSoggetti, Soggetti newSoggetti) throws DAOStoreException {
		if (isDirty(oldSoggetti, newSoggetti)) {
			update(newSoggetti);
		}
	}
	
	/**
	 * Clone the model pass as parameter into a new model. This method don't copy the toMany fields (List, Set, ...)
	 * 
	 * This method is static to be also called outside of the Manager
	 *  @param soggetti the model to be cloned
	 *  @return the clone of the model pass as parameter
	 */
	public static Soggetti cloneWithoutChildren(Soggetti soggetti) {
		if (!soggetti.isJdbc()) {
			throw new ModelJdbcException("The method SoggettiAbstractDAO.cloneWithoutChildren(Soggetti soggetti) can be executed only on jdbc model. The Soggetti pass as parameter isn't jdbc model.");
		}
		
		Soggetti newSoggetti = new Soggetti();
		newSoggetti.setJdbc(true);
		
		newSoggetti.setQborrowManager(soggetti.getQborrowManager());
		newSoggetti.setUsername(soggetti.getUsername());
		newSoggetti.setEmail(soggetti.getEmail());
		newSoggetti.setRagione_sociale(soggetti.getRagione_sociale());
		newSoggetti.setNome(soggetti.getNome());
		newSoggetti.setCognome(soggetti.getCognome());
		newSoggetti.setImmagine(soggetti.getImmagine());
		newSoggetti.setData_ultima_modifica(soggetti.getData_ultima_modifica());

		return newSoggetti;
	}
	
	/**
	 * Return a record of Soggetti on table soggetti 
	 * 
	 * @param username - username
	 * @return the object Soggetti
	 * @throws DAOFinderException if no record found with passed params
	 */
	public Soggetti get(String username) throws DAOFinderException {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			// Compose the select query
			StringBuilder query = new StringBuilder(EOL);
			query.append("SELECT * FROM soggetti ").append(EOL);
			query.append("WHERE USERNAME = ?  ").append(EOL);
			// Query logging
			if (queryLog.isInfoEnabled()) {
				queryLog.info(query);
			}
			// Get connection
			connection = getConnection();
			// Prepare the statement
			statement = connection.prepareStatement(query.toString());
			// Set the parameters
			int p = 1;
			// Set the primary key
			super.setParameterString(statement, p++, username);
 
			// Execute the query
			long startTime = System.currentTimeMillis();
			rs = statement.executeQuery();
			long endTime = System.currentTimeMillis();
			long time = endTime - startTime;
			String msgTime = FrameworkStringUtils.concat("Query time: ", time);
			if (queryLog.isDebugEnabled()) {
				queryLog.debug(msgTime);
			}
			if (rs.next()) {
				Soggetti soggettiModel = buildModelFromResultSet(rs);
				return soggettiModel;
			}
			throw new DAOFinderException(FrameworkStringUtils.concat("Cannot find Soggetti on database with [username = ",username, "]"));
			
		} catch (SQLException ex) {
			String msg = FrameworkStringUtils.concat("Error on method get(String username) for Soggetti on database with [username = ",username, "]");
			if (log.isErrorEnabled()) {
				log.error(msg);
			}
			throw new SystemException(msg, ex);
		} finally {
			closeResultSet(rs);
			closeStatement(statement);
			closeConnection(connection);
		}
	}
	
	/**
	 * Fill all object (Soggetti) fields from the ResultSet
	 * 
	 * @param rs the ResultSet to copy to the object
	 * @return the Soggetti object
	 * @throws SQLException if any error on retrieve fields from the ResultSet
	 */
	protected Soggetti buildModelFromResultSet(ResultSet rs) throws SQLException {
		return buildModelFromResultSet(rs, qborrowManager);
	}
	
	/**
	 * Fill all object (Soggetti) fields from the ResultSet
	 * 
	 * @param rs the ResultSet to copy to the object
	 * @param qborrowManager the manager to set
	 * @return the Soggetti object
	 * @throws SQLException if any error on retrieve fields from the ResultSet
	 */
	public Soggetti buildModelFromResultSet(ResultSet rs, QborrowManager qborrowManager) throws SQLException {
		Soggetti soggetti = new Soggetti();
		
		soggetti.setJdbc(true);
		soggetti.setQborrowManager(qborrowManager);
		
				soggetti.setUsername(getParameterString(rs, "username"));
		soggetti.setEmail(getParameterString(rs, "email"));
		soggetti.setRagione_sociale(getParameterString(rs, "ragione_sociale"));
		soggetti.setNome(getParameterString(rs, "nome"));
		soggetti.setCognome(getParameterString(rs, "cognome"));
		soggetti.setImmagine(getParameterString(rs, "immagine"));
		soggetti.setData_ultima_modifica(getParameterDate(rs, "data_ultima_modifica"));

		return soggetti;
	}
	
	/**
	 * Delete a record of Soggetti on table soggetti
	 *  
	 * @param username - username
	 *
	 * @throws DAODeleteException if no record deleted
	 */
	public void delete(String username) throws DAODeleteException {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			// Compose the select query
			StringBuilder query = new StringBuilder(EOL);
			query.append("DELETE FROM soggetti ").append(EOL);
			query.append("WHERE USERNAME = ?  ").append(EOL);
			// Query logging
			if (queryLog.isInfoEnabled()) {
				queryLog.info(query);
			}
			// Get connection
			connection = getConnection();
			// Prepare the statement
			statement = connection.prepareStatement(query.toString());
			// Set the parameters
			int p = 1;
			// Set the primary key
			super.setParameterString(statement, p++, username);
 
			// Execute the query
			long startTime = System.currentTimeMillis();
			int numberOfDeletedRecord = statement.executeUpdate();
			long endTime = System.currentTimeMillis();
			long time = endTime - startTime;
			String msgTime = FrameworkStringUtils.concat("Query time: ", time);
			if (queryLog.isDebugEnabled()) {
				queryLog.debug(msgTime);
			}
			if (numberOfDeletedRecord < 1) {
				String msg = FrameworkStringUtils.concat("No record of Soggetti deleted with params [username = ",username,"]");
				if (log.isWarnEnabled()) {
					log.warn(msg);
				}
				throw new DAODeleteException(msg);
			}
		} catch (SQLException ex) {  
			String msg = FrameworkStringUtils.concat("Error during delete records on Soggetti with params [username = ",username,"]"); 
			if (log.isErrorEnabled()) {
				log.error(msg);
			}
			throw new SystemException(msg, ex);
		} finally {
			closeResultSet(rs);
			closeStatement(statement);
			closeConnection(connection);
		}
	}
		
	
    /**
     * Execute the count query on soggetti filtered for searchModel SoggettiSearch
     * 
     * @param SoggettiSearch search model
     * @return nRow the number of records found
     */
	public Long count(SoggettiSearch search) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			// Compose the select query
			StringBuilder query = new StringBuilder(EOL);
			query.append(" SELECT COUNT(*) AS TOT ").append(EOL);
			query.append(" FROM soggetti ").append(EOL);
			query.append(" WHERE 1 = 1 ");
			Map<Integer, Object> parameters = new HashMap<Integer, Object>();
			query.append(getWhereQuery(parameters, search));
			// Query logging
			if (queryLog.isInfoEnabled()) {
				queryLog.info(query);
			}
			// Get connection
			connection = getConnection();
			// Prepare the statement
			statement = connection.prepareStatement(query.toString());
			// Set the parameters
			setParameters(statement, parameters);
			
			// Execute the query
			long startTime = System.currentTimeMillis();
			rs = statement.executeQuery();
			long endTime = System.currentTimeMillis();
			long time = endTime - startTime;
			String msgTime = FrameworkStringUtils.concat("Query time: ", time);
			if (queryLog.isDebugEnabled()) {
				queryLog.debug(msgTime);
			}
			long nRow = 0;
			if (rs.next()) {
				nRow = rs.getLong("TOT");
			}
			return nRow;
		} catch (Exception ex) {
			if (log.isErrorEnabled()) {
				log.error(ex.getMessage(), ex);
			}
			throw new SystemException(ex);
		} finally {
			closeResultSet(rs);
			closeStatement(statement);
			closeConnection(connection);
		}
	}
	
	/**
	 * Retur a list of Soggetti filtered for searchModel SoggettiSearch
	 * 
	 * @param SoggettiSearch search model
	 * @return a list of Soggetti
	 */
	public List<Soggetti> getList(SoggettiSearch search) {
		List<Soggetti> list = new ArrayList<Soggetti>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			// Compose the select query
			StringBuilder query = new StringBuilder(EOL);
			query.append(" SELECT * ").append(EOL);
			query.append(" FROM soggetti ").append(EOL);
			query.append(" WHERE 1= 1 ").append(EOL);
			Map<Integer, Object> parameters = new HashMap<Integer, Object>();
			query.append(getWhereQuery(parameters, search));
			addOrderClause(search, query);
			
			// Query logging
			if (queryLog.isInfoEnabled()) {
				queryLog.info(query);
			}
			// Get connection
			connection = getConnection();
			// Prepare the statement
			statement = connection.prepareStatement(query.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			// Set the parameters
			setParameters(statement, parameters);
			// Execute the query
			long startTime = System.currentTimeMillis();
			rs = statement.executeQuery();
			long endTime = System.currentTimeMillis();
			long time = endTime - startTime;
			String msgTime = FrameworkStringUtils.concat("Query time: ", time);
			if (queryLog.isDebugEnabled()) {
				queryLog.debug(msgTime);
			}
			int count = 0;
			skipFirstRows(rs, search);
			while(rs.next()) {
				Soggetti soggetti = buildModelFromResultSet(rs);
				list.add(soggetti);
				count++;
				if (stopRows(count, search)) {
					break;
				}
			}
			return list;
		} catch (SQLException ex) {
			String msg = "Unexpeted error on find Soggetti  on database.";
			if (log.isErrorEnabled()) {
				log.error(msg, ex);
			}
			throw new SystemException(msg, ex);
		} finally {
			closeResultSet(rs);
			closeStatement(statement);
			closeConnection(connection);
		}
	}
	
	/**
	 * Return the StringBuilder that compose where clause on query
	 * 
	 * @param parameters
	 * @param SoggettiSearch the search model
	 * @return the StringBuilder that compose where clause on query
	 */
	protected StringBuilder getWhereQuery(Map<Integer, Object> parameters, SoggettiSearch search) {
		StringBuilder whereClause = new StringBuilder("");
		int p = 1;
    	if (StringUtils.isNotEmpty(search.getUsername())) {
    		whereClause.append(" AND username ");
    	
    			whereClause.append(" = ? ");
    			parameters.put(new Integer(p), search.getUsername() );
    	
           	
           	p++;
    	}
		
		if (StringUtils.isNotEmpty(search.getEmail())) {
			whereClause.append("AND email  LIKE ? ");
			parameters.put(new Integer(p), "%" + search.getEmail() + "%");
			p++;
		}
		if (StringUtils.isNotEmpty(search.getRagione_sociale())) {
			whereClause.append("AND ragione_sociale  LIKE ? ");
			parameters.put(new Integer(p), "%" + search.getRagione_sociale() + "%");
			p++;
		}
		if (StringUtils.isNotEmpty(search.getNome())) {
			whereClause.append("AND nome  LIKE ? ");
			parameters.put(new Integer(p), "%" + search.getNome() + "%");
			p++;
		}
		if (StringUtils.isNotEmpty(search.getCognome())) {
			whereClause.append("AND cognome  LIKE ? ");
			parameters.put(new Integer(p), "%" + search.getCognome() + "%");
			p++;
		}
		if (StringUtils.isNotEmpty(search.getImmagine())) {
			whereClause.append("AND immagine  LIKE ? ");
			parameters.put(new Integer(p), "%" + search.getImmagine() + "%");
			p++;
		}
		if (search.getData_ultima_modificaFrom() != null) {
			whereClause.append("AND data_ultima_modifica >= ? ");
			parameters.put(new Integer(p), search.getData_ultima_modificaFrom());
			p++;
		}
		if (search.getData_ultima_modificaTo() != null) {
			whereClause.append("AND data_ultima_modifica <= ? ");
			parameters.put(new Integer(p), search.getData_ultima_modificaTo());
			p++;
		} 
		return whereClause;
	}
	
	/**
	 * Return the StringBuilder that compose orderBy clause on query
	 * @param SoggettiSearch the search model
	 * @param the query to order
	 */
	protected void addOrderClause(SoggettiSearch search, StringBuilder query) {
		switch (search.getOrder()) {
 				case 1: 
 					query.append(" ORDER BY username ASC "); 
 					break; 
 				case 2: 
 					query.append(" ORDER BY username DESC "); 
 					break; 
 				case 3: 
 					query.append(" ORDER BY nome ASC "); 
 					break; 
 				case 4: 
 					query.append(" ORDER BY nome DESC "); 
 					break; 
 				case 5: 
 					query.append(" ORDER BY cognome ASC "); 
 					break; 
 				case 6: 
 					query.append(" ORDER BY cognome DESC "); 
 					break; 

    		default:
    			query.append(" ORDER BY username ASC");
    			break;
    	}
	}
	
	protected void skipFirstRows(ResultSet rs, SoggettiSearch search) throws SQLException {
		int offset = (search.getPage() - 1) * search.getRowPerPage();
		if (offset > 0) {
			rs.absolute(offset);
		}
	}

	protected boolean stopRows(int count, SoggettiSearch search) {
		return !(search.getPage() < 0 || count<search.getRowPerPage());
	}
	
	
	public void setQborrowManager(QborrowManager qborrowManager) {
		this.qborrowManager = qborrowManager;
	}
	
	public QborrowManager getQborrowManager() {
		return qborrowManager;
	}

	public void setConfiguration(Configuration configuration) {
		this.configuration = configuration;
	}
	
	public Configuration getConfiguration() {
		return configuration;
	}
		
}