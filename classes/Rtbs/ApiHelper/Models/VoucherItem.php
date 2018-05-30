<?php namespace Rtbs\ApiHelper\Models;


class VoucherItem
{
    private $price_key;
    private $qty;
    private $description;


    /**
     * @return string
     */
    public function get_price_key()
    {
        return $this->price_key;
    }


    /**
     * @return string
     */
    public function get_description() {
        return $this->description;
    }


    /**
     * @return int
     */
    public function get_qty() {
        return $this->qty;
    }


    /**
     * @param \stdClass $raw_item
     * @return VoucherItem
     */
    public static function from_raw($raw_item)
    {
        $voucher_item = new self();
        $voucher_item->price_key = $raw_item->price_key;
        $voucher_item->qty = $raw_item->qty;
        $voucher_item->description = $raw_item->description;

        return $voucher_item;
    }

}