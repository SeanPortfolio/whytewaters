<?php namespace Rtbs\ApiHelper\Models;


class Voucher
{
    private $voucher_key;
    private $voucher_description;
    private $recipient_name;
    private $recipient_message;
    private $tour_key;
    private $tour_name;
    private $voucher_items = array();


    /**
     * @return string
     */
    public function get_voucher_key()
    {
        return $this->voucher_key;
    }


    /**
     * @return string
     */
    public function get_voucher_description()
    {
        return $this->voucher_description;
    }


    /**
     * @return string
     */
    public function get_recipient_name()
    {
        return $this->recipient_name;
    }


    /**
     * @return string
     */
    public function get_recipient_message()
    {
        return $this->recipient_message;
    }


    /**
     * @return string
     */
    public function get_tour_key()
    {
        return $this->tour_key;
    }


    /**
     * @return string
     */
    public function get_tour_name()
    {
        return $this->tour_name;
    }


    /**
     * @return VoucherItem[]
     */
    public function get_voucher_items()
    {
        return $this->voucher_items;
    }


    /**
     * @param \stdClass $raw_voucher
     * @return Voucher
     */
    public static function from_raw($raw_voucher)
    {
        $voucher = new self();
        $voucher->voucher_key = $raw_voucher->voucher_key;
        $voucher->voucher_description = $raw_voucher->voucher_description;

        $voucher->recipient_name = $raw_voucher->recipient_name;
        $voucher->recipient_message = $raw_voucher->recipient_message;

        $voucher->tour_key = $raw_voucher->tour_key;
        $voucher->tour_name = $raw_voucher->tour_name;

        foreach($raw_voucher->voucher_items as $raw_voucher_item) {
            $voucher->voucher_items[] = VoucherItem::from_raw($raw_voucher_item);
        }

        return $voucher;
    }

}