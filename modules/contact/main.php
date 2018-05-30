<?php

require_once 'inc/vars.php';

if(sanitize_input('continue') === '1' && $formIsValid === true)
{
	require_once 'inc/insert_data.php';

} elseif(isset($_GET['success'])) {

	require_once 'views/success.php';

} else {

	require_once 'views/form.php';
	
	$tags_arr['ex_meta_taga'] .= '<link rel="canonical" href="'.$htmlroot.$contactPageFullUrl.'" />';

}

$tags_arr['mod_view'] .= ($contactFormView) ? $contactFormView : '';

?>