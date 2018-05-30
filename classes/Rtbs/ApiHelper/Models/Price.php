<?php namespace Rtbs\ApiHelper\Models;


class Price {
    private $price_key;
    private $price_type_key;
    private $price_category_key;
    private $price_category_name;
    private $passenger_count;
    private $name;
    private $description;
    private $rate;

    private $price_code;
    private $qty;
    private $disc;
    private $rate_incl_disc;
    private $total;
    private $total_inc_disc;

    /**
     * @return mixed
     */
    public function get_price_key()
    {
        return $this->price_key;
    }

    /**
     * @param mixed $price_key
     */
    public function set_price_key($price_key)
    {
        $this->price_key = $price_key;
    }

    /**
     * @return mixed
     */
    public function get_price_type_key()
    {
        return $this->price_type_key;
    }

    /**
     * @param mixed $price_type_key
     */
    public function set_price_type_key($price_type_key)
    {
        $this->price_type_key = $price_type_key;
    }

    /**
     * @return mixed
     */
    public function get_price_category_key()
    {
        return $this->price_category_key;
    }

    /**
     * @param mixed $price_category_key
     */
    public function set_price_category_key($price_category_key)
    {
        $this->price_category_key = $price_category_key;
    }

    /**
     * @return mixed
     */
    public function get_price_category_name()
    {
        return $this->price_category_name;
    }

    /**
     * @param mixed $price_category_name
     */
    public function set_price_category_name($price_category_name)
    {
        $this->price_category_name = $price_category_name;
    }

    /**
     * @return mixed
     */
    public function get_passenger_count()
    {
        return $this->passenger_count;
    }

    /**
     * @param mixed $passenger_count
     */
    public function set_passenger_count($passenger_count)
    {
        $this->passenger_count = $passenger_count;
    }

    /**
     * @return mixed
     */
    public function get_name()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function set_name($name)
    {
        $this->name = $name;
    }

    /**
     * @return mixed
     */
    public function get_description()
    {
        return ($this->description != $this->name) ? $this->description : null;
    }

    /**
     * @param mixed $description
     */
    public function set_description($description)
    {
        $this->description = $description;
    }

    /**
     * @return mixed
     */
    public function get_rate()
    {
        return $this->rate;
    }

    /**
     * @param mixed $rate
     */
    public function set_rate($rate) {
        $this->rate = $rate;
    }

    /**
     * @return mixed
     */
    public function get_price_code()
    {
        return $this->price_code;
    }

    /**
     * @param mixed $price_code
     */
    public function set_price_code($price_code)
    {
        $this->price_code = $price_code;
    }

    /**
     * @return mixed
     */
    public function get_qty()
    {
        return $this->qty;
    }

    /**
     * @param mixed $qty
     */
    public function set_qty($qty)
    {
        $this->qty = $qty;
    }

    /**
     * @return mixed
     */
    public function get_disc()
    {
        return $this->disc;
    }

    /**
     * @param mixed $disc
     */
    public function set_disc($disc)
    {
        $this->disc = $disc;
    }

    /**
     * @return mixed
     */
    public function get_rate_incl_disc()
    {
        return $this->rate_incl_disc;
    }

    /**
     * @param mixed $rate_incl_disc
     */
    public function set_rate_incl_disc($rate_incl_disc)
    {
        $this->rate_incl_disc = $rate_incl_disc;
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
    public function set_total($total)
    {
        $this->total = $total;
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
    public function set_total_inc_disc($total_inc_disc)
    {
        $this->total_inc_disc = $total_inc_disc;
    }

    public static function from_raw($raw_price) {
        $price = new Price();

        if(property_exists($raw_price, 'price_key')) $price->set_price_key($raw_price->price_key);
        if(property_exists($raw_price, 'price_type_key')) $price->set_price_type_key($raw_price->price_type_key);
        if(property_exists($raw_price, 'price_category_key')) $price->set_price_category_key($raw_price->price_category_key);
        if(property_exists($raw_price, 'price_category_name')) $price->set_price_category_name($raw_price->price_category_name);
        if(property_exists($raw_price, 'passenger_count')) $price->set_passenger_count($raw_price->passenger_count);

	    // sessions api calls it price name
	    if(property_exists($raw_price, 'price_name')) $price->set_name($raw_price->price_name);
	    
	    // tours api calls it name
	    if(property_exists($raw_price, 'name')) $price->set_name($raw_price->name);

        if(property_exists($raw_price, 'description')) $price->set_description($raw_price->description);
        if(property_exists($raw_price, 'rate')) $price->set_rate($raw_price->rate);
        if(property_exists($raw_price, 'price_code')) $price->set_price_code($raw_price->price_code);
        if(property_exists($raw_price, 'qty')) $price->set_qty($raw_price->qty);
        if(property_exists($raw_price, 'disc')) $price->set_disc($raw_price->disc);
        if(property_exists($raw_price, 'rate_incl_disc')) $price->set_rate_incl_disc($raw_price->rate_incl_disc);
        if(property_exists($raw_price, 'total')) $price->set_total($raw_price->total);
        if(property_exists($raw_price, 'total_inc_disc')) $price->set_total_inc_disc($raw_price->total_inc_disc);

        return $price;
    }
}