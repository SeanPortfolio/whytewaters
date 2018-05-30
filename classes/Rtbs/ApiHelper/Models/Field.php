<?php namespace Rtbs\ApiHelper\Models;


class Field
{
	const TYPE_SELECT = 'select';

	private $name;
    private $description;
    private $type;
    private $default_value;
    private $options;
    private $is_required;

	/**
	 * @return string
	 */
    public function get_name()
    {
        return $this->name;
    }

	/**
	 * @param string $name
	 */
	public function set_name($name)
	{
		$this->name = $name;
	}

	/**
	 * @return string
	 */
	public function get_description()
	{
		return $this->description;
	}

	/**
	 * @param string $description
	 */
	public function set_description($description)
	{
		$this->description = $description;
	}

    /**
     * @return string
     */
    public function get_type()
    {
        return $this->type;
    }

    /**
     * @param string $type
     */
    public function set_type($type)
    {
        $this->type = $type;
    }

    /**
     * @return string
     */
    public function get_default_value()
    {
        return $this->default_value;
    }

    /**
     * @param string $type
     */
    public function set_default_value($default_value)
    {
        $this->default_value = $default_value;
    }

    /**
     * @return string[]
     */
    public function get_options()
    {
        return $this->options;
    }

    /**
     * @param bool $is_required
     */
    public function set_required($is_required)
    {
        $this->is_required = $is_required;
    }

    /**
     * @return bool
     */
    public function is_required()
    {
        return $this->is_required;
    }

    /**
     * @param string[] $options
     */
    public function set_options($options)
    {
        $this->options = $options;
    }

	/**
	 * @param \stdClass $raw_field
	 *
	 * @return Field
	 */
    public static function from_raw($raw_field) {
        $field = new Field();

        if (property_exists($raw_field, 'name')) {
	        $field->set_name($raw_field->name);
        }

	    if (property_exists($raw_field, 'description')) {
		    $field->set_description($raw_field->description);
	    }

        if (property_exists($raw_field, 'type')) {
            $field->set_type($raw_field->type);
        }

        if (property_exists($raw_field, 'default_value')) {
            $field->set_default_value($raw_field->default_value);
        }

        if (property_exists($raw_field, 'options')) {
            $field->set_options($raw_field->options);
        }

        if (property_exists($raw_field, 'is_required')) {
            $field->set_required($raw_field->is_required);
        }

        return $field;
    }
}