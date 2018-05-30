<?php namespace Rtbs\ApiHelper\Models;


class Obl
{
    private $browser_title;
    private $id;
    private $style_css;
    private $supplier_key;
    private $theme;
    private $tour_keys = array();
    private $url_banner_img;
    private $url_complete;
    private $url_website;
    private $url_facebook;
    private $is_latipay_payment_gateway;
    private $operator_status_msg;
    private $is_mouseflow_tracking;
    private $is_active;
    private $operator_email;
    private $operator_phone;
    private $operator_phone_free;
    private $operator_name;
    private $url_operator_img;
    private $url_spinner_img;
    private $url_background_img;

    private $color_body_bg;
    private $color_body_text;
    private $color_page_bg;
    private $color_page_content_bg;
    private $color_page_content_text;
    private $color_page_heading_text;
    private $color_page_line;
    private $color_page_link_text;
    private $color_page_link_bg;
    private $color_page_link_hover_text;
    private $color_page_link_hover_bg;

    private $color_grid_bg;
    private $color_grid_text;

    private $color_navbar_bg;
    private $color_navbar_content_bg;
    private $color_navbar_next_text;
    private $color_navbar_prev_text;
    private $color_navbar_prev_bg;
    private $color_navbar_prev_hover_text;
    private $color_navbar_prev_hover_bg;
    private $color_navbar_curr_text;
    private $color_navbar_curr_bg;
    private $color_navbar_curr_hover_text;
    private $color_navbar_curr_hover_bg;

    private $color_button_default_bg;
    private $color_button_default_text;
    private $color_button_default_hover_bg;
    private $color_button_default_hover_text;
    private $color_button_primary_bg;
    private $color_button_primary_text;
    private $color_button_primary_hover_bg;
    private $color_button_primary_hover_text;
    private $color_button_gridnav_bg;
    private $color_button_gridnav_text;
    private $color_button_gridnav_hover_bg;
    private $color_button_gridnav_hover_text;
    private $color_button_booknow_bg;
    private $color_button_booknow_text;
    private $color_button_booknow_hover_bg;
    private $color_button_booknow_hover_text;

    private $color_activity_block_bg;
    private $color_activity_block_text;
    private $color_page_header_bg;
    private $color_page_header_content_bg;
    private $color_page_footer_bg;
    private $color_page_footer_content_bg;
    private $color_grid_head_bg;
    private $color_grid_head_text;
    private $color_grid_hover_bg;
    private $color_grid_hover_text;

    private $color_mobile_theme;

    private $has_promo_codes;
    private $has_vouchers;


    /**
     * @return string
     */
    public function get_id()
    {
        return $this->id;
    }


    /**
     * @param string $obl_id
     */
    public function set_id($obl_id)
    {
        $this->id = $obl_id;
    }


    /**
     * @param string $title
     */
    public function set_browser_title($title)
    {
        $this->browser_title = $title;
    }


    /**
     * @param string|null $append
     * @return string
     */
    public function get_browser_title($append = null)
    {
        if (!empty($this->browser_title)) {
            $browser_title = $this->browser_title;

            if ($append) {
                $browser_title .= " - {$append}";
            }
        } else {
            $browser_title = $append;
        }

        return $browser_title;
    }


    /**
     * @return string
     */
    public function get_style_css()
    {
        return $this->style_css;
    }


    /**
     * @return string
     */
    public function get_url_complete()
    {
        return $this->url_complete;
    }


    /**
     * @return string
     */
    public function get_url_banner_img()
    {
        return $this->url_banner_img;
    }


    /**
     * @param string $url_banner_img
     */
    public function set_url_banner_img($url_banner_img)
    {
        $this->url_banner_img = $url_banner_img;
    }


    /**
     * @return string
     */
    public function get_url_spinner_img()
    {
        return $this->url_spinner_img;
    }


    /**
     * @param string $url_background_img
     */
    public function set_url_background_img($url_background_img)
    {
        $this->url_background_img = $url_background_img;
    }


    /**
     * @return string
     */
    public function get_url_background_img()
    {
        return $this->url_background_img;
    }


    /**
     * @return string
     */
    public function get_url_website()
    {
        return $this->url_website;
    }


    /**
     * @param string $url_website
     */
    public function set_url_website($url_website)
    {
        $this->url_website = $url_website;
    }


    /**
     * @return string[]
     */
    public function get_tour_keys()
    {
        return $this->tour_keys;
    }


    /**
     * @return string
     */
    public function get_supplier_key()
    {
        return $this->supplier_key;
    }


    /**
     * @return string
     */
    public function get_theme()
    {
        return $this->theme;
    }


    /**
     * @return string
     */
    public function get_is_latipay_payment_gateway()
    {
        return $this->is_latipay_payment_gateway;
    }


