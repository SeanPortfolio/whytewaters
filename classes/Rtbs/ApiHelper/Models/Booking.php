<?php namespace Rtbs\ApiHelper\Models;


class Booking {
    private $tour_key;
    private $datetime;
    private $first_name;
    private $last_name;
    private $email;
    private $phone;
    private $promo_key;
    private $price_selections = array();
    private $prices = array();

    private $status;
    private $booking_id;
    private $id;
    private $valid_until;
    private $is_used;
    private $supplier_key;
    private $supplier_name;
    private $tour_name;
    private $promo_code;
    private $pickup_time;
    private $pickup_point;
    private $comment;
    private $total;
    private $total_disc;
    private $total_inc_disc;
    private $fields;
    private $return_url;
    private $pickup_key;
    private $itinerary_key;
    private $capacity_hold_key;

    /**
     * @return mixed
     */
    public function get_status()
    {
        return $this->status;
    }

    /**
     * @param mixed $status
     */
    protected function set_status($status)
    {
        $this->status = $status;
    }

    /**
     * @return mixed
     */
    public function get_booking_id()
    {
        return $this->booking_id;
    }

    /**
     * @param mixed $booking_id
     */
    public function set_booking_id($booking_id)
    {
        $this->booking_id = $booking_id;
    }

    /**
     * @return mixed
     */
    public function get_id()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    protected function set_id($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function get_valid_until()
    {
        return $this->valid_until;
    }

    /**
     * @param mixed $valid_until
     */
    protected function set_valid_until($valid_until)
    {
        $this->valid_until = $valid_until;
    }

    /**
     * @return mixed
     */
    public function get_is_used()
    {
        return $this->is_used;
    }

    /**
     * @param mixed $is_used
     */
    protected function set_is_used($is_used)
    {
        $this->is_used = $is_used;
    }

    /**
     * @return mixed
     */
    public function get_supplier_key()
    {
        return $this->supplier_key;
    }

    /**
     * @param mixed $supplier_key
     */
    protected function set_supplier_key($supplier_key)
    {
        $this->supplier_key = $supplier_key;
    }

    /**
     * @return mixed
     */
    public function get_supplier_name()
    {
        return $this->supplier_name;
    }

    /**
     * @param mixed $supplier_name
     */
    protected function set_supplier_name($supplier_name)
    {
        $this->supplier_name = $supplier_name;
    }

    /**
     * @return mixed
     */
    public function get_tour_name()
    {
        return $this->tour_name;
    }

    /**
     * @param mixed $tour_name
     */
    protected function set_tour_name($tour_name)
    {
        $this->tour_name = $tour_name;
    }

    /**
     * @return mixed
     */
    public function get_promo_code()
    {
        return $this->promo_code;
    }

    /**
     * @param mixed $promo_code
     */
	public function set_promo_code($promo_code)
    {
        $this->promo_code = $promo_code;
    }

    /**
     * @return mixed
     */
    public function get_pickup_time()
    {
        return $this->pickup_time;
    }

    /**
     * @param mixed $pickup_time
     */
    protected function set_pickup_time($pickup_time)
    {
        $this->pickup_time = $pickup_time;
    }

    /**
     * @return mixed
     */
    public function get_pickup_point()
    {
        return $this->pickup_point;
    }

    /**
     * @param mixed $pickup_point
     */
    protected function set_pickup_point($pickup_point)
    {
        $this->pickup_point = $pickup_point;
    }

    /**
     * @return mixed
     */
    public function get_comment()
    {
        return $this->comment;
    }

    /**
     * @param mixed $comment
     */
    public function set_comment($comment)
    {
        $this->comment = $comment;
    }

    /**
     * @return mixed
     */
    public function get_total()
    {
        return $this->total;
    }

    /**
     * @param mixed $total
     */
    private function set_total($total)
    {
        $this->total = $total;
    }

    /**
     * @return mixed
     */
    public function get_total_disc()
    {
        return $this->total_disc;
    }

    /**
     * @param mixed $total_disc
     */
    protected function set_total_disc($total_disc)
    {
        $this->total_disc = $total_disc;
    }

    /**
     * @return mixed
     */
    public function get_total_inc_disc()
    {
        return $this->total_inc_disc;
    }

    /**
     * @param mixed $total_inc_disc
     */
    protected function set_total_inc_disc($total_inc_disc)
    {
        $this->total_inc_disc = $total_inc_disc;
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
    public function get_datetime()
    {
        return $this->datetime;
    }

    /**
     * @param \DateTimeInterface|string $datetime
     */
    public function set_datetime($datetime)
    {
        if ($datetime instanceof \DateTimeInterface) {
            $this->datetime = $datetime->format('Y-m-d H:i:s');
        } else {
            $this->datetime = $datetime;
        }
    }

    /**
     * @return mixed
     */
    public function get_first_name()
    {
        return $this->first_name;
    }

    /**
     * @param mixed $first_name
     */
    public function set_first_name($first_name)
    {
        $this->first_name = $first_name;
    }

    /**
     * @return mixed
     */
    public function get_last_name()
    {
        return $this->last_name;
    }

    /**
     * @param mixed $last_name
     */
    public function set_last_name($last_name)
    {
        $this->last_name = $last_name;
    }

    /**
     * @return mixed
     */
    public function get_email()
    {
        return $this->email;
    }

    /**
     * @param mixed $email
     */
    public function set_email($email)
    {
        $this->email = $email;
    }

    /**
     * @return mixed
     */
    public function get_phone()
    {
        return $this->phone;
    }

    /**
     * @param mixed $phone
     */
    public function set_phone($phone)
    {
        $this->phone = $phone;
    }

    /**
     * @return mixed
     */
    public function get_promo_key()
    {
        return $this->promo_key;
    }

    /**
     * @param mixed $promo_key
     */
    public function set_promo_key($promo_key)
    {
        $this->promo_key = $promo_key;
    }

    public function add_price_selection(Price $price, $quantity) {
        $this->price_selections[] = array(
            'price_key' => $price->get_price_key(),
            'qty' => $quantity
        );
    }

    public function add_price_selection_keys($price_key, $quantity) {
        $this->price_selections[] = array(
            'price_key' => $price_key,
            'qty' => (int) $quantity
        );
    }

    protected function add_price(Price $price) {
        $this->prices[] = $price;
    }

    public function get_prices() {
        return $this->prices;
    }

    public function add_field_data($name, $value) {
    	$this->fields[] = array(
    		'name' => $name,
		    'value' => $value
	    );
    }

    /**
     * @return array
     */
    public function get_price_selections() {
        return $this->price_selections;
    }

    /**
     * @param string $return_url
     */
    public function set_return_url($return_url) {
        $this->return_url = $return_url;
    }

    /**
     * @param string $pickup_key
     */
    public function set_pickup_key($pickup_key) {
        $this->pickup_key = $pickup_key;
    }

    /**
     * @param string|null $itinerary_key
     */
    public function set_itinerary_key($itinerary_key) {
        $this->itinerary_key = $itinerary_key;
    }


    /**
     * @return string|null
     */
    public function get_itinerary_key() {
        return $this->itinerary_key;
    }


    public function set_capacity_hold_key($capacity_hold_key)
    {
        $this->capacity_hold_key = $capacity_hold_key;
    }


    public function to_raw_object() {
        $raw_object = array(
            'tour_key' => $this->get_tour_key(),
            'datetime' => $this->get_datetime(),
            'fname' => $this->get_first_name(),
            'lname' => $this->get_last_name(),
            'email' => $this->get_email(),
            'phone' => $this->get_phone(),
            'prices' => $this->get_price_selections(),
        );

        if(is_numeric($this->promo_key)) {
		    $raw_object['promo_key'] = $this->promo_key;
	    }

	    if(!empty($this->promo_code)) {
		    $raw_object['promo_code'] = $this->promo_code;
	    }

        if (!empty($this->return_url)) {
            $raw_object['return_url'] = $this->return_url;
        }

        if (!empty($this->pickup_key)) {
            $raw_object['pickup_key'] = $this->pickup_key;
        }

        if (!empty($this->fields)) {
        	$raw_object['fields'] = $this->fields;
        }

        if (!empty($this->comment)) {
            $raw_object['comment'] = $this->comment;
        }

        if (!empty($this->itinerary_key)) {
            $raw_object['itinerary_key'] = $this->itinerary_key;
        }

        if (!empty($this->capacity_hold_key)) {
            $raw_object['capacity_hold_key'] = $this->capacity_hold_key;
        }

        return $raw_object;
    }

    public function from_raw($raw_booking) {
        $this->set_status($raw_booking->status);
        $this->set_booking_id($raw_booking->booking_id);
        $this->set_id($raw_booking->id);
        $this->set_first_name($raw_booking->fname);
        $this->set_last_name($raw_booking->lname);
        $this->set_email($raw_booking->email);
        $this->set_phone($raw_booking->phone);
        $this->set_datetime($raw_booking->datetime);
        $this->set_valid_until($raw_booking->valid_until);
        $this->set_is_used($raw_booking->is_used);
        $this->set_supplier_key($raw_booking->supplier_key);
        $this->set_supplier_name($raw_booking->supplier_name);
        $this->set_tour_key($raw_booking->tour_key);
        $this->set_tour_name($raw_booking->tour_name);
        $this->set_promo_code($raw_booking->promo_code);
        $this->set_pickup_time($raw_booking->pickup_time);
        $this->set_pickup_point($raw_booking->pickup_point);
        $this->set_comment($raw_booking->comment);
        $this->set_total($raw_booking->total);

        foreach($raw_booking->prices as $raw_price) {
            $this->add_price(Price::from_raw($raw_price));
        }
    }
}