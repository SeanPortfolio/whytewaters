<?php namespace Rtbs\ApiHelper\Models;


class Customer
{
    private $customer_key;
    private $fname;
    private $lname;
    private $phone;
    private $email;


    /**
     * @param string $customer_key
     */
    public function set_customer_key($customer_key)
    {
        $this->customer_key = $customer_key;
    }


    /**
     * @return string
     */
    public function get_customer_key()
    {
        return $this->customer_key;
    }


    /**
     * @param string $fname
     */
    public function set_fname($fname)
    {
        $this->fname = $fname;
    }


    /**
     * @param string $lname
     */
    public function set_lname($lname)
    {
        $this->lname = $lname;
    }


    /**
     * @param string $phone
     */
    public function set_phone($phone)
    {
        $this->phone = $phone;
    }


    /**
     * @param string $email
     */
    public function set_email($email)
    {
        $this->email = $email;
    }


    /**
     * @return array
     */
    public function to_raw()
    {
        return array(
            'customer_key' => $this->customer_key,
            'fname' => $this->fname,
            'lname' => $this->lname,
            'email' => $this->email,
            'phone' => $this->phone
        );
    }
    

    /**
     * @param \stdClass $raw_customer
     * @return Customer
     */
    public static function from_raw($raw_customer)
    {
        $customer = new self();
        $customer->customer_key = $raw_customer->customer_key;

        return $customer;
    }

}