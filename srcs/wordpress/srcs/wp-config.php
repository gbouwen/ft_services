<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '>Z7.Q`C*]@O{`GhQ1<@CkQ]F-yoyzJG*C9LRvOozN3y-XwWd>w=a%B/$I,n>rqg!' );
define( 'SECURE_AUTH_KEY',  '69}(#474?/8]`y82^ htTT[,wW<2~kVS0Aav2=!Bi+NzGnZ>?!%}6M/l.R`EVq;a' );
define( 'LOGGED_IN_KEY',    'nUs]i>,.P<coL0]>a;8Big H{Sk9tI|u&kW[iMSS35(e@M7(4We;j5+vg]R _x{o' );
define( 'NONCE_KEY',        '*SL5kJQhgnxx35F$6L|z905u2zX/^AHrrg})Lv6eCYt.#+pODP]5wb7s~Ht2<> O' );
define( 'AUTH_SALT',        'oOyF5e(6dXK^j5X{%Eg<uR7T-8:!)qJSXm/<G`ratuJ4TddYs.) c3(qgV(5w#7m' );
define( 'SECURE_AUTH_SALT', 'In{R~)F>Yxvme?jQY4]bhU;xtWO[2kAHrV5s&F99T$3Qe[.T*.TW*Iag{6|lMcl*' );
define( 'LOGGED_IN_SALT',   'k?x+!-B=R;aMvKOz/#C}+ygP-BGz%/@39&,>&.Qu.%M`(wuGHRXS^}+{9?V(Lyc,' );
define( 'NONCE_SALT',       '$8Eved]-ye@JbEW=EJAoRV36=SPiYO1#}{9T6.~~$*#N6{HAdclHZfXp9?B|H<AN' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

