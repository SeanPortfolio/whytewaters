<?php namespace Rtbs\ApiHelper;

use Rtbs\ApiHelper\Models\Booking;
use Rtbs\ApiHelper\Models\Category;
use Rtbs\ApiHelper\Models\Pickup;
use Rtbs\ApiHelper\Models\Supplier;

interface BookingService
{
    /**
     * @return Category[]
     */
    public function get_categories();

    /**
     * @return Supplier[]
     */
    public function get_suppliers();

    /**
     * @param $supplier_key
     * @param $tour_keys
     * @param $date
     * @return array associative array with two keys: sessions => Session[] and advanced_dates => mixed
     */
    public function get_sessions_and_advance_dates($supplier_key, $tour_keys, $date);

    /**
     * @param $tour_key
     * @return Pickup[]
     */
    public function get_pickups($tour_key);

    /**
     * @param $booking Booking
     * @return string url | Booking
     */
    public function make_booking(Booking $booking);

    /**
     *
     * @param string $first_name
     * @param string $last_name
     * @param string $email
     * @param string $phone
     * @return \Rtbs\ApiHelper\Models\Customer
     */
    public function create_customer($first_name, $last_name, $email, $phone);

    /**
     * @param string $supplier_key
     * @param string $tour_key
     * @param \DateTime|string $trip_datetime
     * @param int $pax
     * @return string
     */
    public function reserve_capacity($supplier_key, $tour_key, $trip_datetime, $pax);
}