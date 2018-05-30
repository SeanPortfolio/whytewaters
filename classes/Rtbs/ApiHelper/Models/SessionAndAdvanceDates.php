<?php namespace Rtbs\ApiHelper\Models;


class SessionAndAdvanceDates {

    /** @var Session[] $sessions */
    private $sessions = array();

    private $advance_dates = array();

    /**
     * @return Session[]
     */
    public function get_sessions()
    {
        return $this->sessions;
    }

    /**
     * @param Session $session
     */
    public function add_session($session)
    {
        $this->sessions[] = $session;
    }

    /**
     * @return array
     */
    public function get_advance_dates()
    {
        return $this->advance_dates;
    }

    /**
     * @param array $advance_dates
     */
    public function set_advance_dates($advance_dates)
    {
        $this->advance_dates = $advance_dates;
    }

    /**
     * @return string
     */
    public function get_first_advance_date()
    {
        $earliest_advance_date = null;

        foreach ($this->advance_dates as $advance_date) {
            if ($earliest_advance_date == null || $earliest_advance_date > $advance_date->date) {
                $earliest_advance_date = $advance_date->date;
            }
        }

        return $earliest_advance_date;
    }

    /**
     * @param array|string $tour_keys
     * @param bool $open_only
     * @return null|string first available session datetime, or null if none exists
     */
    public function get_first_available_session_datetime($tour_keys = null, $open_only = false) {

        $first_available_datetime = null;

        if (!empty($tour_keys) && !is_array($tour_keys)) {
            $tour_keys = array($tour_keys);
        }

        foreach ($this->sessions as $session) {

            if (!empty($tour_keys) && !in_array($session->get_tour_key(), $tour_keys)) {
                continue;
            }

            if ($open_only && !$session->is_open()) {
                continue;
            }

            if (empty($first_available_datetime)) {
                $first_available_datetime = $session->get_datetime();
            }

            if ($session->get_datetime() < $first_available_datetime) {
                $first_available_datetime = $session->get_datetime();
            }
        }
        return $first_available_datetime;
    }

}