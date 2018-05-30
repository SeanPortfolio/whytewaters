<?php namespace Rtbs\ApiHelper\Models;


class Session
{
    private $datetime;
    private $tour_key;
    private $open;

    /** @var Price[] $prices */
    private $prices = array();

    private $state;
    private $remaining;
    private $min_pax;
    private $max_pax;


    /**
     * @return mixed
     */
    public function get_datetime()
    {
        return $this->datetime;
    }

    /**
     * @param mixed $datetime
     */
    public function set_datetime($datetime)
    {
        $this->datetime = $datetime;
    }

    /**
     * @return mixed
     */
    public function get_tour_key()
    {
        return $this->tour_key;
    }

    /**
     * @param mixed $tour_key
     */
    public function set_tour_key($tour_key)
    {
        $this->tour_key = $tour_key;
    }

    /**
     * @return mixed
     */
    public function is_open() {
        return $this->open;
    }

    /**
     * @param mixed $open
     */
    public function set_open($open) {
        $this->open = $open;
    }

    /**
     * @return Price[]
     */
    public function get_prices()
    {
        return $this->prices;
    }

    /**
     * @param Price[] $prices
     */
    public function set_prices($prices)
    {
        $this->prices = $prices;
    }


    public function get_min_price()
    {
        $min_price = 9999999999;

        foreach ($this->prices as $price) {
            if ($price->get_passenger_count() > 0 && $price->get_rate() < $min_price) {
                $min_price = $price->get_rate();
            }
        }

        return $min_price;
    }


    /**
     * @return mixed
     */
    public function get_state()
    {
        return $this->state;
    }

    /**
     * @param mixed $state
     */
    public function set_state($state)
    {
        $this->state = $state;
    }

    /**
     * @return mixed
     */
    public function get_remaining()
    {
        return $this->remaining;
    }

    /**
     * @param mixed $remaining
     */
    public function set_remaining($remaining)
    {
        $this->remaining = $remaining;
    }

    public function add_price(Price $price) {
        $this->prices[] = $price;
    }

    public function get_min_pax()
    {
        return $this->min_pax;
    }


    public function get_max_pax()
    {
        return $this->max_pax;
    }


    public static function from_raw($raw_session) {
        $session = new Session();

        $session->set_datetime($raw_session->datetime);
        $session->set_tour_key($raw_session->tour_key);
        $session->set_open($raw_session->open);
        $session->set_state($raw_session->state);
        $session->set_remaining($raw_session->remaining);

        if (property_exists($raw_session, 'min_pax')) {
            $session->min_pax = $raw_session->min_pax;
        }

        if (property_exists($raw_session, 'max_pax')) {
            $session->max_pax = $raw_session->max_pax;
        }

        foreach($raw_session->prices as $raw_price) {
            $session->add_price(Price::from_raw($raw_price));
        }

        return $session;
    }
}