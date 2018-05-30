<?php

$enquiryData = array();

$enquiryData['first_name']      = $firstName;
$enquiryData['last_name']       = $lastName;
$enquiryData['email_address']   = $emailAddress;
$enquiryData['contact_number']  = $contactNumber;
$enquiryData['comments']        = htmlentities($message);
$enquiryData['status']          = 'A';
$enquiryData['ip_address']      = getenv('REMOTE_ADDR');

$newEnquiryId = insert_row($enquiryData, 'enquiry');

$contactDetails = array();

if ($newEnquiryId) {

	// get new enquiry details from database
	$contactDetails = fetch_row("SELECT  `first_name` AS firstName,
		    `last_name` AS lastName,
		    `email_address` AS emailAddress,
		    `contact_number` AS contactNumber,
		    `comments`,
		    DATE_FORMAT(`date_of_enquiry`, '%e %M %Y @ %h:%i %p') AS dateEnquired
		FROM `enquiry`
		WHERE `id` = '$newEnquiryId'
		LIMIT 1");

	$emailTemplateTags = array();
	
	$emailTemplateTags['emailSubject'] = 'You have received a new enquiry from website.';
	$emailTemplateTags['root']		   = $htmlroot;

	//merge email template tags along with data from database
	$emailTemplateTags = array_merge($emailTemplateTags, $contactDetails);

	// get email template file
	$emailTemplatePath = "{$tmpldir}/email/contact.tmpl";

	$emailTemplate = process_template($emailTemplatePath, $emailTemplateTags);
	
	if ($emailTemplate) {
		
		$companyContactEmail   = ($comp_emails->primaryEmail) ? $comp_emails->primaryEmail : '';

		if ($companyContactEmail) {
		
			// Initiate php mailer class to send email
			require_once "$classdir/class_phpmailer.php";

			// Send Email
			$mail = new PHPMailer();
			
			$mail->IsHTML();
			$mail->AddReplyTo($emailTemplateTags['emailAddress']);
			$mail->AddAddress($companyContactEmail);
			
			if( !empty($comp_emails) )
			{
				foreach ($comp_emails->list as $email)
				{
					$mail->AddCC($email);
				}
			}

			$mail->SetFrom($companyContactEmail);

			$mail->FromName = "{$emailTemplateTags['firstName']} {$emailTemplateTags['lastName']}";
			$mail->Subject  = $emailTemplateTags['emailSubject'];
			
			$mail->msgHTML($emailTemplate);

			$isMailSent = $mail->Send();
			// if email is sent, redirect user to success page

			if( $isMailSent )
			{
				header("Location: {$htmlrootfull}/{$page}?success=".md5($newEnquiryId));
				exit();
			}

		}
	}

}	


?>