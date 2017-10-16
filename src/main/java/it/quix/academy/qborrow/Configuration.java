package it.quix.academy.qborrow;

public class Configuration {

    private int rowPerPage;

    private String urlApplication;

    private String urlWsdl;

    private int graphicVersion;

    /**
     * Year used to fill in the fields of type "time of last modification of record"
     */
    private int baseYearForLastUpdateTimeColumn;

    /**
     * Month used to fill in the fields of type "time of last modification of record"
     */
    private int baseMonthForLastUpdateTimeColumn;

    /**
     * Day used to fill in the fields of type "time of last modification of record"
     */
    private int baseDayForLastUpdateTimeColumn;

    public Configuration() {
        super();
    }

    public int getRowPerPage() {
        return rowPerPage;
    }

    public void setRowPerPage(int rowPerPage) {
        this.rowPerPage = rowPerPage;
    }

    public String getUrlApplication() {
        return urlApplication;
    }

    public void setUrlApplication(String urlApplication) {
        this.urlApplication = urlApplication;
    }

    public String getUrlWsdl() {
        return urlWsdl;
    }

    public void setUrlWsdl(String urlWsdl) {
        this.urlWsdl = urlWsdl;
    }

    public int getBaseYearForLastUpdateTimeColumn() {
        return baseYearForLastUpdateTimeColumn;
    }

    public void setBaseYearForLastUpdateTimeColumn(int baseYearForLastUpdateTimeColumn) {
        this.baseYearForLastUpdateTimeColumn = baseYearForLastUpdateTimeColumn;
    }

    public int getBaseMonthForLastUpdateTimeColumn() {
        return baseMonthForLastUpdateTimeColumn;
    }

    public void setBaseMonthForLastUpdateTimeColumn(int baseMonthForLastUpdateTimeColumn) {
        this.baseMonthForLastUpdateTimeColumn = baseMonthForLastUpdateTimeColumn;
    }

    public int getBaseDayForLastUpdateTimeColumn() {
        return baseDayForLastUpdateTimeColumn;
    }

    public void setBaseDayForLastUpdateTimeColumn(int baseDayForLastUpdateTimeColumn) {
        this.baseDayForLastUpdateTimeColumn = baseDayForLastUpdateTimeColumn;
    }

    public int getGraphicVersion() {
        return graphicVersion;
    }

    public void setGraphicVersion(int graphicVersion) {
        this.graphicVersion = graphicVersion;
    }
}
