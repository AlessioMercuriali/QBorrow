package it.quix.academy.qborrow.core.validation;

import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import it.quix.framework.core.model.UserContext;
import it.quix.framework.core.validation.api.InvalidConstraint;
import it.quix.framework.core.validation.InvalidConstraintImpl;

import it.quix.academy.qborrow.core.search.SoggettiSearch;

/**
 * Validator for the SoggettiSearch object.
 * Annotation validation is automatically performed.
 * To add custom validation insert code into customValidation method and fill an InvalidConstraint set.
 *
 * @author Quix CodeGenerator version 03.03.00-SNAPSHOT
 */
public class SoggettiSearchValidator extends QborrowAbstractValidator<SoggettiSearch> {

    private static Log log = LogFactory.getLog(SoggettiSearchValidator.class);

    /**
     * Perform custom validation on a SoggettiSearch object
     * 
     * @param userContext user context of the logged user
     * @param errors set of invalid constraint to fill with this method, if errors are present
     * @param propertyPath the path of the object in the objectGraph. It uses
     *            .notation like user.address[0]e
     * @param soggettiSearch object to validate
     * @param groups group name(s) targeted for validation (default to <code>[blank]</code> means all the validation will be done)
     */
    @Override
    protected void customValidation(UserContext userContext, Set<InvalidConstraint<?>> errors, String propertyPath, SoggettiSearch soggettiSearch,
        String... groups) {
        if (log.isDebugEnabled()) {
            log.debug("Call customValidation method for class SoggettiSearchValidator ");
        }

        // controllo i range, se non sono nulli, devono essere inseriti in modo corretto: soggettiSearch.getData_ultima_modificaFrom() PRIMA di
        // soggettiSearch.getData_ultima_modificaTo()
        if (soggettiSearch.getData_ultima_modificaFrom() != null && soggettiSearch.getData_ultima_modificaTo() != null) {
            if (soggettiSearch.getData_ultima_modificaFrom().after(soggettiSearch.getData_ultima_modificaTo())) {
                InvalidConstraint<SoggettiSearch> ic1 =
                    new InvalidConstraintImpl<SoggettiSearch>(SoggettiSearch.class, "error.dateToBeforeDateFrom", propertyPath + "data_ultima_modificaFrom",
                        soggettiSearch, soggettiSearch.getData_ultima_modificaFrom());
                InvalidConstraint<SoggettiSearch> ic2 =
                    new InvalidConstraintImpl<SoggettiSearch>(SoggettiSearch.class, "error.dateToBeforeDateFrom", propertyPath + "data_ultima_modificaTo",
                        soggettiSearch, soggettiSearch.getData_ultima_modificaTo());
                errors.add(ic1);
                errors.add(ic2);
            }
        }
        // insert here custom validations for SoggettiSearch model
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