package it.quix.academy.core.pseudo;

import it.quix.framework.core.codegen.annotation.QgAttribute;
import it.quix.framework.core.codegen.annotation.QgEditField;
import it.quix.framework.core.codegen.annotation.QgLabel;
import it.quix.framework.core.codegen.annotation.QgListColumnField;
import it.quix.framework.core.codegen.annotation.QgSearchField;
import it.quix.framework.core.codegen.annotation.SearchFieldType;
import it.quix.framework.core.converter.annotation.QcDateTimeType;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Table(name="oggetti")
public class Oggetti{
	
	@Id
	@Column(length = 11, nullable = false)
	@QgListColumnField
	public Integer id;
	
	@Column(length = 255)
	@QgLabel(label = "titolo")
	@QgListColumnField
	@QgSearchField
	public String titolo;
	
	@Lob
	@QgListColumnField
	public String descrizione;
	
	@Lob
	@QgListColumnField
	public String immagine;
	
	@Column(length = 255)
	@QgLabel(label = "categoria")
	@QgListColumnField
	@QgAttribute(type = "QBO001_Categoria")
	@QgSearchField
	@QgEditField(editFieldType = SearchFieldType.POPUP_SEARCH_FIELD)
	public String categoria;
	
	@Temporal(TemporalType.TIMESTAMP)
	@QcDateTimeType
	public Date data_ultima_modifica;
	
	@ManyToOne
	@JoinColumn(name = "proprietario")
	public Soggetti soggetti;
}
