<?php namespace Rtbs\ApiHelper;

use Rtbs\ApiHelper\Exceptions\ApiClientException;
use Rtbs\ApiHelper\Models\AccommodationBooking;
use Rtbs\ApiHelper\Models\Booking;


class APIClient
{

    private $host;
    private $key;
    private $pwd;
    private $xdebug_key;


    function __construct($options=array())
    {
        //override defaults
        if (isset($options['host'])) {
            $this->host = $options['host'];
        }

        if (isset($options['key'])) {
            $this->key = $options['key'];
        }

        if (isset($options['pwd'])) {
            $this->pwd = $options['pwd'];
        }
    }


    /**
     * @param string $xdebug_key such as PHPSTORM
     */
    public function set_xdebug_key($xdebug_key)
    {
        $this->xdebug_key = $xdebug_key;
    }


    function api_categories() {
        $response = $this->call('/api/categories');
        return $response->categories;
    }

    function api_locations() {
        $response = $this->call('/api/locations');
        return $response->locations;
    }

    //Note! Locations are identified by name, not by key.
    function api_location_suppliers($location_name) {
        $location_name = strtr($location_name, array(' '=>'%20'));
        $response = $this->call('/api/location/'.$location_name.'/suppliers');
        return $response->suppliers;
    }

    function api_suppliers() {
        $response = $this->call('/api/suppliers');
        return $response->suppliers;
    }

    function api_accommodation_locations($supplier_key) {
        $response = $this->call('/api/accommodation-locations/'.$supplier_key);
        return $response->locations;
    }

    function api_accommodation_provider_detail($provider_key) {
        $response = $this->call('/api/accommodation-provider-detail/'.$provider_key);
        return $response->provider;
    }

    function api_accommodation_availability($provider_key, $check_in, $check_out) {
        $response = $this->call('/api/accommodation-provider-availability/'.$provider_key.'/'.$check_in.'/'.$check_out);
        return $response->availability;
    }

    function api_accommodation_providers($location_key, $check_in, $check_out) {
        $response = $this->call('/api/accommodation-providers/'.$location_key.'/'.$check_in.'/'.$check_out);
        return $response->providers;
    }

    function api_supplier($key) {
        $response = $this->call('/api/suppliers/'.$key);
        $suppliers = $response->suppliers;
        if (isset($suppliers[0])) {
            return $suppliers[0];
        }
        return null;
    }


    /**
     * @param string|string[] $keys
     * @return \stdClass
     */
    public function api_tours($keys)
    {
        if (!is_array($keys)) {
            $keys = array($keys);
        }

        $response = $this->call('/api/tours/' . implode(",", $keys));
        return $response->tours;
    }


    /**
     * @param string $supplier_key
     * @param string $voucher_code
     * @return \stdClass
     */
    public function api_voucher($supplier_key, $voucher_code)
    {
        $query_str = http_build_query(['supplier' => $supplier_key, 'voucher' => $voucher_code]);
        $response = $this->call("/api/voucher?{$query_str}");
        return $response->voucher;
    }


    //NOTE! returns an object with potentially two properties: 'sessions' & 'advance_dates'
    function api_sessions($supplier_key, $tour_keys, $date, $search_next_available = false, $days = 1, $exclude_capacityholds = null) {
        $pattern = "/api/sessions?supplier=%s&tours=%s&date=%s&search_next_available=%d&days=%d&exclude_capacityholds=%s";
        $tours = is_array($tour_keys) ? implode(",", $tour_keys) : $tour_keys;
        $exclude_capacityholds = is_array($exclude_capacityholds) ? implode(",", $exclude_capacityholds) : $exclude_capacityholds;
        $search_next_available = ($search_next_available) ? 1 : 0;
        $request = sprintf($pattern, $supplier_key, $tours, $date, $search_next_available, $days, $exclude_capacityholds);
        return $this->call($request);
    }


    // NOTE! returns an object with potentially two properties: 'sessions' & 'advance_dates'
    function api_experience_sessions($supplier_key, $experience_keys, $date, $search_next_available = false, $days = 1, $exclude_capacityholds = null)
    {
        $experiences = is_array($experience_keys) ? implode(",", $experience_keys) : $experience_keys;
        $exclude_capacityholds = is_array($exclude_capacityholds) ? implode(",", $exclude_capacityholds) : $exclude_capacityholds;
        $search_next_available = ($search_next_available) ? 1 : 0;

        $request = '/api/experience_sessions?' . http_build_query([
            'supplier' => $supplier_key,
            'experiences' => $experiences,
            'date' => $date,
            'search_next_available' => $search_next_available,
            'days' => $days,
            'exclude_capacityholds' => $exclude_capacityholds,
        ]);

        return $this->call($request);
    }


    function api_pickups($tour_key) {
        $method = "/api/pickups?tour=".$tour_key;
        $response = $this->call($method);
        return $response->pickups;
    }


    // returns a payment URL for the booking
    function api_booking(Booking $booking) {
        $method = '/api/booking';
        $data = $booking->to_raw_object();

        $opts = $this->build_opts($data);
        $response = $this->call($method, $opts);
        return $response;
    }


    function api_promo($promo_code, Booking $booking) {
        $method = '/api/promo';

        $data = $booking->to_raw_object();
        $data['promo_code'] = $promo_code;

        $opts = $this->build_opts($data);
        $response = $this->call($method, $opts);
        return $response;
    }


    function api_remove_booking($booking_id, $itinerary_key, $booking_type) {
        $method = '/api/remove-itinerary-booking';
        $data = array(
            'itinerary_key' => $itinerary_key,
            'booking_id' => $booking_id,
            'booking_type' => $booking_type
        );

        $opts = $this->build_opts($data);
        $response = $this->call($method, $opts);
        return $response;
    }

