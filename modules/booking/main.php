<?php

$bookingContentView = '';

$isBookingPage      = ($main_page_id == $page_bookings->id);
$bookingPgUrl		= $page_bookings->full_url;


if( $isBookingPage ){
    
    if(!empty($segment1) && !empty($segment2) && $segment1 === 'giftvoucher') {

        require_once "giftvoucher/index.php";

    } elseif (!empty($segment1) && !empty($segment2) && $segment1 === 'tour') {

    	$bookingFormURL = $bookingPgUrl.'/'.$segment1.'/'.$segment2;
        
        require_once "tourbooking/index.php";
    	
    }else{

    	require_once "list/index.php";

    }
}

$tags_arr['mod_view'] .= $bookingContentView;

?>