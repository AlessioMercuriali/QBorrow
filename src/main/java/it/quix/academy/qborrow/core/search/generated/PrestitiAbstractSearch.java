package it.quix.academy.qborrow.core.search.generated;

import it.quix.framework.core.model.AbstractSearchModel;
import it.quix.framework.core.codegen.annotation.OrderByTypeEnum;
import it.quix.academy.qborrow.core.model.Oggetti;
import java.util.Date;
import it.quix.academy.qborrow.core.model.Soggetti;
import java.math.BigInteger;
import it.quix.academy.qborrow.core.search.PrestitiSearch;

import it.quix.framework.core.converter.annotation.QcDateTimeType;
import it.quix.framework.core.converter.annotation.QcDateType;

/**
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class PrestitiAbstractSearch extends AbstractSearchModel{
	 
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private Soggetti soggetti;

	private String soggetti_username;

	private Oggetti oggetti;

	private Integer oggetti_id;

	@QcDateType()
	private Date data_prestitoFrom;

	@QcDateType()
	private Date data_prestitoTo;

	@QcDateTimeType()
	private Date scadenza_prestitoFrom;

	@QcDateTimeType()
	private Date scadenza_prestitoTo;


	public void clearFilter() {
		soggetti = null;	
		soggetti_username = null;
		oggetti = null;	
		oggetti_id = null;
		data_prestitoFrom = null;
		data_prestitoTo = null;
		scadenza_prestitoFrom = null;
		scadenza_prestitoTo = null;		
	}
	
	public PrestitiSearch cloneFilter() {
		PrestitiSearch search = new PrestitiSearch();
			

		search.setSoggetti(soggetti);	
		search.setSoggetti_username(soggetti_username);
		search.setOggetti(oggetti);	
		search.setOggetti_id(oggetti_id);
		search.setData_prestitoFrom(data_prestitoFrom);
		search.setData_prestitoTo(data_prestitoTo);
		search.setScadenza_prestitoFrom(scadenza_prestitoFrom);
		search.setScadenza_prestitoTo(scadenza_prestitoTo);
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
		PrestitiAbstractSearch other = (PrestitiAbstractSearch) obj;
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
		if (oggetti == null) {
			if (other.getOggetti() != null) {
				return false;
			}
		} else if (!oggetti.equals(other.getOggetti())) {
			return false;
		}	
		if (oggetti_id == null) {
			if (other.getOggetti_id() != null) {
				return false;
			}
		} else if (!oggetti_id.equals(other.getOggetti_id())) {
			return false;
		}
		if (data_prestitoFrom == null) {
			if (other.getData_prestitoFrom() != null) {
				return false;
			}
		} else if (!data_prestitoFrom.equals(other.getData_prestitoFrom())) {
			return false;
		}
		if (data_prestitoTo == null) {
			if (other.getData_prestitoTo() != null) {
				return false;
			}
		} else if (!data_prestitoTo.equals(other.getData_prestitoTo())) {
			return false;
		}
		if (scadenza_prestitoFrom == null) {
			if (other.getScadenza_prestitoFrom() != null) {
				return false;
			}
		} else if (!scadenza_prestitoFrom.equals(other.getScadenza_prestitoFrom())) {
			return false;
		}
		if (scadenza_prestitoTo == null) {
			if (other.getScadenza_prestitoTo() != null) {
				return false;
			}
		} else if (!scadenza_prestitoTo.equals(other.getScadenza_prestitoTo())) {
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
		
		
		result = prime * result + ((soggetti == null) ? 0 : soggetti.hashCode());
		result = prime * result + ((oggetti == null) ? 0 : oggetti.hashCode());
		result = prime * result + ((data_prestitoFrom == null) ? 0 : data_prestitoFrom.hashCode());
		result = prime * result + ((data_prestitoTo == null) ? 0 : data_prestitoTo.hashCode());
		result = prime * result + ((scadenza_prestitoFrom == null) ? 0 : scadenza_prestitoFrom.hashCode());
		result = prime * result + ((scadenza_prestitoTo == null) ? 0 : scadenza_prestitoTo.hashCode());
		
		
			
		result = prime * result + ((soggetti == null) ? 0 : soggetti.hashCode());	
		result = prime * result + ((oggetti == null) ? 0 : oggetti.hashCode());
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
		sb.append("soggetti=").append(soggetti);
		sb.append("oggetti=").append(oggetti);
		sb.append(", ").append("data_prestitoFrom=").append(data_prestitoFrom);
		sb.append(", ").append("data_prestitoTo=").append(data_prestitoTo);	
		sb.append(", ").append("scadenza_prestitoFrom=").append(scadenza_prestitoFrom);
		sb.append(", ").append("scadenza_prestitoTo=").append(scadenza_prestitoTo);	
		sb.append(")");
		return sb.toString();
	}
	
	/**
	 * @return the soggetti
	 * @see PrestitiSearch#soggetti
	 */
	public Soggetti getSoggetti() {
		return soggetti;
	}

	/**
	 * @param soggetti the soggetti to set
	 * @see PrestitiSearch#soggetti
	 */
	public void setSoggetti(Soggetti soggetti) {
		this.soggetti = soggetti;
	}
		
	/**
	 * @return the soggetti_username
	 * @see PrestitiSearch#soggetti_username
	 */
	public String getSoggetti_username() {
		return soggetti_username;
	}

	/**
	 * @param soggetti_username the soggetti_username to set
	 * @see PrestitiSearch#soggetti_username
	 */
	public void setSoggetti_username(String soggetti_username) {
		this.soggetti_username = soggetti_username; 
	}
	
	/**
	 * @return the oggetti
	 * @see PrestitiSearch#oggetti
	 */
	public Oggetti getOggetti() {
		return oggetti;
	}

	/**
	 * @param oggetti the oggetti to set
	 * @see PrestitiSearch#oggetti
	 */
	public void setOggetti(Oggetti oggetti) {
		this.oggetti = oggetti;
	}
		
	/**
	 * @return the oggetti_id
	 * @see PrestitiSearch#oggetti_id
	 */
	public Integer getOggetti_id() {
		return oggetti_id;
	}

	/**
	 * @param oggetti_id the oggetti_id to set
	 * @see PrestitiSearch#oggetti_id
	 */
	public void setOggetti_id(Integer oggetti_id) {
		this.oggetti_id = oggetti_id; 
	}
	
	
	/**
	 * @return the data_prestitoFrom
	 * @see PrestitiSearch#data_prestitoFrom
	 */
	public Date getData_prestitoFrom() {
		return data_prestitoFrom;
	}

	/**
	 * @param data_prestitoFrom the data_prestitoFrom to set
	 * @see PrestitiSearch#data_prestitoFrom
	 */
	public void setData_prestitoFrom(Date data_prestitoFrom) {
		this.data_prestitoFrom = data_prestitoFrom;
	}
	
	/**
	 * @return the data_prestitoTo
	 * @see PrestitiSearch#data_prestitoTo
	 */
	public Date getData_prestitoTo() {
		return data_prestitoTo;
	}

	/**
	 * @param data_prestitoTo the data_prestitoTo to set
	 * @see PrestitiSearch#data_prestitoTo
	 */
	public void setData_prestitoTo(Date data_prestitoTo) {
		this.data_prestitoTo = data_prestitoTo;
	}	
	
	/**
	 * @return the scadenza_prestitoFrom
	 * @see PrestitiSearch#scadenza_prestitoFrom
	 */
	public Date getScadenza_prestitoFrom() {
		return scadenza_prestitoFrom;
	}

	/**
	 * @param scadenza_prestitoFrom the scadenza_prestitoFrom to set
	 * @see PrestitiSearch#scadenza_prestitoFrom
	 */
	public void setScadenza_prestitoFrom(Date scadenza_prestitoFrom) {
		this.scadenza_prestitoFrom = scadenza_prestitoFrom;
	}
	
	/**
	 * @return the scadenza_prestitoTo
	 * @see PrestitiSearch#scadenza_prestitoTo
	 */
	public Date getScadenza_prestitoTo() {
		return scadenza_prestitoTo;
	}

	/**
	 * @param scadenza_prestitoTo the scadenza_prestitoTo to set
	 * @see PrestitiSearch#scadenza_prestitoTo
	 */
	public void setScadenza_prestitoTo(Date scadenza_prestitoTo) {
		this.scadenza_prestitoTo = scadenza_prestitoTo;
	}	
		

	
    public int orderByManagement(String orderField, OrderByTypeEnum orderType){

    	return order;
    }
		

} 