    function api_pay_itinerary($itinerary_key, $return_url = null) {
        $method = '/api/pay-itinerary';
        $data = array(
            'itinerary_key' => $itinerary_key
        );

        if ($return_url) {
            $data['return_url'] = $return_url;
        }

        $opts = $this->build_opts($data);
        $response = $this->call($method, $opts);
        return $response;
    }

    function api_create_itinerary($primary_customer_key, $additional_customer_keys = array()) {
        $method = '/api/itinerary';

        $data = array(
            'primary_customer_key' => $primary_customer_key,
            'additional_customer_keys' => $additional_customer_keys
        );

        $opts = $this->build_opts($data);
        $response = $this->call($method, $opts);
        return $response;
    }


    public function api_itinerary_tickets_html($token) {
        return file_get_contents($this->api_itinerary_tickets_url($token));
    }


    public function api_itinerary_tickets_url($token) {
        return $this->host . '/api/itinerary/' . urlencode($token) . '/tickets?apikey=' . $this->key;
    }

    //Makes an api call.
    protected function call($request, $opts = null) {
        if (substr($request, 0,5) !== "/api/") {
            throw new ApiClientException("All API requests must begin with /api/");
        }

        //add key
        $separator = strpos($request, '?') === false ? '?' : '&';
        $request .= $separator.'apikey='.$this->key;

        // tracer
        if (session_id()) {
            $request .= '&tracer=' . urlencode(session_id());
        }

        if ($this->xdebug_key) {
            $request .= '&XDEBUG_SESSION_START=' . urlencode($this->xdebug_key);
        }

        $url = $this->host.$request;

        if ($opts == null) {
            $response_raw = file_get_contents($url);
        }
        else {
            $context = stream_context_create($opts);
            $response_raw = file_get_contents($url, false, $context);
        }

        $response = json_decode($response_raw);
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new ApiClientException("Server response invalid JSON format: ". $response_raw);
        }

        if (isset($response->success) && $response->success == false) {
            $code = (!empty($response->code)) ? $response->code : null;
            throw new ApiClientException($this->getUserMessageForAPIException($response->message));
        }

        return $response;
    }


    private function getUserMessageForAPIException($err_msg) {
        return strtr($err_msg, array(
            'datetime past' => 'The chosen date and time has passed, please choose a later date',
            'Trip is closed' => 'The event is unavailable at the chosen date and time, please choose a different date',
        ));
    }


    public function api_create_customer($first_name, $last_name, $email, $phone) {
        $data = array(
            'fname' => $first_name,
            'lname' => $last_name,
            'email' => $email,
            'phone' => $phone
        );

        $opts = $this->build_opts($data);
        $response = $this->call('/api/customer', $opts);
        return $response;
    }

    public function api_accommodation_booking(AccommodationBooking $accommodation_booking) {
        $method = '/api/accommodation-booking';
        $data = get_object_vars($accommodation_booking);
        $content = "data=".rawurlencode( json_encode($data) );
        $referrer = isset($_SERVER['SCRIPT_URI']) ? $_SERVER['SCRIPT_URI'] : 'Demonstration';

        $opts=array(
            'http' => array(
                'method'  => 'POST',
                'header'  => array(
                    "Content-type: application/x-www-form-urlencoded",
                    "Referer: " . $referrer ,
                    "Connection: close",
                    "Accept-language: en",
                    "Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
                ),
                'content' => $content,
            ),
        );
        $response = $this->call($method, $opts);
        return $response;
    }


    /**
     * @param string $supplier_key
     * @param string $tour_key
     * @param \DateTimeInterface|string $datetime
     * @param int $pax
     * @param int $expiry_mins
     * @return mixed
     */
    public function api_reserve_capacity($supplier_key, $tour_key, $datetime, $pax, $expiry_mins = 10)
    {
        if ($datetime instanceof \DateTimeInterface) {
            $datetime = $datetime->format('Y-m-d H:i:s');
        }

        $method = '/api/reserve-capacity?' . http_build_query(array('supplier' => $supplier_key));
        $data = array(
            'tour_key' => $tour_key,
            'datetime' => $datetime,
            'pax' => $pax,
            'expiry_mins' => $expiry_mins,
        );

        $opts = $this->build_opts($data);
        $response = $this->call($method, $opts);
        return $response;
    }


    /**
     * @param string $supplier_key
     * @param string $capacity_hold_key
     * @return mixed
     */
    public function api_release_capacity($supplier_key, $capacity_hold_key)
    {
        $method = '/api/release-capacity?' . http_build_query(array('supplier' => $supplier_key));
        $data = array(
            'capacity_hold_key' => $capacity_hold_key
        );

        $opts = $this->build_opts($data);
        $response = $this->call($method, $opts);
        return $response;
    }


    private function build_opts($data) {

        $content = "data=" . rawurlencode(json_encode($data));
        $referrer = isset($_SERVER['SCRIPT_URI']) ? $_SERVER['SCRIPT_URI'] : 'Demonstration';

        return array(
            'http' => array(
                'method' => 'POST',
                'header' => array(
                    "Content-type: application/x-www-form-urlencoded",
                    "Referer: " . $referrer,
                    "Connection: close",
                    "Accept-language: en"
                ),
                'content' => $content,
            ),
        );
    }


    /**
     * For Internal Use Only
     * @param string $obl_id
     * @return \stdClass
     */
    public function api_obl($obl_id)
    {
        $response = $this->call("/api/obl/{$obl_id}");
        return $response->obl;
    }


    public function api_ticket_url($token)
    {
        return $this->host . '/api/ticket?token=' . urlencode($token);
    }


    public function api_ticket_html($token)
    {
        return file_get_contents($this->api_ticket_url($token));
    }

}