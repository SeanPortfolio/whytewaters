<?php namespace Rtbs\ApiHelper\Models;

class Media {
    private $type;
    private $name;
    private $image_key;

    /**
     * @return string
     */
    public function get_type() {
        return $this->type;
    }

    /**
     * @param string $type
     */
    public function set_type($type) {
        $this->type = $type;
    }

    /**
     * @return string
     */
    public function get_name() {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function set_name($name) {
        $this->name = $name;
    }

    /**
     * @return int
     */
    public function get_image_key() {
        return $this->image_key;
    }

    /**
     * @param int $image_key
     */
    public function set_image_key($image_key) {
        $this->image_key = $image_key;
    }

    public static function from_raw($raw_media) {
        $media = new Media();

        $media->set_name($raw_media->name);
        $media->set_image_key($raw_media->image_key);
        $media->set_type($raw_media->type);

        return $media;
    }
}