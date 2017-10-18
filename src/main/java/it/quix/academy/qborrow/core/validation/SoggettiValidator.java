package it.quix.academy.qborrow.core.validation;

import java.util.Calendar;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import it.quix.framework.core.model.UserContext;
import it.quix.framework.core.validation.api.InvalidConstraint;
import it.quix.framework.core.validation.InvalidConstraintImpl;
import it.quix.academy.qborrow.core.model.Soggetti;
import it.quix.academy.qborrow.core.search.SoggettiSearch;

/**
 * Validator for the Soggetti object.
 * Annotation validation is automatically performed.
 * To add custom validation insert code into customValidation method and fill an InvalidConstraint set.
 *
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class SoggettiValidator extends QborrowAbstractValidator<Soggetti> {

    private static Log log = LogFactory.getLog(SoggettiValidator.class);

    /**
     * Perform custom validation on a Soggetti object
     * 
     * @param userContext user context of the logged user
     * @param errors set of invalid constraint to fill with this method, if errors are present
     * @param propertyPath the path of the object in the objectGraph. It uses
     *            .notation like user.address[0]e
     * @param soggetti object to validate
     * @param groups group name(s) targeted for validation (default to <code>[blank]</code> means all the validation will be done)
     */
    @Override
    protected void customValidation(UserContext userContext, Set<InvalidConstraint<?>> errors, String propertyPath, Soggetti soggetti, String... groups) {
        if (log.isDebugEnabled()) {
            log.debug("Call customValidation method for class SoggettiValidator ");
        } 
        Calendar now = Calendar.getInstance();
        
        Calendar compleanno = Calendar.getInstance();
        compleanno.setTime(soggetti.getData_compleanno());
        
        
        int year = now.get(Calendar.YEAR);
        int annoCompl = compleanno.get(Calendar.YEAR);
        int maggiorenne = year - annoCompl;
        if (maggiorenne < 18) {
            InvalidConstraint<Soggetti> ic1 = new InvalidConstraintImpl<Soggetti>(Soggetti.class, "error.notValid", propertyPath + "data_ultima_modificaFrom", soggetti, soggetti.getData_compleanno());
            InvalidConstraint<Soggetti> ic2 =
                new InvalidConstraintImpl<Soggetti>(Soggetti.class, "error.notValid", propertyPath + "data_compleanno",
                    soggetti, soggetti.getData_compleanno());
            errors.add(ic1);
            errors.add(ic2);
        }
	    if (soggetti.getData_compleanno().after(now.getTime())) {
	        InvalidConstraint<Soggetti> ic1 = new InvalidConstraintImpl<Soggetti>(Soggetti.class, "error.dateToBeforeDateFrom", propertyPath + "data_ultima_modificaFrom", soggetti, soggetti.getData_compleanno());
	        InvalidConstraint<Soggetti> ic2 =
	            new InvalidConstraintImpl<Soggetti>(Soggetti.class, "error.notValid", propertyPath + "data_compleanno",
	                soggetti, soggetti.getData_compleanno());
	        errors.add(ic1);
	        errors.add(ic2);
	    }
        // insert here custom validations for Soggetti model
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