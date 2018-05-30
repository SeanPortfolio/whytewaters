<?php

$sqlTourDetails = "SELECT t.`id`,
      t.`booking_engine_url`,
      t.`booking_page_introduction`,
      pmd.`name`,
      pmd.`menu_label`,
      pmd.`url`,
      pmd.`full_url`,
      pmd.`heading`,
      pmd.`introduction`,
      pmd.`short_description`,
      pmd.`photo`,
      pmd.`thumb_photo`
    FROM `tour` t
    LEFT JOIN `page_meta_data` pmd 
      ON(pmd.`id` = t.`page_meta_data_id`)
    WHERE pmd.`url` = '{$segment2}'
      AND pmd.`status` = '" . FLAG_ACTIVE . "'
    LIMIT 1";

$arrTourDetails = fetch_row($sqlTourDetails);

if (!empty($arrTourDetails)) {

    $tourInd = $arrTourDetails['id'];
    $tourMenuLabel = $arrTourDetails['menu_label'];
    $tourPhotoPath = $arrTourDetails['thumb_photo'];
    $tourBookingEngineId = $arrTourDetails['booking_engine_url'];
    $tourfULLUrl = $arrTourDetails['full_url'];
    $tourBookingIntroduction = nl2br($arrTourDetails['booking_page_introduction']);

    if(!isset($_SESSION['booking-session'])) {
        $_SESSION['booking-session'] = [];
    }
    $_SESSION['booking-session']['tour_id'] = $tourInd;
    $_SESSION['booking-session']['tour_key'] = $tourBookingEngineId;

    // SET TEMPLATE VARS
    $tags_arr['heading'] = $arrTourDetails['menu_label'] . ' - Booking Details';
    $tags_arr['introduction'] = '';//nl2br($arrTourDetails['booking_page_introduction']);

    require_once "views/form.php";

}