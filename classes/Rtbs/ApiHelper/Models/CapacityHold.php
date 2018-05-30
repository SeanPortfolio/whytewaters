<?php namespace Rtbs\ApiHelper\Models;


class CapacityHold {

    private $capacity_hold_key;
    private $expires;
    private $tour_key;
    private $trip_datetime;
    private $pax_held;

    /**
     * @param \stdClass $raw_capacity_hold
     * @return CapacityHold
     */
    public static function from_raw($raw_capacity_hold) {
        $capacity_hold = new CapacityHold();

        $capacity_hold->set_capacity_hold_key($raw_capacity_hold->capacity_hold_key);
        $capacity_hold->set_expires($raw_capacity_hold->expires);
        $capacity_hold->set_tour_key($raw_capacity_hold->tour_key);
        $capacity_hold->set_trip_datetime($raw_capacity_hold->trip_datetime);
        $capacity_hold->set_pax_held($raw_capacity_hold->pax_held);

        return $capacity_hold;
    }

    public function get_capacity_hold_key() {
        return $this->capacity_hold_key;
    }

    public function set_capacity_hold_key($capacity_hold_key) {
        $this->capacity_hold_key = $capacity_hold_key;
    }

    public function get_expires() {
        return $this->expires;
    }

    public function set_expires($expires) {
        $this->expires = $expires;
    }

    public function is_expired()
    {
        return (strtotime($this->expires) <= time());
    }

    public function get_tour_key() {
        return $this->tour_key;
    }

    public function set_tour_key($tour_key) {
        $this->tour_key = $tour_key;
    }

    public function get_trip_datetime() {
        return $this->trip_datetime;
    }

    public function set_trip_datetime($trip_datetime) {
        $this->trip_datetime = $trip_datetime;
    }

    public function get_pax_held() {
        return $this->pax_held;
    }

    public function set_pax_held($pax_held) {
        $this->pax_held = $pax_held;
    }
}