package it.quix.academy.qborrow.core.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import it.quix.academy.qborrow.core.dao.generated.SoggettiAbstractDAO;
import it.quix.academy.qborrow.core.manager.QborrowManager;
import it.quix.academy.qborrow.core.model.Soggetti;
import it.quix.framework.core.exception.DAOCreateException;
import it.quix.framework.core.exception.DAOFinderException;
import it.quix.framework.core.exception.DAOStoreException;
import it.quix.framework.util.FrameworkStringUtils;
import it.quix.framework.util.exceptions.SystemException;

/**
 * The DAO for Soggetti entity.
 * 
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT, generated 11/10/2017 15:17:53
 */
public class SoggettiDAO extends SoggettiAbstractDAO {

    private static Log log = LogFactory.getLog(SoggettiDAO.class);

    public SoggettiDAO(DataSource dataSource) {
        super(dataSource);
        if (log.isDebugEnabled()) {
            log.debug("SoggettiDAO initialized!");
        }
    }

    public Soggetti getConDataCompleanno(String username) throws DAOFinderException {
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
                Soggetti soggettiModel = buildModelFromResultSetConDataCompleanno(rs);
                return soggettiModel;
            }
            throw new DAOFinderException(FrameworkStringUtils.concat("Cannot find Soggetti on database with [username = ", username, "]"));

        } catch (SQLException ex) {
            String msg = FrameworkStringUtils.concat("Error on method get(String username) for Soggetti on database with [username = ", username, "]");
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

    protected Soggetti buildModelFromResultSetConDataCompleanno(ResultSet rs) throws SQLException {
        return buildModelFromResultSetConDataCompleanno(rs, qborrowManager);
    }

    /**
     * Fill all object (Soggetti) fields from the ResultSet
     * 
     * @param rs the ResultSet to copy to the object
     * @param qborrowManager the manager to set
     * @return the Soggetti object
     * @throws SQLException if any error on retrieve fields from the ResultSet
     */
    public Soggetti buildModelFromResultSetConDataCompleanno(ResultSet rs, QborrowManager qborrowManager) throws SQLException {
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
        soggetti.setData_compleanno(getParameterDate(rs, "data_compleanno"));

        return soggetti;
    }

}