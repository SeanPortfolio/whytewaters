<?php 
	
//  Initialize variables
$form               = '';
$formIsValid        = false;
$contactFormView    = '';
$contactPageFullUrl = $page_contact->full_url;

//  Create post variables
$firstName            = sanitize_input('first-name');
$lastName             = sanitize_input('last-name');
$emailAddress         = sanitize_input('email-address', FILTER_VALIDATE_EMAIL);
$contactNumber        = sanitize_input('contact-number');
$message              = sanitize_input('message');

$postedCaptcha          = $_POST['g-recaptcha-response'];
$captcha_response_token = $posted_captcha;

/* ==| FETCH ANY GET DATA ============================= */

if($_GET['subject'])
{
	$subject = $_GET['subject'];
}


// validate required fields
if(sanitize_input('continue') === '1')
{
	//  Create error variables
	$firstNameError     = true;
	$lastNameError      = true;
	$emailAddressError  = true;
	$contactNumberError = true;
	$subjectError       = true;
	$messageError       = true;
	$captchaError       = true;
	
	// validate first name
	if(empty($firstName))
	{	
		$firstNameErrorMsg = display_message('First name is required.');
	}
	elseif(!is_alpha($firstName))
	{
		$firstNameErrorMsg = display_message('Invalid first name provided.');
	}
	else
	{
		$firstNameErrorMsg = '';
		$firstNameError     = false;
	}

	// validate last name
	if(empty($lastName))
	{
		$lastNameErrorMsg = display_message('Last name is required.');
	}
	elseif(!is_alpha($lastName))
	{
		$lastNameErrorMsg = display_message('Invalid last name provided.');
	}
	else
	{
		$lastNameErrorMsg = '';
		$lastNameError     = false;
	}

	// validate email address
	if(empty($emailAddress))
	{
		$emailAddressErrorMsg = display_message('Email address is required.');
	}
	elseif(!is_email($emailAddress))
	{
		$emailAddressErrorMsg = display_message('Invalid email provided.');
	}
	else
	{
		$emailAddressErrorMsg = '';
		$emailAddressError     = false;
	}

	// validate Message
	if(empty($message))
	{
		$messageErrorMsg = display_message('Message is required.');
	}
	else
	{
		$messageErrorMsg = '';
		$messageError     = false;
	}

	// validate captcha
	if($postedCaptcha == '')
	{
		$captchaErrorMsg = display_message('Captcha is required.');
	}
	else
	{
		$captchaError     = false;
		$captchaErrorMsg = '';
	}

	if(!$firstNameError && !$lastNameError && !$emailAddressError && !$messageError && !$captchaError)
	{
		$formIsValid = true;
	}
}

?>