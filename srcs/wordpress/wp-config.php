<?php

define('DB_NAME', 'wordpress');
define('DB_USER', 'jlyessa');
define('DB_PASSWORD', 'jlyessa');
define('DB_HOST', 'mysql-svc');
define('DB_CHARSET', 'utf8');

define('DB_COLLATE', '');

define('WP_HOME', 'http://192.168.49.3:5050');
define('WP_SITEURL', 'http://192.168.49.3:5050');

define('AUTH_KEY',         'jlyessa');
define('SECURE_AUTH_KEY',  'jlyessa');
define('LOGGED_IN_KEY',    'jlyessa');
define('NONCE_KEY',        'jlyessa');
define('AUTH_SALT',        'jlyessa');
define('SECURE_AUTH_SALT', 'jlyessa');
define('LOGGED_IN_SALT',   'jlyessa');
define('NONCE_SALT',       'jlyessa');

$table_prefix = 'wp_';

define('WP_DEBUG', true);

if (!defined( 'ABSPATH')) {
	define('ABSPATH', __DIR__ . '/');
}
require_once ABSPATH . 'wp-settings.php';

