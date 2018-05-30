<?php

###############################################################################################################################
## CLASS FOR RTBS booking engine
###############################################################################################################################

namespace Rtbs;

use Rtbs\ApiHelper\BookingServiceImpl AS BookingServiceImpl;

class Booking extends BookingServiceImpl
{

	/**
   	* @var var - Sets Suppplier Object
   	*/

	public $supplier;
	public $config;


	public function __construct(array $config, $xdebugKey = null)
	{	
		global $rootfull, $rootadmin, $root, $upload_dir;

		parent::__construct($config, $xdebugKey);

		$this->supplier = $this->get_supplier($config['supplierKey']);
		$this->config = $config;

	}
	

	public function getSessions($tourKey, $fromDate,$limit)
	{
		$arrSessions    = array();
		$arrSessionData = array();

		$supplierObj = $this->supplier;
		$supplierKey = $supplierObj->get_supplier_key();
		
		$arrSessionsObj = $this->get_sessions_and_advance_dates($supplierKey, array($tourKey), $fromDate, false, $limit);
		
		if(!empty($arrSessionsObj)){
			
			$arrSessions = $arrSessionsObj->get_sessions();
			//preprint_r($arrSessions);
			foreach ($arrSessions as $sessionData) {
					
				$sessionTimeStamp = $sessionData->get_datetime();
				$sessionDateTime  = date_create($sessionTimeStamp);
				$sessionDate      = date_format($sessionDateTime, "l dS F Y");
				$sessionDateTitle = date_format($sessionDateTime, "Y-m-d");
				$sessionTime      = date_format($sessionDateTime, "H:i:s");

        		$objPrice = $sessionData->get_prices();

        		$arrPrice = array();
        		if(!empty($objPrice )) {

	        		foreach ($objPrice as $price) {
	        			$paxPrice = array();

						$priceType    = $price->get_name();
						
						$paxPrice['type']      = $priceType;
						$paxPrice['typeKey']   = $price->get_price_type_key();
						$paxPrice['rateKey']   = $price->get_price_key();
						$paxPrice['rate'] 	   = $price->get_rate();

						$arrPrice[$priceType] = $paxPrice;
	        		}
        		}

				$session = array();
				
				$session['isOpen']       = $sessionData->is_open();
				$session['date']         = $sessionDate;
				$session['time']         = $sessionTime;
				$session['formatedDate'] = $sessionDateTitle;
				$session['timeStamp']    = $sessionTimeStamp;
				$session['status']       = $sessionData->get_state();
				$session['minPax']       = $sessionData->get_min_pax();
				$session['maxPax']       = $sessionData->get_max_pax();
				$session['remaining']    = $sessionData->get_remaining();
				$session['price']        = $arrPrice;

				$arrSessionData[] = $session;
			}
		}
		
		return $arrSessionData;
	}

	public function getPromoCodeDetails($promoCode, $tourKey, $tourDate){

		$apiBaseUrl  = $this->config['host'];
		$apiKey      = $this->config['key'];
		$supplierObj = $this->supplier;
		$supplierKey = $supplierObj->get_supplier_key();

		$apiCallURL = $apiBaseUrl.'/api/promo/'.$promoCode.'/'.$supplierKey.'/'.$tourKey.'/'.$tourDate.'/?apikey='.$apiKey;

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $apiCallURL);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_HTTPGET, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 
		$jsonResponse = curl_exec($ch);
		curl_close($ch);

		$response = json_decode($jsonResponse, true);

		$promoData = $response['promo'];
		
 		return $promoData;
	}

	public function getBookingDetails($bookingToken = null){
		
		$apiBaseUrl = $this->config['host'];
		$apiKey     = $this->config['key'];
		
		$apiCallURL = $apiBaseUrl.'/api/booking/'.$bookingToken .'/status/?api_key='.$apiKey;

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $apiCallURL);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_HTTPGET, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 
		$jsonResponse = curl_exec($ch);
		curl_close($ch);

		$response = json_decode($jsonResponse);
		$bookingData = $response->booking;
		
 		return $bookingData;
		
	}
}

?>