    /**
     * @return string
     */
    public function get_operator_status_msg()
    {
        return $this->operator_status_msg;
    }


    /**
     * @return string
     */
    public function get_operator_email()
    {
        return $this->operator_email;
    }


    /**
     * @return string
     */
    public function get_operator_phone()
    {
        return $this->operator_phone;
    }


    /**
     * @return string
     */
    public function get_operator_phone_free()
    {
        return $this->operator_phone_free;
    }


    /**
     * @return string
     */
    public function get_operator_name()
    {
        return $this->operator_name;
    }


    /**
     * @return bool
     */
    public function get_is_mouseflow_tracking()
    {
        return $this->is_mouseflow_tracking;
    }


    /**
     * @return bool
     */
    public function get_is_active()
    {
        return $this->is_active;
    }


	/**
	 * @return string|null
	 */
    public function get_url_facebook()
    {
    	return $this->url_facebook;
    }


    /**
     * @param string|null $url_facebook
     */
    public function set_url_facebook($url_facebook)
    {
        $this->url_facebook = $url_facebook;
    }


    /**
     * @return string|null
     */
    public function get_url_operator_img()
    {
        return $this->url_operator_img;
    }


    /**
     * @return string|null
     */
    public function get_color_body_bg()
    {
        return $this->color_body_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_body_text()
    {
        return $this->color_body_text;
    }


    /**
     * @return string|null
     */
    public function get_color_page_bg()
    {
        return $this->color_page_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_page_content_bg()
    {
        return $this->color_page_content_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_page_content_text()
    {
        return $this->color_page_content_text;
    }


    /**
     * @return string|null
     */
    public function get_color_page_heading_text()
    {
        return $this->color_page_heading_text;
    }


    /**
     * @return string|null
     */
    public function get_color_page_line()
    {
        return $this->color_page_line;
    }


    /**
     * @return string|null
     */
    public function get_color_page_link_text()
    {
        return $this->color_page_link_text;
    }


    /**
     * @return string|null
     */
    public function get_color_page_link_bg()
    {
        return $this->color_page_link_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_page_link_hover_text()
    {
        return $this->color_page_link_hover_text;
    }


    /**
     * @return string|null
     */
    public function get_color_page_link_hover_bg()
    {
        return $this->color_page_link_hover_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_grid_bg()
    {
        return $this->color_grid_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_grid_text()
    {
        return $this->color_grid_text;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_bg()
    {
        return $this->color_navbar_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_content_bg()
    {
        return $this->color_navbar_content_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_next_text()
    {
        return $this->color_navbar_next_text;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_prev_text()
    {
        return $this->color_navbar_prev_text;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_prev_bg()
    {
        return $this->color_navbar_prev_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_prev_hover_text()
    {
        return $this->color_navbar_prev_hover_text;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_prev_hover_bg()
    {
        return $this->color_navbar_prev_hover_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_curr_text()
    {
        return $this->color_navbar_curr_text;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_curr_bg()
    {
        return $this->color_navbar_curr_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_curr_hover_text()
    {
        return $this->color_navbar_curr_hover_text;
    }


    /**
     * @return string|null
     */
    public function get_color_navbar_curr_hover_bg()
    {
        return $this->color_navbar_curr_hover_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_button_default_bg()
    {
        return $this->color_button_default_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_button_default_text()
    {
        return $this->color_button_default_text;
    }


    /**
     * @return string|null
     */
    public function get_color_button_default_hover_bg()
    {
        return $this->color_button_default_hover_bg;
    }

    /**
     * @return string|null
     */
    public function get_color_button_default_hover_text()
    {
        return $this->color_button_default_hover_text;
    }


    /**
     * @return string|null
     */
    public function get_color_button_primary_bg()
    {
        return $this->color_button_primary_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_button_primary_text()
    {
        return $this->color_button_primary_text;
    }


    /**
     * @return string|null
     */
    public function get_color_button_primary_hover_bg()
    {
        return $this->color_button_primary_hover_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_button_primary_hover_text()
    {
        return $this->color_button_primary_hover_text;
    }


    /**
     * @return string|null
     */
    public function get_color_button_gridnav_bg()
    {
        return $this->color_button_gridnav_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_button_gridnav_text()
    {
        return $this->color_button_gridnav_text;
    }


    /**
     * @return string|null
     */
    public function get_color_button_gridnav_hover_bg()
    {
        return $this->color_button_gridnav_hover_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_button_gridnav_hover_text()
    {
        return $this->color_button_gridnav_hover_text;
    }


    /**
     * @return string|null
     */
    public function get_color_button_booknow_bg()
    {
        return $this->color_button_booknow_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_button_booknow_text()
    {
        return $this->color_button_booknow_text;
    }


    /**
     * @return string|null
     */
    public function get_color_button_booknow_hover_bg()
    {
        return $this->color_button_booknow_hover_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_button_booknow_hover_text()
    {
        return $this->color_button_booknow_hover_text;
    }
    

    /**
     * @return string|null
     */
    public function get_color_activity_block_bg()
    {
        return $this->color_activity_block_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_activity_block_text()
    {
        return $this->color_activity_block_text;
    }


    /**
     * @return string|null
     */
    public function get_color_page_header_bg()
    {
        return $this->color_page_header_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_page_header_content_bg()
    {
        return $this->color_page_header_content_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_page_footer_bg()
    {
        return $this->color_page_footer_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_page_footer_content_bg()
    {
        return $this->color_page_footer_content_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_grid_head_bg()
    {
        return $this->color_grid_head_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_grid_head_text()
    {
        return $this->color_grid_head_text;
    }


    /**
     * @return string|null
     */
    public function get_color_grid_hover_bg()
    {
        return $this->color_grid_hover_bg;
    }


    /**
     * @return string|null
     */
    public function get_color_grid_hover_text()
    {
        return $this->color_grid_hover_text;
    }


    /**
     * @return string|null
     */
    public function get_color_mobile_theme()
    {
        return $this->color_mobile_theme;
    }


    /**
     * @return bool
     */
    public function has_promo_codes()
    {
        return $this->has_promo_codes;
    }


    /**
     * @return bool
     */
    public function has_vouchers()
    {
        return $this->has_vouchers;
    }


    /**
     * @param \stdClass $raw_obl
     * @return Obl
     */
    public static function from_raw($raw_obl)
    {
        $obl = new self();

        $obl->id = $raw_obl->obl_id;
        $obl->browser_title = $raw_obl->browser_title;
        $obl->style_css = $raw_obl->style_css;

        if (!empty($raw_obl->theme)) {
            $obl->theme = $raw_obl->theme;
        }

        $obl->url_complete = $raw_obl->url_complete;
        $obl->url_website = $raw_obl->url_website;
        $obl->url_banner_img = $raw_obl->url_banner_img;
        $obl->tour_keys = $raw_obl->tour_keys;
        $obl->has_promo_codes = $raw_obl->has_promo_codes;

        if (property_exists($raw_obl, 'has_vouchers')) {
		    $obl->has_vouchers = $raw_obl->has_vouchers;
	    }

        if (property_exists($raw_obl, 'is_latipay_payment_gateway')) {
            $obl->is_latipay_payment_gateway = $raw_obl->is_latipay_payment_gateway;
        }

        if (property_exists($raw_obl, 'is_mouseflow_tracking')) {
            $obl->is_mouseflow_tracking = $raw_obl->is_mouseflow_tracking;
        }

        if (property_exists($raw_obl, 'is_active')) {
            $obl->is_active = $raw_obl->is_active;
        }

        if (property_exists($raw_obl, 'operator_status_msg')) {
            $obl->operator_status_msg = $raw_obl->operator_status_msg;
        }

        if (property_exists($raw_obl, 'operator_email')) {
            $obl->operator_email = $raw_obl->operator_email;
        }

        if (property_exists($raw_obl, 'operator_phone')) {
            $obl->operator_phone = $raw_obl->operator_phone;
        }

        if (property_exists($raw_obl, 'operator_phone_free')) {
            $obl->operator_phone_free = $raw_obl->operator_phone_free;
        }

        if (property_exists($raw_obl, 'operator_name')) {
            $obl->operator_name = $raw_obl->operator_name;
        }

	    if (property_exists($raw_obl, 'url_facebook')) {
		    $obl->url_facebook = $raw_obl->url_facebook;
	    }

        if (property_exists($raw_obl, 'url_operator_img')) {
            $obl->url_operator_img = $raw_obl->url_operator_img;
        }

        if (property_exists($raw_obl, 'url_spinner_img')) {
            $obl->url_spinner_img = $raw_obl->url_spinner_img;
        }

        if (property_exists($raw_obl, 'url_background_img')) {
            $obl->url_background_img = $raw_obl->url_background_img;
        }


        // colors
        $obl->color_body_bg = $raw_obl->obl_color_body_bg;
        $obl->color_body_text = $raw_obl->obl_color_body_text;
        $obl->color_page_bg = $raw_obl->obl_color_page_bg;
        $obl->color_page_content_bg = $raw_obl->obl_color_page_content_bg;
        $obl->color_page_content_text = $raw_obl->obl_color_page_content_text;
        $obl->color_page_heading_text = $raw_obl->obl_color_page_heading_text;
        $obl->color_page_line = $raw_obl->obl_color_page_line;
        $obl->color_page_link_text = $raw_obl->obl_color_page_link_text;
        $obl->color_page_link_bg = $raw_obl->obl_color_page_link_bg;
        $obl->color_page_link_hover_text = $raw_obl->obl_color_page_link_hover_text;
        $obl->color_page_link_hover_bg = $raw_obl->obl_color_page_link_hover_bg;

        $obl->color_grid_bg = $raw_obl->obl_color_grid_bg;
        $obl->color_grid_text = $raw_obl->obl_color_grid_text;

        $obl->color_navbar_bg = $raw_obl->obl_color_navbar_bg;
        $obl->color_navbar_content_bg = $raw_obl->obl_color_navbar_content_bg;
        $obl->color_navbar_next_text = $raw_obl->obl_color_navbar_next_text;
        $obl->color_navbar_prev_text = $raw_obl->obl_color_navbar_prev_text;
        $obl->color_navbar_prev_bg = $raw_obl->obl_color_navbar_prev_bg;
        $obl->color_navbar_prev_hover_text = $raw_obl->obl_color_navbar_prev_hover_text;
        $obl->color_navbar_prev_hover_bg = $raw_obl->obl_color_navbar_prev_hover_bg;
        $obl->color_navbar_curr_text = $raw_obl->obl_color_navbar_curr_text;
        $obl->color_navbar_curr_bg = $raw_obl->obl_color_navbar_curr_bg;
        $obl->color_navbar_curr_hover_text = $raw_obl->obl_color_navbar_curr_hover_text;
        $obl->color_navbar_curr_hover_bg = $raw_obl->obl_color_navbar_curr_hover_bg;

        $obl->color_button_default_bg = $raw_obl->obl_color_button_default_bg;
        $obl->color_button_default_text = $raw_obl->obl_color_button_default_text;
        $obl->color_button_default_hover_bg = $raw_obl->obl_color_button_default_hover_bg;
        $obl->color_button_default_hover_text = $raw_obl->obl_color_button_default_hover_text;
        $obl->color_button_primary_bg = $raw_obl->obl_color_button_primary_bg;
        $obl->color_button_primary_text = $raw_obl->obl_color_button_primary_text;
        $obl->color_button_primary_hover_bg = $raw_obl->obl_color_button_primary_hover_bg;
        $obl->color_button_primary_hover_text = $raw_obl->obl_color_button_primary_hover_text;
        $obl->color_button_gridnav_bg = $raw_obl->obl_color_button_gridnav_bg;
        $obl->color_button_gridnav_text = $raw_obl->obl_color_button_gridnav_text;
        $obl->color_button_gridnav_hover_bg = $raw_obl->obl_color_button_gridnav_hover_bg;
        $obl->color_button_gridnav_hover_text = $raw_obl->obl_color_button_gridnav_hover_text;



	    if (property_exists($raw_obl, 'obl_color_button_booknow_bg')) {
		    $obl->color_button_booknow_bg = $raw_obl->obl_color_button_booknow_bg;
	    }

	    if (property_exists($raw_obl, 'obl_color_button_booknow_text')) {
		    $obl->color_button_booknow_text = $raw_obl->obl_color_button_booknow_text;
	    }

	    if (property_exists($raw_obl, 'obl_color_button_booknow_hover_bg')) {
		    $obl->color_button_booknow_hover_bg = $raw_obl->obl_color_button_booknow_hover_bg;
	    }

	    if (property_exists($raw_obl, 'obl_color_button_booknow_hover_text')) {
		    $obl->color_button_booknow_hover_text = $raw_obl->obl_color_button_booknow_hover_text;
	    }

        $obl->color_activity_block_bg = $raw_obl->obl_color_activity_block_bg;
        $obl->color_activity_block_text = $raw_obl->obl_color_activity_block_text;

        $obl->color_page_header_bg = $raw_obl->obl_color_page_header_bg;
        $obl->color_page_header_content_bg = $raw_obl->obl_color_page_header_content_bg;
        $obl->color_page_footer_bg = $raw_obl->obl_color_page_footer_bg;
        $obl->color_page_footer_content_bg = $raw_obl->obl_color_page_footer_content_bg;

        $obl->color_grid_head_bg = $raw_obl->obl_color_grid_head_bg;
        $obl->color_grid_head_text = $raw_obl->obl_color_grid_head_text;
        $obl->color_grid_hover_bg = $raw_obl->obl_color_grid_hover_bg;
        $obl->color_grid_hover_text = $raw_obl->obl_color_grid_hover_text;
	    
	    if (property_exists($raw_obl, 'obl_color_mobile_theme')) {
		    $obl->color_mobile_theme = $raw_obl->obl_color_mobile_theme;
	    }

        if (!empty($raw_obl->supplier_key)) {
            $obl->supplier_key = $raw_obl->supplier_key;
        }

        return $obl;
    }

}