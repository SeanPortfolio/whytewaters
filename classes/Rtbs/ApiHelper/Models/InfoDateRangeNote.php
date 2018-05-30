<?php namespace Rtbs\ApiHelper\Models;

class InfoDateRangeNote {
    private $name;
    private $note;
    private $start_date;
    private $end_date;

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
    public function get_note()
    {
        return $this->note;
    }

    /**
     * @param mixed $note
     */
    public function set_note($note) {
        $this->note = $note;
    }

    /**
     * @return mixed
     */
    public function get_start_date() {
        return $this->start_date;
    }

    /**
     * @param mixed $start_date
     */
    public function set_start_date($start_date) {
        $this->start_date = $start_date;
    }

    /**
     * @return mixed
     */
    public function get_end_date() {
        return $this->end_date;
    }

    /**
     * @param mixed $end_date
     */
    public function set_end_date($end_date) {
        $this->end_date = $end_date;
    }
    
    public static function from_raw($raw_info_date_range_note) {
        $info_date_range_note = new InfoDateRangeNote();
        
        $info_date_range_note->set_name($raw_info_date_range_note->name);
        $info_date_range_note->set_note($raw_info_date_range_note->note);
        $info_date_range_note->set_start_date($raw_info_date_range_note->start_date);
        $info_date_range_note->set_end_date($raw_info_date_range_note->end_date);

        return $info_date_range_note;
    }
}