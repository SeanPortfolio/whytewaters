<?php 

namespace Rtbs\ApiHelper;

use Rtbs\ApiHelper\Exceptions\ModelNotFoundException;
use Rtbs\ApiHelper\Exceptions\PromoNotFoundException;
use Rtbs\ApiHelper\Models\Booking;
use Rtbs\ApiHelper\Models\Category;
use Rtbs\ApiHelper\Models\Customer;
use Rtbs\ApiHelper\Models\ItineraryBooking;
use Rtbs\ApiHelper\Models\Obl;
use Rtbs\ApiHelper\Models\Pickup;
use Rtbs\ApiHelper\Models\Promo;
use Rtbs\ApiHelper\Models\Session;
use Rtbs\ApiHelper\Models\SessionAndAdvanceDates;
use Rtbs\ApiHelper\Models\Supplier;
use Rtbs\ApiHelper\Models\Tour;
use Rtbs\ApiHelper\Models\Itinerary;
use Rtbs\ApiHelper\Models\CapacityHold;
use Rtbs\ApiHelper\Models\Voucher;

class BookingServiceImpl implements BookingService {
    private $api_client;
    private $credentials;

    /**
     * BookingServiceImpl constructor.
     * @param array $credentials
     * @param string $xdebug_key
     */
    public function __construct($credentials, $xdebug_key = null)
    {
         
        $this->credentials = $credentials;
        $this->xdebug_key = $xdebug_key;
    }

    /**
     * @return Category[]
     */
    public function get_categories() {
        $categories = array();

        $raw_categories = $this->get_api_client()->api_categories();

        foreach($raw_categories as $raw_category) {
            $categories[] = Category::fromRaw($raw_category);
        }


        return $categories;
    }


    /**
     * @param string $supplier_key
     * @param string|array $tour_keys
     * @param string $date
     * @param bool $search_next_available
     * @param int $days
     * @param array|null $exclude_capacityholds
     * @return SessionAndAdvanceDates
     */
    public function get_sessions_and_advance_dates($supplier_key, $tour_keys, $date, $search_next_available = false, $days = 1, $exclude_capacityholds = null) {

        $response = $this->get_api_client()->api_sessions($supplier_key, $tour_keys, $date, $search_next_available, $days, $exclude_capacityholds);

        $sessions_and_advance_dates = new SessionAndAdvanceDates();

        foreach($response->sessions as $raw_session) {
            $sessions_and_advance_dates->add_session(Session::from_raw($raw_session));
        }

        $sessions_and_advance_dates->set_advance_dates($response->advance_dates);

        return $sessions_and_advance_dates;
    }


    /**
     * @param string $supplier_key
     * @param string|array $experience_keys
     * @param string $date
     * @param bool $search_next_available
     * @param int $days
     * @param array|null $exclude_capacityholds
     * @return SessionAndAdvanceDates
     */
    public function get_experience_sessions_and_advance_dates($supplier_key, $experience_keys, $date, $search_next_available = false, $days = 1, $exclude_capacityholds = null)
    {
        $response = $this->get_api_client()->api_experience_sessions($supplier_key, $experience_keys, $date, $search_next_available, $days, $exclude_capacityholds);

        $sessions_and_advance_dates = new SessionAndAdvanceDates();

        foreach($response->sessions as $raw_session) {
            $sessions_and_advance_dates->add_session(Session::from_raw($raw_session));
        }

        $sessions_and_advance_dates->set_advance_dates($response->advance_dates);

        return $sessions_and_advance_dates;
    }


    /**
     * @return Supplier[]
     */
    public function get_suppliers() {
        $suppliers = array();

        $raw_suppliers = $this->get_api_client()->api_suppliers();

        foreach($raw_suppliers as $raw_supplier) {
            $suppliers[] = Supplier::fromRaw($raw_supplier);
        }


        return $suppliers;
    }

    /**
     * @param $tour_key
     * @return Pickup[]
     */
    public function get_pickups($tour_key) {
        $pickups = array();

        $raw_pickups = $this->get_api_client()->api_pickups($tour_key);

        foreach($raw_pickups as $raw_pickup) {
            $pickups[] = Pickup::from_raw($raw_pickup);
        }

        return $pickups;
    }


    /**
     * @param string|string[] $tour_keys
     * @return Tour[]
     */
    public function get_tours($tour_keys)
    {
        $tours = array();

        $raw_tours = $this->get_api_client()->api_tours($tour_keys);

        foreach ($raw_tours as $raw_tour) {
            $tours[] = Tour::from_raw($raw_tour);
        }

        return $tours;
    }


    /**
     * @param string $supplier_key
     * @param string $voucher_code
     * @return Voucher
     */
    public function get_voucher($supplier_key, $voucher_code)
    {
        $raw_voucher = $this->get_api_client()->api_voucher($supplier_key, $voucher_code);

        return Voucher::from_raw($raw_voucher);
    }

    /**
     *
     * @param string $supplier_key
     * @return Supplier
     * @throws ModelNotFoundException
     */
    public function get_supplier($supplier_key) {
        $raw_supplier = $this->get_api_client()->api_supplier($supplier_key);

        if($raw_supplier == null) {
            throw new ModelNotFoundException('Supplier Not Found, check Expose to API setting in RTBS');
        }

        return Supplier::fromRaw($raw_supplier);
    }


