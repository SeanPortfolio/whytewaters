<?php
session_start();   
require_once ('../utility/config.php');

if(!$c_Connection->Connect())
{
	echo "Database connection failed";
	exit;
}

$request_type = ($_POST) ? $_POST : $_GET;

$action       = sanitize_var($request_type['action']);


getAPIKeys();

switch($action)
{
	case 'fetch-tour-sessions':
		getTourSessions();
	break;
	case 'fetch-session-details':
		getSessionDetails();
	break;
	case 'make-booking':
		makeBooking();
	break;
	case 'apply-promo-code':
		applyPromoCode();
	break;
	case 'update-booking-session':
		updateBookingSession();
	break;
}


function updateBookingSession() {
    $type_key_qty_pairs = $_POST['payload'];
    $subtotals = [];
    $types = [];
    $trip_details = '';

    foreach ($type_key_qty_pairs as $item) {
        $subtotals[$item['typeKey']] = $item['rate'] * $item['qty'];
        if($item['qty'] != 0) {
            $types[$item['typeKey']] = $item['type'];
            $trip_details .= <<<DETAILS
                <p>
                    <span class="session-adult-qty">
                        {$item['qty']}</span> x {$item['type']} @ <span class="session-adult-rate">{$item['rate']}</span> = $<span class="type-subtotal">{$subtotals[$item['typeKey']]}
                    </span>
                </p>
DETAILS;
        }
    }

    $total = array_sum($subtotals);

    $_SESSION['booking-session']['originalData'] = $type_key_qty_pairs;
    $_SESSION['booking-session']['subtotals'] = $subtotals;
    $_SESSION['booking-session']['total'] = $total;
    $_SESSION['booking-session']['types'] = $types;
    $_SESSION['booking-session']['tripDetails'] = $trip_details;
    $_SESSION['booking-session']['totalToPay'] = $total;

    die(json_encode($_SESSION['booking-session']));
}


function getTourSessions(){

	global $objRtbsBooking;

	$data        = array();
	$arrData 	 = array();

	$tourKey 	= sanitize_input('tour');	
	$selDate 	= sanitize_input('date');

	$limit 		= TOUR_SESSION_DAY_LIMIT;

	$selDateObj = ( validate_date($selDate, 'd/m/Y') ) ? DateTime::createFromFormat('d/m/Y', $selDate) : '';
	$selDate 	= $selDateObj->format('Y-m-d');	

	//$objRtbsBooking = new Rtbs\Booking($apiConfig);

    $_SESSION['booking-session']['date'] = $selDate;
    $_SESSION['booking-session']['tour_key'] = $tourKey;

	$arrSessions = $objRtbsBooking->getSessions($tourKey, $selDate, $limit);

	$data['sessions'] = (!empty($arrSessions)) ? $arrSessions : array();
	
	die(json_encode($data));

}


function getSessionDetails(){

	global $objRtbsBooking;

	$data         = array();
	$arrData      = array();

    $tourKey      = sanitize_input('tour');
    $selDate      = sanitize_input('date');
    $sessionIndex = sanitize_input('session', FILTER_VALIDATE_INT);
    $limit        = TOUR_SESSION_DAY_LIMIT;

    $selDateObj   = ( validate_date($selDate, 'd/m/Y') ) ? DateTime::createFromFormat('d/m/Y', $selDate) : '';
    $selDate      = $selDateObj->format('Y-m-d');

    $_SESSION['booking-session']['session'] = $sessionIndex;

	$arrSessions = $objRtbsBooking->getSessions($tourKey, $selDate, $limit);

	$data['session'] = (!empty($arrSessions)) ? $arrSessions[$sessionIndex] : array();

    $_SESSION['booking-session']['timeStamp']    = $data['session']['timeStamp'];
    $_SESSION['booking-session']['formatedDate'] = $data['session']['formatedDate'];
    $_SESSION['booking-session']['time']         = $data['session']['time'];

	$data['isValid'] = true;

	die(json_encode($data));
}


