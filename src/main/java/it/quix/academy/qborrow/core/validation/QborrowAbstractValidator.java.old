package it.quix.academy.qborrow.core.validation;

import javax.annotation.Resource;

import it.quix.framework.core.validation.AbstractValidator;
import it.quix.framework.core.validation.api.ConstraintFactory;
import it.quix.framework.core.validation.api.ValidatorFactory;

/**
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 * Validate a given object type
 */
public abstract class QborrowAbstractValidator<T> extends AbstractValidator<T> {

	@Resource(name = "constraintFactory")
	private ConstraintFactory constraintFactory;

	@Resource(name = "validatorFactory")
	private ValidatorFactory validatorFactory;

	/**
	 * @see #constraintFactory
	 * @return the constraintFactory
	 */
	public ConstraintFactory getConstraintFactory() {
		return constraintFactory;
	}

	/**
	 * @see #constraintFactory
	 * @param constraintFactory the constraintFactory to set
	 */
	public void setConstraintFactory(ConstraintFactory constraintFactory) {
		this.constraintFactory = constraintFactory;
	}

	/**
	 * @see #validatorFactory
	 * @return the validatorFactory
	 */
	public ValidatorFactory getValidatorFactory() {
		return validatorFactory;
	}

	/**
	 * @see #validatorFactory
	 * @param validatorFactory the validatorFactory to set
	 */
	public void setValidatorFactory(ValidatorFactory validatorFactory) {
		this.validatorFactory = validatorFactory;
	}

}