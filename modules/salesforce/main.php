<?php

$salesforceFormView .= <<< HTML
    <p><span class="text-danger"><span class="text-danger">*</span></span> indicates required fields</p>
    <META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=UTF-8">
    <form action="https://webto.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8" method="post" role="form" class="salesforce__form">
    <input type=hidden name="oid" value="00D20000000J9qo">
    <input type=hidden name="retURL" value="https://whytewaters.netzone.nz/signup-thankyou">
        <fieldset>
            <div class="form__group form__group--half form__group--inline {$firstNameErrorCls}">
                <label for="first-name" class="form__control__label">First Name<span class="text-danger">*</span></label>
                <input type="text" id="first_name" value="" class="form__control" name="first_name" tabindex="1" required>
            </div>
            <div class="form__group form__group--half form__group--inline {$lastNameErrorCls}">
                <label for="last-name" class="form__control__label">Last Name<span class="text-danger">*</span></label>
                <input type="text" id="last_name" value="" class="form__control" name="last_name" tabindex="2" required>
            </div>
            <div class="form__group form__group--half form__group--inline {$emailAddressErrorCls}">
                <label for="email-address" class="form__control__label">Email<span class="text-danger">*</span></label>
                <input type="email" id="email" value="" class="form__control" name="email" tabindex="3" required>
            </div>
            <div class="form__group form__group--half form__group--inline">
                <label for="contact-number" class="form__control__label">Company<span class="text-danger">*</span></label>
                <input type="text" id="company" class="form__control" value="" name="company" tabindex="4">
            </div>
            <div class="form__group form__group--full form__group--inline">
                <label for="contact-number" class="form__control__label">Service<span class="text-danger">*</span></label>
                <select class="form__control" id="service" name="service" title="Service" tabindex="5" required>
                    <option value=""></option>
                    <option value="Free Consultation">Free Consultation</option>
                    <option value="Free Trial">Free Trial</option>
                </select>
            </div>
            <div class="form__group text-left">
                <button type="submit" class="btn btn__green text-white" name="continue" value="1" tabindex="8"><strong>Submit</strong></button>
            </div>
        </fieldset>
    </form>
HTML;

$salesforceFormView = <<<HTML
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-8 col-md-offset-2 contact__form__wrapper">
                {$salesforceFormView}    
            </div>                    
        </div>
    </div>
HTML;

$tags_arr['mod_view'] .= $salesforceFormView;

?>