    private function get_api_client()
    {
        if($this->api_client == null) {
            $this->api_client = new APIClient($this->credentials);
        }

        $this->api_client->set_xdebug_key($this->xdebug_key);

        return $this->api_client;
    }


    /**
     * @param $booking Booking
     * @return string|Booking url
     */
    public function make_booking(Booking $booking) {
        $response = $this->get_api_client()->api_booking($booking);

        if(isset($response->url)) {
            return $response->url;
        }
        else {
            $booking->from_raw($response->booking);
            return $booking;
        }
    }


    /**
     * @param ItineraryBooking $itinerary_booking
     * @return ItineraryBooking
     */
    public function make_itinerary_booking(ItineraryBooking $itinerary_booking)
    {
        $response = $this->get_api_client()->api_book_itineray($itineray_booking);
        return ItineraryBooking::from_raw($response);
    }


    /**
     * @param string $promo_code
     * @param Booking $booking
     * @return Promo
     * @throws PromoNotFoundException
     * @throws \Exception
     */
    public function apply_promo($promo_code, Booking $booking) {
        try {
            $response = $this->get_api_client()->api_promo($promo_code, $booking);
        } catch (\Exception $ex) {
            if ($ex->getMessage() == 'promotion not found') {
                throw new PromoNotFoundException('Invalid Promo Code', 0, $ex);
            } else if ($ex->getMessage() == 'promo code invalid') {
                throw new PromoNotFoundException('"Invalid Promo Code', 0, $ex);
            } else if ($ex->getMessage() == 'promo_code missing or invalid') {
                throw new PromoNotFoundException('Invalid Promo Code', 0, $ex);
            } else if ($ex->getMessage() == 'promo activity mismatch') {
	            throw new PromoNotFoundException('Promo Code not valid for this tour', 0, $ex);
            } else {
                throw $ex;
            }
        }

        return Promo::from_raw($response);
    }


    /**
     * @param string $booking_id
     * @param string $itinerary_key
     * @return mixed
     */
    public function remove_activity_booking($booking_id, $itinerary_key)
    {
        return $this->get_api_client()->api_remove_booking($booking_id, $itinerary_key, 'ACTIVITY');
    }


    /**
     *
     * @param string $first_name
     * @param string $last_name
     * @param string $email
     * @param string $phone
     * @return \Rtbs\ApiHelper\Models\Customer
     */
    public function create_customer($first_name, $last_name, $email, $phone) {
        $raw_customer = $this->get_api_client()->api_create_customer($first_name, $last_name, $email, $phone);

        return Customer::from_raw($raw_customer->customer);
    }

    
    /**
     * @param Customer $customer
     * @return \Rtbs\ApiHelper\Models\Itinerary
     */
    public function create_itinerary(Customer $customer) {
        $raw_itinerary = $this->get_api_client()->api_create_itinerary($customer->get_customer_key());

        return Itinerary::from_raw($raw_itinerary->itinerary);
    }


    public function intinerary_tickets_html($token) {
        return $this->get_api_client()->api_itinerary_tickets_html($token);
    }


    /**
     * @param Itinerary $itinerary
     * @return string payment_url
     */
    public function pay_itinerary(Itinerary $itinerary, $return_url = null) {
        $response = $this->get_api_client()->api_pay_itinerary($itinerary->get_itinerary_key(), $return_url);

        return $response->url;
    }

    /**
     * @param string $supplier_key
     * @param string $tour_key
     * @param \DateTime|string $trip_datetime
     * @param int $pax
     * @param int $expiry_mins
     * @return CapacityHold
     */
    public function reserve_capacity($supplier_key, $tour_key, $trip_datetime, $pax, $expiry_mins = 10)
    {
        $raw_capacity_hold = $this->get_api_client()->api_reserve_capacity($supplier_key, $tour_key, $trip_datetime, $pax, $expiry_mins);

        return CapacityHold::from_raw($raw_capacity_hold);
    }

    /**
     * @param string $supplier_key
     * @param string $capacity_hold_key
     */
    public function release_capacity($supplier_key, $capacity_hold_key) {
        $this->get_api_client()->api_release_capacity($supplier_key, $capacity_hold_key);
    }


    /**
     * For Internal Use Only
     * @param string $obl_id
     * @return \Rtbs\ApiHelper\Models\Obl
     */
    public function get_obl($obl_id)
    {
        $raw_obl = $this->get_api_client()->api_obl($obl_id);
        return Obl::from_raw($raw_obl);
    }


    public function ticket_html($token)
    {
        return $this->get_api_client()->api_ticket_html($token);
    }


    private static function getUserMessageForAPIException(\Exception $ex) {
        return strtr($ex->getMessage(), array(
            'API call did not succeed: datetime past' => 'The chosen date and time has passed, please choose a later date',
            'API call did not succeed: Trip is closed' => 'The event is unavailable at the chosen date and time, please choose a different date',
        ));
    }


}