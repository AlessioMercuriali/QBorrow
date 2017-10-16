package it.quix.academy.core.pseudo;


import it.quix.framework.core.codegen.annotation.QgListColumnField;
import it.quix.framework.core.codegen.annotation.QgSearchField;
import it.quix.framework.core.converter.annotation.QcDateTimeType;
import it.quix.framework.core.converter.annotation.QcDateType;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Table(name="prestiti")
public class Prestiti{
	
	@Temporal(TemporalType.DATE)
	@QcDateType
	@Column(nullable = false)
	@QgListColumnField
	public Date data_prestito;
	
	@Temporal(TemporalType.TIMESTAMP)
	@QcDateTimeType
	@Column(nullable = false)
	@QgListColumnField
	public Date scadenza_prestito;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "beneficiario")
	@QgSearchField
	public Soggetti soggetti;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "oggetto_prestato")
	@QgSearchField
	public Oggetti oggetti;

	public Date getData_prestito() {
		return data_prestito;
	}

	public void setData_prestito(Date data_prestito) {
		this.data_prestito = data_prestito;
	}

	public Date getScadenza_prestito() {
		return scadenza_prestito;
	}

	public void setScadenza_prestito(Date scadenza_prestito) {
		this.scadenza_prestito = scadenza_prestito;
	}
	
	
}
