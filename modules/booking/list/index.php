<?php

$arrTours = fetch_all("SELECT t.`id`,
      	FORMAT(t.`price_adults`, 2) AS adult_rate,
      	FORMAT(t.`price_children`, 2) AS child_rate,
            t.`booking_engine_url`,
      	pmd.`menu_label`,
      	pmd.`url`,
      	pmd.`full_url`,
      	pmd.`short_description`,
      	pmd.`photo`,
      	pmd.`thumb_photo`
	FROM `tour` t 
	LEFT JOIN `page_meta_data` pmd ON(pmd.`id` = t.`page_meta_data_id`)
	WHERE pmd.`status` = '".FLAG_ACTIVE."'
	    AND pmd.`menu_label` != ''
	ORDER BY pmd.`rank`");

if (!empty($arrTours)) {

	require_once 'list.php';
	
}

?>