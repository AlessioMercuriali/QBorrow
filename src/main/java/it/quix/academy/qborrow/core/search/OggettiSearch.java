package it.quix.academy.qborrow.core.search;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import it.quix.academy.qborrow.core.search.generated.OggettiAbstractSearch;

public class OggettiSearch extends OggettiAbstractSearch {

    private static Log log = LogFactory.getLog(OggettiSearch.class);

    private static final long serialVersionUID = 7849310619150714324L;

    private Boolean isInPrestato = null;

    public Boolean getIsInPrestato() {
        return isInPrestato;
    }

    public void setIsInPrestato(Boolean isInPrestato) {
        this.isInPrestato = isInPrestato;
    }

}