package it.quix.academy.qborrow.core.validation;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;


import javax.annotation.Resource;

import it.quix.framework.core.utils.ReflectionUtils;
import it.quix.framework.core.validation.api.Validator;

/**
 * Validator Factory class for every model and search model.<br>
 * Uses injection to retrieve all Validator implementation.
 *
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class ValidatorFactory implements it.quix.framework.core.validation.api.ValidatorFactory {

	/**
	 * Validator for Oggetti model.
	 * @see OggettiValidator
	 */
	@Resource(name = "oggettiValidator")
	private OggettiValidator oggettiValidator;
	
	/**
	 * Validator for Oggetti search model.
	 * @see OggettiSearchValidator
	 */
	@Resource(name = "oggettiSearchValidator")
	private OggettiSearchValidator oggettiSearchValidator;
	
	/**
	 * Validator for Prestiti model.
	 * @see PrestitiValidator
	 */
	@Resource(name = "prestitiValidator")
	private PrestitiValidator prestitiValidator;
	
	/**
	 * Validator for Prestiti search model.
	 * @see PrestitiSearchValidator
	 */
	@Resource(name = "prestitiSearchValidator")
	private PrestitiSearchValidator prestitiSearchValidator;
	
	/**
	 * Validator for Soggetti model.
	 * @see SoggettiValidator
	 */
	@Resource(name = "soggettiValidator")
	private SoggettiValidator soggettiValidator;
	
	/**
	 * Validator for Soggetti search model.
	 * @see SoggettiSearchValidator
	 */
	@Resource(name = "soggettiSearchValidator")
	private SoggettiSearchValidator soggettiSearchValidator;
	

	/////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Instantiate a Validator.<br>
	 * Call this method to retrieve a right type Validator.
	 * 
	 * @param objectToValidateClass the Class of the object to be validated
	 * @return Returns a new Validator instance for the objectToValidateClass type
	 */
	@SuppressWarnings("unchecked")
	public Validator getInstance(Class objectToValidateClass) {
		Validator validator = null;
		//iterate over all property searching for right type
		Field[] fileds = ReflectionUtils.getFields(this.getClass());
		for (Field field : fileds) {
			if (((ParameterizedType) field.getType().getGenericSuperclass()).getActualTypeArguments()[0].equals(objectToValidateClass)) {
				validator = (Validator) ReflectionUtils.getPropertyValue(this, field.getName());
				break;
			}
		}
		return validator;
	}

	/**
	 * oggettiValidator getter.
	 * @return the Oggetti Validator implementation
	 * @see OggettiValidator
	 */
	public OggettiValidator getOggettiValidator() {
		return oggettiValidator;
	}
	
	/**
	 * oggettiValidator setter.
	 * @param oggettiValidator the Oggetti Validator implementation
	 * @see OggettiValidator
	 */
	public void setOggettiValidator(OggettiValidator oggettiValidator) {
		this.oggettiValidator = oggettiValidator;
	}
	
	/**
	 * oggettiSearchValidator getter.
	 * @return the OggettiSearch Validator implementation
	 * @see OggettiSearchValidator
	 */
	public OggettiSearchValidator getOggettiSearchValidator() {
		return oggettiSearchValidator;
	}
	
	/**
	 * oggettiSearchValidator setter.
	 * @param oggettiSearchValidator the OggettiSearch Validator implementation
	 * @see OggettiSearchValidator
	 */
	public void setOggettiSearchValidator(OggettiSearchValidator oggettiSearchValidator) {
		this.oggettiSearchValidator = oggettiSearchValidator;
	}

	/**
	 * prestitiValidator getter.
	 * @return the Prestiti Validator implementation
	 * @see PrestitiValidator
	 */
	public PrestitiValidator getPrestitiValidator() {
		return prestitiValidator;
	}
	
	/**
	 * prestitiValidator setter.
	 * @param prestitiValidator the Prestiti Validator implementation
	 * @see PrestitiValidator
	 */
	public void setPrestitiValidator(PrestitiValidator prestitiValidator) {
		this.prestitiValidator = prestitiValidator;
	}
	
	/**
	 * prestitiSearchValidator getter.
	 * @return the PrestitiSearch Validator implementation
	 * @see PrestitiSearchValidator
	 */
	public PrestitiSearchValidator getPrestitiSearchValidator() {
		return prestitiSearchValidator;
	}
	
	/**
	 * prestitiSearchValidator setter.
	 * @param prestitiSearchValidator the PrestitiSearch Validator implementation
	 * @see PrestitiSearchValidator
	 */
	public void setPrestitiSearchValidator(PrestitiSearchValidator prestitiSearchValidator) {
		this.prestitiSearchValidator = prestitiSearchValidator;
	}

	/**
	 * soggettiValidator getter.
	 * @return the Soggetti Validator implementation
	 * @see SoggettiValidator
	 */
	public SoggettiValidator getSoggettiValidator() {
		return soggettiValidator;
	}
	
	/**
	 * soggettiValidator setter.
	 * @param soggettiValidator the Soggetti Validator implementation
	 * @see SoggettiValidator
	 */
	public void setSoggettiValidator(SoggettiValidator soggettiValidator) {
		this.soggettiValidator = soggettiValidator;
	}
	
	/**
	 * soggettiSearchValidator getter.
	 * @return the SoggettiSearch Validator implementation
	 * @see SoggettiSearchValidator
	 */
	public SoggettiSearchValidator getSoggettiSearchValidator() {
		return soggettiSearchValidator;
	}
	
	/**
	 * soggettiSearchValidator setter.
	 * @param soggettiSearchValidator the SoggettiSearch Validator implementation
	 * @see SoggettiSearchValidator
	 */
	public void setSoggettiSearchValidator(SoggettiSearchValidator soggettiSearchValidator) {
		this.soggettiSearchValidator = soggettiSearchValidator;
	}


}
