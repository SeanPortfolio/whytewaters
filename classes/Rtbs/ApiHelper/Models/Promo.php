<?php namespace Rtbs\ApiHelper\Models;


class Promo
{
    private $discount_amount;
    private $promo_code;


    /**
     * @return float|null
     */
    public function get_discount_amount()
    {
        return $this->discount_amount;
    }


    /**
     * @param float|null $discount_amount
     */
    public function set_discount_amount($discount_amount)
    {
        $this->discount_amount = $discount_amount;
    }


    /**
     * @return string|null
     */
    public function get_promo_code()
    {
        return $this->promo_code;
    }


    /**
     * @param string|null $promo_code
     */
    public function set_promo_code($promo_code)
    {
        $this->promo_code = $promo_code;
    }


    /**
     * @param \stdClass $raw_promo
     * @return Promo
     */
    public static function from_raw($raw_promo)
    {
        $promo = new self();

        if (property_exists($raw_promo, 'promo_code')) {
            $promo->set_promo_code($raw_promo->promo_code);
        }

        if (property_exists($raw_promo, 'discount_amount')) {
            $promo->set_discount_amount($raw_promo->discount_amount);
        }

        return $promo;
    }

}