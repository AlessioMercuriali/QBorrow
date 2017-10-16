package it.quix.academy.core.pseudo;


import it.quix.framework.core.codegen.annotation.OrderByTypeEnum;
import it.quix.framework.core.codegen.annotation.QgLabel;
import it.quix.framework.core.codegen.annotation.QgListColumnField;
import it.quix.framework.core.codegen.annotation.QgOrderBy;
import it.quix.framework.core.codegen.annotation.QgSearchField;
import it.quix.framework.core.codegen.annotation.QgSortable;
import it.quix.framework.core.converter.annotation.QcDateTimeType;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Table(name="soggetti")
public class Soggetti{
	@Id
	@Column(length = 50, nullable = false)
	@QgLabel(label = "username")
	@QgListColumnField
	@QgSearchField
	@QgOrderBy(position = 0, type = OrderByTypeEnum.ASC)
	@QgSortable
	public String username;
	
	@Column(length = 100, nullable = false)
	@QgLabel(label = "email")
	@QgSearchField
	@QgListColumnField
	public String email;
	
	@Column(length = 255)
	@QgListColumnField
	@QgLabel(label = "ragione_sociale")
	@QgSearchField
	public String ragione_sociale;
	
	@Column(length = 50)
	@QgLabel(label = "nome")
	@QgListColumnField
	@QgSearchField
	@QgSortable
	public String nome;
	
	@Column(length = 50)
	@QgLabel(label = "cognome")
	@QgListColumnField
	@QgSearchField
	@QgSortable
	public String cognome;
	
	@Lob
	@QgListColumnField
	public String immagine;
	
	@Temporal(TemporalType.TIMESTAMP)
	@QcDateTimeType
	@QgListColumnField
	public Date data_ultima_modifica;
	
	@OneToMany(mappedBy = "proprietario")
	public Set<Oggetti> oggetti;
	
	@OneToMany(mappedBy = "beneficiario")
	public Set<Prestiti> prestiti;
}
