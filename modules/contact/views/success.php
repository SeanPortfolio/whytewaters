<?php 

$hashedEnquiryId = $_GET['success'];

$isEnquiry = fetch_value("SELECT `id` FROM `enquiry` WHERE MD5(`id`) = '{$hashedEnquiryId}' LIMIT 1");

if($isEnquiry)
{
    $tags_arr['heading'] 	  = 'Success!';
    $tags_arr['introduction'] = '';

	$tags_arr['content'] = '<div class="row">
	    <div class="col-xs-12" style="text-align:center;">
		    <p class="text-success">Thank you for your enquiry. We will get back to you as soon as possible.</p>
		</div>
	</div>';

} else {

	header("Location: $htmlroot/{$page}");
	exit();

}

?>