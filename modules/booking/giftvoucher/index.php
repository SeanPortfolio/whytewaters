<?php

$sqlTourDetails = "SELECT t.`id`,
      t.`gift_voucher_url`,
      pmd.`name`,
      pmd.`menu_label`,
      pmd.`full_url`,
      pmd.`heading`
    FROM `tour` t
    LEFT JOIN `page_meta_data` pmd 
    	ON(pmd.`id` = t.`page_meta_data_id`)
    WHERE pmd.`url` = '{$segment2}'
      AND pmd.`status` = '".FLAG_ACTIVE."'
    LIMIT 1";

$arrTourDetails = fetch_row($sqlTourDetails);

if(!empty($arrTourDetails)) {

	$tourMenuLabel            = $arrTourDetails['menu_label'];
	$tourGiftVoucherUrl       = $arrTourDetails['gift_voucher_url'];
	$tourfULLUrl              = $arrTourDetails['full_url'];
	
	// SET TEMPLATE VARS	
	$tags_arr['heading']      = $arrTourDetails['menu_label'].' - Voucher';
	$tags_arr['introduction'] = '';

	$contactPgUrl = $page_contact->full_url;
	$btnEnquire   = (!empty($contactPgUrl)) ? '<a href="'.$contactPgUrl.'?subject=Enquiry about tour '.$tourMenuLabel.'" class="btn btn--ghost">Enquire</a>' : '';

	$tags_arr['heading_after_view']        = '<div class="btn__group">
			<a href="'.$tourfULLUrl.'" class="btn btn__gold">Explore</a>
			'.$btnEnquire.'
		</div>';

	$bookingContentView = <<<HTML
		<section class="section">
	        <div class="container">
	          <div class="row">
                    <div class="col-xs-12 text-center">             
						<iframe src="{$tourGiftVoucherUrl}" style="width: 100%; height:1000px; opacity: 1; visibility: visible;" frameborder="0"></iframe>
					</div>
				</div>
			</div>
		</section>
HTML;

}

?>