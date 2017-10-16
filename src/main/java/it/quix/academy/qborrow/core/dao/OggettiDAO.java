package it.quix.academy.qborrow.core.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import it.quix.academy.qborrow.core.model.Prestiti;
import it.quix.academy.qborrow.core.model.Soggetti;
import it.quix.academy.qborrow.core.dao.generated.OggettiAbstractDAO;
import it.quix.academy.qborrow.core.model.Oggetti;
import it.quix.academy.qborrow.core.search.OggettiSearch;
import it.quix.framework.util.FrameworkStringUtils;
import it.quix.framework.util.exceptions.SystemException;

/**
 * The DAO for Oggetti entity.
 * 
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT, generated 11/10/2017
 *         15:17:53
 */
public class OggettiDAO extends OggettiAbstractDAO {

    private static Log log = LogFactory.getLog(OggettiDAO.class);

    public OggettiDAO(DataSource dataSource) {
        super(dataSource);
        if (log.isDebugEnabled()) {
            log.debug("OggettiDAO initialized!");
        }
    }

    public void init() {
        log.info("OggettiDAO initialized");
    }

    public Long countMieiOggetti(OggettiSearch search) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            // Compose the select query
            StringBuilder query = new StringBuilder(EOL);
            query.append(" SELECT COUNT(*) AS TOT ").append(EOL);
            query.append(" FROM oggetti ").append(EOL);
            query.append(" LEFT JOIN prestiti ON oggetti.proprietario = prestiti.beneficiario ").append(EOL);
            query.append(" LEFT JOIN soggetti ON prestiti.beneficiario = soggetti.username ").append(EOL);
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

    public List<Oggetti> getMieiOggettiList(OggettiSearch search) {
        List<Oggetti> list = new ArrayList<Oggetti>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            // Compose the select query
            StringBuilder query = new StringBuilder(EOL);
            query.append(" SELECT oggetti.*, prestiti.scadenza_prestito, prestiti.beneficiario, soggetti.nome, soggetti.cognome ").append(EOL);
            query.append(" FROM oggetti ").append(EOL);
            query.append(" LEFT JOIN prestiti ON oggetti.proprietario = prestiti.beneficiario ").append(EOL);
            query.append(" LEFT JOIN soggetti ON prestiti.beneficiario = soggetti.username ").append(EOL);
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
            while (rs.next()) {

                Oggetti oggetti = new Oggetti();

                oggetti.setJdbc(true);
                oggetti.setQborrowManager(qborrowManager);

                oggetti.setSoggetti_username(getParameterString(rs, "proprietario"));
                oggetti.setId(getParameterInteger(rs, "id"));
                oggetti.setTitolo(getParameterString(rs, "titolo"));
                oggetti.setDescrizione(getParameterString(rs, "descrizione"));
                oggetti.setImmagine(getParameterString(rs, "immagine"));
                oggetti.setCategoria(getParameterString(rs, "categoria"));
                oggetti.setData_ultima_modifica(getParameterDate(rs, "data_ultima_modifica"));

                if (getParameterString(rs, "beneficiario") != null) {
                    oggetti.setOggettoPrestato(true);
                    Prestiti prestito = new Prestiti();
                    prestito.setScadenza_prestito(getParameterDate(rs, "scadenza_prestito"));

                    Soggetti soggetto = new Soggetti();
                    soggetto.setUsername(getParameterString(rs, "beneficiario"));
                    soggetto.setNome(getParameterString(rs, "nome"));
                    soggetto.setCognome(getParameterString(rs, "cognome"));

                    prestito.setSoggetti(soggetto);
                    oggetti.setPrestito(prestito);
                }

                list.add(oggetti);
                count++;
                if (stopRows(count, search)) {
                    break;
                }
            }
            return list;
        } catch (SQLException ex) {
            String msg = "Unexpeted error on find Oggetti  on database.";
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

    protected StringBuilder getWhereQuery(Map<Integer, Object> parameters, OggettiSearch search) {
        StringBuilder whereClause = new StringBuilder("");
        int p = 1;
        if (search.getId() != null) {
            whereClause.append("AND id = ? ");
            parameters.put(new Integer(p), search.getId());
            p++;
        } else {

        }

        if (StringUtils.isNotEmpty(search.getTitolo())) {
            whereClause.append("AND titolo  LIKE ? ");
            parameters.put(new Integer(p), "%" + search.getTitolo() + "%");
            p++;
        }
        if (StringUtils.isNotEmpty(search.getDescrizione())) {
            whereClause.append("AND descrizione  LIKE ? ");
            parameters.put(new Integer(p), "%" + search.getDescrizione() + "%");
            p++;
        }
        if (StringUtils.isNotEmpty(search.getImmagine())) {
            whereClause.append("AND immagine  LIKE ? ");
            parameters.put(new Integer(p), "%" + search.getImmagine() + "%");
            p++;
        }
        if (StringUtils.isNotEmpty(search.getCategoria())) {
            whereClause.append("AND categoria  LIKE ? ");
            parameters.put(new Integer(p), "%" + search.getCategoria() + "%");
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
        if (search.getSoggetti() != null) {
            whereClause.append("AND proprietario = ?  ");
            parameters.put(new Integer(p), search.getSoggetti().getUsername());
            p++;
        } else {
            if (search.getSoggetti_username() != null) {
                whereClause.append("AND proprietario = ? ");
                parameters.put(new Integer(p), search.getSoggetti_username());
                p++;
            }
            if (search.getIsInPrestato() != null) {
                if (search.getIsInPrestato()) {
                    whereClause.append("AND prestiti.beneficiario is not null");
                } else {
                    whereClause.append("AND prestiti.beneficiario is null");
                }
            }
        }
        return whereClause;

    }

}