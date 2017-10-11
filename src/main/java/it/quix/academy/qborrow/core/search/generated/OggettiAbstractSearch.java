package it.quix.academy.qborrow.core.search.generated;

import it.quix.framework.core.model.AbstractSearchModel;
import it.quix.framework.core.codegen.annotation.OrderByTypeEnum;
import java.util.Date;
import it.quix.academy.qborrow.core.model.Soggetti;
import java.math.BigInteger;
import it.quix.academy.qborrow.core.search.OggettiSearch;

import it.quix.framework.core.converter.annotation.QcDateTimeType;

/**
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class OggettiAbstractSearch extends AbstractSearchModel{
	 
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

	private String titolo;

	private String descrizione;

	private String immagine;

	private String categoria;

	@QcDateTimeType()
	private Date data_ultima_modificaFrom;

	@QcDateTimeType()
	private Date data_ultima_modificaTo;

	private Soggetti soggetti;

	private String soggetti_username;


	public void clearFilter() {
		id = null;
		titolo = null;
		descrizione = null;
		immagine = null;
		categoria = null;
		data_ultima_modificaFrom = null;
		data_ultima_modificaTo = null;
		soggetti = null;	
		soggetti_username = null;		
	}
	
	public OggettiSearch cloneFilter() {
		OggettiSearch search = new OggettiSearch();
			

		search.setId(id);
		search.setTitolo(titolo);
		search.setDescrizione(descrizione);
		search.setImmagine(immagine);
		search.setCategoria(categoria);
		search.setData_ultima_modificaFrom(data_ultima_modificaFrom);
		search.setData_ultima_modificaTo(data_ultima_modificaTo);
		search.setSoggetti(soggetti);	
		search.setSoggetti_username(soggetti_username);
		return search;
	}
	
	
	/**
	 * Indicates whether some other object is "equal to" this one.
	 * The equals method implements an equivalence relation on non-null object references:
	 * <ul>
	 * 	<li>It is reflexive: for any non-null reference value x, x.equals(x) should return true.</li>
	 *  <li>It is symmetric: for any non-null reference values x and y, x.equals(y) should return true if and
	 *  	only if y.equals(x) returns true.</li>
	 *  <li>It is transitive: for any non-null reference values x, y, and z, if x.equals(y) returns true and y.equals(z) returns true,
	 *  	then x.equals(z) should return true. </li>
	 *  <li>It is consistent: for any non-null reference values x and y, multiple invocations of x.equals(y) consistently return true
	 *  	or consistently return false, provided no information used in equals comparisons on the objects is modified. </li>
	 *  <li>For any non-null reference value x, x.equals(null) should return false. </li>
	 * </ul>
	 * The equals method for class Object implements the most discriminating possible equivalence relation on objects; that is, for
	 * any non-null reference values x and y, this method returns true if and only if x and y refer to the same object (x == y has the value true).
	 * Note that it is generally necessary to override the hashCode method whenever this method is overridden, so as to maintain the general contract
	 * for the hashCode method, which states that equal objects must have equal hash codes.
	 *
	 *  @param obj the reference object with which to compare.
	 *  @return rue if this object is the same as the obj argument; false otherwise.
	 */
	public boolean equals(Object obj) {
		if(obj == null) {
			return false;
		}
		if(getClass() != obj.getClass()) {
			return false;
		}
		OggettiAbstractSearch other = (OggettiAbstractSearch) obj;
		if (id == null) {
			if (other.getId() != null) {
				return false;
			}
		} else if (!id.equals(other.getId())) {
			return false;
		}
		if (titolo == null) {
			if (other.getTitolo() != null) {
				return false;
			}
		} else if (!titolo.equals(other.getTitolo())) {
			return false;
		}
		if (descrizione == null) {
			if (other.getDescrizione() != null) {
				return false;
			}
		} else if (!descrizione.equals(other.getDescrizione())) {
			return false;
		}
		if (immagine == null) {
			if (other.getImmagine() != null) {
				return false;
			}
		} else if (!immagine.equals(other.getImmagine())) {
			return false;
		}
		if (categoria == null) {
			if (other.getCategoria() != null) {
				return false;
			}
		} else if (!categoria.equals(other.getCategoria())) {
			return false;
		}
		if (data_ultima_modificaFrom == null) {
			if (other.getData_ultima_modificaFrom() != null) {
				return false;
			}
		} else if (!data_ultima_modificaFrom.equals(other.getData_ultima_modificaFrom())) {
			return false;
		}
		if (data_ultima_modificaTo == null) {
			if (other.getData_ultima_modificaTo() != null) {
				return false;
			}
		} else if (!data_ultima_modificaTo.equals(other.getData_ultima_modificaTo())) {
			return false;
		}
		if (soggetti == null) {
			if (other.getSoggetti() != null) {
				return false;
			}
		} else if (!soggetti.equals(other.getSoggetti())) {
			return false;
		}		
		if (soggetti_username == null) {
			if (other.getSoggetti_username() != null) {
				return false;
			}
		} else if (!soggetti_username.equals(other.getSoggetti_username())) {
			return false;
		}
		return true;
	}

	/**
	 * Returns a hash code value for the object. 
	 * This method is supported for the benefit of hashtables such as those provided by java.util.Hashtable.
	 * The general contract of hashCode is:
	 * <ul>
	 * 	<li>Whenever it is invoked on the same object more than once during an execution of a Java application, 
	 * 		the hashCode method must consistently return the same integer, provided no information used in equals 
	 *		comparisons on the object is modified. This integer need not remain consistent from one execution 
	 *		of an application to another execution of the same application.</li>
	 *	<li>If two objects are equal according to the equals(Object) method, then calling the hashCode method 
	 *		on each of the two objects must produce the same integer result.</li>
	 *	<li>It is not required that if two objects are unequal according to the equals(java.lang.Object) method, 
	 *		then calling the hashCode method on each of the two objects must produce distinct integer results. 
	 *		However, the programmer should be aware that producing distinct integer results for unequal objects 
	 *		may improve the performance of hashtables.</li>
	 * </ul>
	 * @return a hash code value for this object
	 */
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		
		
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((titolo == null) ? 0 : titolo.hashCode());
		result = prime * result + ((descrizione == null) ? 0 : descrizione.hashCode());
		result = prime * result + ((immagine == null) ? 0 : immagine.hashCode());
		result = prime * result + ((categoria == null) ? 0 : categoria.hashCode());
		result = prime * result + ((data_ultima_modificaFrom == null) ? 0 : data_ultima_modificaFrom.hashCode());
		result = prime * result + ((data_ultima_modificaTo == null) ? 0 : data_ultima_modificaTo.hashCode());
		
		
			
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	/**
	 * Returns a string representation of the object. In general, the toString method returns a string that 
	 * "textually represents" this object. The result should be a concise but informative representation 
	 * that is easy for a person to read.
	 * @return a string representation of the object.
	 */
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append(this.getClass().getName());
		sb.append("(");
		sb.append("id=").append(id);
		sb.append(", ").append("titolo=").append(titolo);	
		sb.append(", ").append("descrizione=").append(descrizione);	
		sb.append(", ").append("immagine=").append(immagine);	
		sb.append(", ").append("categoria=").append(categoria);	
		sb.append(", ").append("data_ultima_modificaFrom=").append(data_ultima_modificaFrom);
		sb.append(", ").append("data_ultima_modificaTo=").append(data_ultima_modificaTo);	
		sb.append(")");
		return sb.toString();
	}
	
	/**
	 * @return the id
	 * @see OggettiSearch#id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 * @see OggettiSearch#id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
		
	
	/**
	 * @return the titolo
	 * @see OggettiSearch#titolo
	 */
	public String getTitolo() {
		return titolo;
	}

	/**
	 * @param titolo the titolo to set
	 * @see OggettiSearch#titolo
	 */
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
		
	
	/**
	 * @return the descrizione
	 * @see OggettiSearch#descrizione
	 */
	public String getDescrizione() {
		return descrizione;
	}

	/**
	 * @param descrizione the descrizione to set
	 * @see OggettiSearch#descrizione
	 */
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
		
	
	/**
	 * @return the immagine
	 * @see OggettiSearch#immagine
	 */
	public String getImmagine() {
		return immagine;
	}

	/**
	 * @param immagine the immagine to set
	 * @see OggettiSearch#immagine
	 */
	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}
		
	
	/**
	 * @return the categoria
	 * @see OggettiSearch#categoria
	 */
	public String getCategoria() {
		return categoria;
	}

	/**
	 * @param categoria the categoria to set
	 * @see OggettiSearch#categoria
	 */
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
		
	
	/**
	 * @return the data_ultima_modificaFrom
	 * @see OggettiSearch#data_ultima_modificaFrom
	 */
	public Date getData_ultima_modificaFrom() {
		return data_ultima_modificaFrom;
	}

	/**
	 * @param data_ultima_modificaFrom the data_ultima_modificaFrom to set
	 * @see OggettiSearch#data_ultima_modificaFrom
	 */
	public void setData_ultima_modificaFrom(Date data_ultima_modificaFrom) {
		this.data_ultima_modificaFrom = data_ultima_modificaFrom;
	}
	
	/**
	 * @return the data_ultima_modificaTo
	 * @see OggettiSearch#data_ultima_modificaTo
	 */
	public Date getData_ultima_modificaTo() {
		return data_ultima_modificaTo;
	}

	/**
	 * @param data_ultima_modificaTo the data_ultima_modificaTo to set
	 * @see OggettiSearch#data_ultima_modificaTo
	 */
	public void setData_ultima_modificaTo(Date data_ultima_modificaTo) {
		this.data_ultima_modificaTo = data_ultima_modificaTo;
	}	
		
	/**
	 * @return the soggetti
	 * @see OggettiSearch#soggetti
	 */
	public Soggetti getSoggetti() {
		return soggetti;
	}

	/**
	 * @param soggetti the soggetti to set
	 * @see OggettiSearch#soggetti
	 */
	public void setSoggetti(Soggetti soggetti) {
		this.soggetti = soggetti;
	}

	
    public String getSoggetti_username(){
    	return soggetti_username;
    }	
    
    public void setSoggetti_username(String soggetti_username){
    	this.soggetti_username = soggetti_username;
    } 
	
    public int orderByManagement(String orderField, OrderByTypeEnum orderType){

    	return order;
    }
		

} 