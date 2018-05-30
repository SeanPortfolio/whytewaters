<?php namespace Rtbs\ApiHelper\Models;


class Itinerary 
{
    private $itinerary_key;


    /**
     * @param \stdClass $raw_itinerary
     * @return Itinerary
     */
    public static function from_raw($raw_itinerary)
    {
        $itinerary = new self();
        $itinerary->itinerary_key = $raw_itinerary->itinerary_key;
        return $itinerary;
    }


    /**
     * @return string
     */
    public function get_itinerary_key() 
    {
        return $this->itinerary_key;
    }


    /**
     * @param string $itinerary_key
     */
    public function set_itinerary_key($itinerary_key) 
    {
        $this->itinerary_key = $itinerary_key;
    }
    
}