function applyPromoCode()
{
	global $objRtbsBooking;

	$data       = array();
	$isValid    = false;
	$applicable = true;

    $promoCode   = sanitize_input('code');
    $_SESSION['booking-session']['code'] = $promoCode;

    $tourKey   	 = $_SESSION['booking-session']['tour_key'];
    $tourDate    = $_SESSION['booking-session']['date'];

    $promoDetail =  $objRtbsBooking->getPromoCodeDetails($promoCode, $tourKey, $tourDate);

    $total = $_SESSION['booking-session']['total'];
    $_SESSION['booking-session']['promo_key'] = $promoDetail['promo_key'];

    $totalPax = 0;
    $originalData = $_SESSION['booking-session']['originalData'];
    foreach ($originalData as $item) {
        $totalPax += $item['qty'];
    }

	if( !empty($promoDetail) ){
		$isValid    = true;

        $promoDiscount     = floatval($promoDetail['promo_discount']);
        $isFixedAmount     = $promoDetail['promo_is_fixed_amount_for_booking'];
        $isPercentage      = $promoDetail['promo_is_percentage'];
        $isPriceRestricted = $promoDetail['promo_is_price_restricted'];
        $priceKeys         = $promoDetail['price_keys'];
        $minQty            = $promoDetail['promo_min_quantity_required'];

        $applicableQty = 0;
		$applicableTotal = 0;
        $discountAmount = 0;
        $toPayTotal = 0;

        if( $totalPax > 0 ) {
            // SET UNIT COUNT AND UNIT PRICE For Discount Calculation
            if($isPriceRestricted != 0)
            {
                foreach ($originalData as $item) {
                    if(in_array($item['rateKey'], $priceKeys)) {
                        $applicableQty += $item['qty'];
                        $applicableTotal += floatval($item['rate']) * floatval($item['qty']);
                    }
                }
            } else {
                $applicableTotal = $total;
                $applicableQty = $totalPax;
            }

            // Calculation Discount if Units > Min Qty
            if($applicableQty >= $minQty){
                // PROMO APPLIES to all Prices
                if($isFixedAmount == 1 && $isPercentage == 1){
                    $discountAmount = $applicableTotal * $promoDiscount / 100 ;// DISCOUNT in Percentage on BOOKING TOTAL
                } else if($isFixedAmount == 1 && $isPercentage == 0) {
                    $discountAmount = $promoDiscount;// DISCOUNT in Fixed Amount on BOOKING TOTAL
                } else if($isFixedAmount == 0 && $isPercentage == 1) {
                    // DISCOUNT in Percentage on EACH UNIT
                } else if($isFixedAmount == 0 && $isPercentage == 0) {
                    $discountAmount = $applicableQty * $promoDiscount;// DISCOUNT in Fixed Amount on EACH UNIT
                } else {
                    $applicable = false;
                }

                $toPayTotal = $total - $discountAmount;

            } else {
                $toPayTotal = $total;
                $applicable = false;
            }
        }

        $data['total'] = $total;
        $data['totalToPay'] = $toPayTotal;
        $data['discountAmount'] = $discountAmount;
	}

	$data['isValid'] = $isValid;
	$data['applicable'] = $applicable;
	die(json_encode($data));
}

