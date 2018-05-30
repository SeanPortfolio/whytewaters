<?php


require_once "{$classdir}/mobile_detect.php";


$slideshow_view            = '';
$body_cls                  = '';
$freetrial_cta_btn         = '';
$scroll_btn_view           = '';

$is_home_page = ($main_page_id == $page_home->id);

$objMobileDetect = new Mobile_Detect();

$isMobileDevice  = ($objMobileDetect->isMobile() || $objMobileDetect->isTablet());

$browserIsIE = (preg_match('~MSIE|Internet Explorer~i', $_SERVER['HTTP_USER_AGENT']) || (strpos($_SERVER['HTTP_USER_AGENT'], 'Trident/7.0; rv:11.0') !== false));


if(!empty($is_home_page)){

	$scroll_btn_view = <<<HTML
	    <div class="hero__scroll">
	    <span class="hidden-xs hidden-sm"><i class="fa fa-angle-down"></i></span>
	    <span class=" hidden-md hidden-lg"><i class="fa fa-angle-down"></i></span>
	    </div>
HTML;

	if(!empty($page_home->full_url)){

		$freetrial_cta_btn  = '<a href="'.$htmlroot.$page_salesforce->full_url.'" class="btn btn__green text-white">Free Trial</a>';

	}

}

//$youtube_id ='2MpUj-Aua48';

if(!empty($is_home_page) && $youtube_id && empty($browserIsIE) && !$browserIsIE && !$isMobileDevice)
{
	require_once "views/video.php";
}
elseif($slideshow_id  && !$isMobileDevice)
{
	require_once "views/slider.php";
}
elseif(!empty($page_photo))
{
    require_once "views/heroshot.php";
}
else
{
	$body_cls = "no-heroshot";
}


$tags_arr['body_cls'] .= " {$body_cls}";

$tags_arr['slideshow_view'] = $slideshow_view;


?>