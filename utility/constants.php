<?php

/* ==| CONSTANTS ============================= */

if( !defined('DS') )            define('DS', DIRECTORY_SEPARATOR);

if( !defined('FLAG_YES') )      define('FLAG_YES', 'Y');
if( !defined('FLAG_NO') )       define('FLAG_NO', 'N');

if(!defined('FLAG_ACTIVE'))     define('FLAG_ACTIVE', 'A');
if(!defined('FLAG_HIDDEN'))     define('FLAG_HIDDEN', 'H');
if(!defined('FLAG_DELETED'))    define('FLAG_DELETED', 'D');

if(!defined('HOME_TEMPLATE_ID'))      define('HOME_TEMPLATE_ID', '1');
if(!defined('DEFAULT_TEMPLATE_ID'))   define('DEFAULT_TEMPLATE_ID', '2');

/* ==| RTBS API============================= */
if(!defined('RTBS_PRODUCTION_MODE'))   define('RTBS_PRODUCTION_MODE', 'N');

if(!defined('TOUR_SESSION_DAY_LIMIT'))   define('TOUR_SESSION_DAY_LIMIT', '5');

if(!defined('STATUS_UNCONFIRMED'))   define('STATUS_UNCONFIRMED', 'UNCONFIRMED');
if(!defined('STATUS_CONFIRMED'))     define('STATUS_CONFIRMED', 'CONFIRMED');

?>