function makeBooking(){

	global $objRtbsBooking;

	$data         = array();
	$isValid      = false;
	$state        = '';
	$message      = '';

	$arrBookingData   = array();

	$tourId           = $_SESSION['booking-session']['tour_id'];
	$tourKey          = $_SESSION['booking-session']['tour_key'];
	$tourDateTime     = $_SESSION['booking-session']['timeStamp'];
	$tourPromoCode	  = $_SESSION['booking-session']['code'];
	$tourPromoCodeKey = $_SESSION['booking-session']['promo_key'];

	$tourDateTimeSQL  = date_create($tourDateTime);
	$tourDateTimeSQL  = date_format($tourDateTimeSQL, "Y-m-d H:i:s");

	$arrBookingData['first_name']       = sanitize_input('first_name');
	$arrBookingData['last_name']        = sanitize_input('last_name');
	$arrBookingData['email_address']    = sanitize_input('email', FILTER_VALIDATE_EMAIL);
	$arrBookingData['phone_number']     = sanitize_input('phone');
	$arrBookingData['message']          = sanitize_input('message');

	$arrBookingData['tour_datetime']    = $tourDateTimeSQL;
	$arrBookingData['promo_code']    	= $tourPromoCode;

	$arrBookingData['tour_subtotal']    = $_SESSION['booking-session']['total'];
	$arrBookingData['tour_total']       = $_SESSION['booking-session']['totalToPay'];

	$arrBookingData['booking_status']   = STATUS_UNCONFIRMED;

	$arrBookingData['booking_date']     = date("Y-m-d H:i:s");
	$arrBookingData['ip_address']       = getenv('REMOTE_ADDR');
	$arrBookingData['tour_id']          = $tourId;

	$newBookingId = insert_row($arrBookingData, 'bookings');

	$originalData = $_SESSION['booking-session']['originalData'];

	$objBooking = new Rtbs\ApiHelper\Models\Booking();

	$objBooking->set_tour_key($tourKey);
	$objBooking->set_datetime($tourDateTime);
	$objBooking->set_promo_key($tourPromoCodeKey);

	$objBooking->set_first_name($arrBookingData['first_name']);
	$objBooking->set_last_name($arrBookingData['last_name']);
	$objBooking->set_email($arrBookingData['email_address']);
	$objBooking->set_phone($arrBookingData['phone_number']);
	$objBooking->set_comment($arrBookingData['message']);

    foreach ($originalData as $item) {
        if($item['qty'] > 0) {
            $bookingHasToursArr = [];
            $bookingHasToursArr['booking_id'] = $newBookingId;
            $bookingHasToursArr['tour_rate'] = $item['rate'];
            $bookingHasToursArr['tour_rate_key'] = $item['rateKey'];
            $bookingHasToursArr['tour_pax_qty'] = $item['qty'];
            insert_row($bookingHasToursArr, 'booking_has_tours');
            $objBooking->add_price_selection_keys($item['rateKey'], $item['qty']);
        }
    }

	$bookingResponse = $objRtbsBooking->make_booking($objBooking);

	if(!empty($bookingResponse)){

	   // GET BOOKING TOKEN HERE
	   $paymentURLPath = parse_url($bookingResponse , PHP_URL_PATH);
	   $paymentURLSegments = explode('/', $paymentURLPath);

	   $bookingToken = $paymentURLSegments[3];

	   // GET BOOKING DETAILS HERE
	   $objBookingDetails = $objRtbsBooking->getBookingDetails($bookingToken);

	   if(!empty($bookingToken)){

	      $bookingExpDateTimeSQL  = date_create($objBookingDetails->valid_until);
	      $bookingExpDateTimeSQL  = date_format($bookingExpDateTimeSQL, "Y-m-d H:i:s");

	      $arrBookingData = array();
	      $arrBookingData['rtbs_payment_url']     = $bookingResponse;
	      $arrBookingData['rtbs_booking_token']   = $bookingToken;
	      $arrBookingData['rtbs_booking_id']      = $objBookingDetails->booking_id;
	      $arrBookingData['booking_status']       = $objBookingDetails->status;
	      $arrBookingData['booking_expiry']       = $bookingExpDateTimeSQL;

	      update_row($arrBookingData,'bookings', "WHERE id = '{$newBookingId}'");

	   }
	}

	$data['paymentURL'] = $bookingResponse;
	$data['isValid']    = true;

	die(json_encode($data));

}	

function getAPIKeys()
{
	global $objRtbsBooking;

	$arrRtbsAccount = fetch_row("SELECT
      `api_request_url`,
      `api_access_key`,
      `api_supplier_key`
    FROM `booking_accounts`
    WHERE `is_live` = '".RTBS_PRODUCTION_MODE."'
    LIMIT 1");

	$rtbsRequestUrl     = $arrRtbsAccount['api_request_url'];
	$rtbsApiKey         = $arrRtbsAccount['api_access_key'];
	$rtbsSupplierKey    = $arrRtbsAccount['api_supplier_key'];

	$apiConfig = array(
		"host"        => $rtbsRequestUrl,
		"key"         => $rtbsApiKey,
		"supplierKey" => $rtbsSupplierKey,
		"pwd" 		  => $rtbsSupplierKey,
	);

	$objRtbsBooking = new Rtbs\Booking($apiConfig);

	return true;

}

?>