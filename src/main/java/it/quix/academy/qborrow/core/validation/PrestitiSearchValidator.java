package it.quix.academy.qborrow.core.validation;

import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import it.quix.framework.core.model.UserContext;
import it.quix.framework.core.validation.api.InvalidConstraint;
import it.quix.framework.core.validation.InvalidConstraintImpl;


import it.quix.academy.qborrow.core.search.PrestitiSearch;

/**
 * Validator for the PrestitiSearch object.
 * Annotation validation is automatically performed.
 * To add custom validation insert code into customValidation method and fill an InvalidConstraint set.
 *
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class PrestitiSearchValidator extends QborrowAbstractValidator<PrestitiSearch> {

	private static Log log = LogFactory.getLog(PrestitiSearchValidator.class);

	/**
	 * Perform custom validation on a PrestitiSearch object
	 * 
	 * @param userContext user context of the logged user
	 * @param errors set of invalid constraint to fill with this method, if errors are present
	 * @param propertyPath the path of the object in the objectGraph. It uses
	 *          .notation like user.address[0]e
	 * @param prestitiSearch object to validate 
	 * @param groups group name(s) targeted for validation (default to
	 *          <code>[blank]</code> means all the validation will be done)
	 */
	@Override
	protected void customValidation(UserContext userContext, Set<InvalidConstraint<?>> errors, String propertyPath, PrestitiSearch prestitiSearch, String... groups) {
		if (log.isDebugEnabled()) {
			log.debug("Call customValidation method for class PrestitiSearchValidator ");
		}
		
		//controllo i range, se non sono nulli, devono essere inseriti in modo corretto: prestitiSearch.getData_prestitoFrom() PRIMA di prestitiSearch.getData_prestitoTo()
		if (prestitiSearch.getData_prestitoFrom() != null && prestitiSearch.getData_prestitoTo() != null) {
			if (prestitiSearch.getData_prestitoFrom().after(prestitiSearch.getData_prestitoTo())) {
				InvalidConstraint<PrestitiSearch> ic1 = new InvalidConstraintImpl<PrestitiSearch>(PrestitiSearch.class, "error.dateToBeforeDateFrom", propertyPath + "data_prestitoFrom", prestitiSearch, prestitiSearch.getData_prestitoFrom());
				InvalidConstraint<PrestitiSearch> ic2 = new InvalidConstraintImpl<PrestitiSearch>(PrestitiSearch.class, "error.dateToBeforeDateFrom", propertyPath + "data_prestitoTo", prestitiSearch, prestitiSearch.getData_prestitoTo());
				errors.add(ic1);
				errors.add(ic2);
			}
		}
		//controllo i range, se non sono nulli, devono essere inseriti in modo corretto: prestitiSearch.getScadenza_prestitoFrom() PRIMA di prestitiSearch.getScadenza_prestitoTo()
		if (prestitiSearch.getScadenza_prestitoFrom() != null && prestitiSearch.getScadenza_prestitoTo() != null) {
			if (prestitiSearch.getScadenza_prestitoFrom().after(prestitiSearch.getScadenza_prestitoTo())) {
				InvalidConstraint<PrestitiSearch> ic1 = new InvalidConstraintImpl<PrestitiSearch>(PrestitiSearch.class, "error.dateToBeforeDateFrom", propertyPath + "scadenza_prestitoFrom", prestitiSearch, prestitiSearch.getScadenza_prestitoFrom());
				InvalidConstraint<PrestitiSearch> ic2 = new InvalidConstraintImpl<PrestitiSearch>(PrestitiSearch.class, "error.dateToBeforeDateFrom", propertyPath + "scadenza_prestitoTo", prestitiSearch, prestitiSearch.getScadenza_prestitoTo());
				errors.add(ic1);
				errors.add(ic2);
			}
		}
		// insert here custom validations for PrestitiSearch model
		// after a validation check fail create a new InvalidContraint of the validated type
		// and instantiate an InvalidContraintImpl of the validated type with the error information, es:
		// InvalidConstraint<Type> ic = new InvalidConstraintImpl<Type>(Type.class, message, propertyPath, rootBean, value);
		// where:
		// [message] is the name of a bundle which contains the appropriate error message
		// [propertyPath] is the path from the root bean to the property which generated the error
		// [rootBean] is the root bean being validated
		// [value] is the value of the property which generated the error
		// in the end, add the new invalid constraint to the errors array, es:
		// errors.add(ic);
	}

}