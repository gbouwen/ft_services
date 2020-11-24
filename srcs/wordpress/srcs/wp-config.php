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
define( 'DB_CHARSET', 'utf8' );

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
define( 'AUTH_KEY',         'g4g^*f)N7E2W$Z(Y7 [T`aI4+[z)(c(L}?I)i~/U2wPj?hn2g7s+#W>#bJMfH?C7');
define( 'SECURE_AUTH_KEY',  'Sv9at=2em/NG/)SUIxvu4.d<V5Z:S.:YT+h|0TxZF$N@*F+!1E]L]`D`a?BdB+U2');
define( 'LOGGED_IN_KEY',    '!k+P-`6xRn.6I,@V^/7=%>B-7C/_T+pIvl/i@NXlu,hx$(e-^K|.W[I_Ik.bz7Dy');
define( 'NONCE_KEY',        '[Vu-A_H6oBIl~!-fgs<M~YXpk-gC:ayzmV7]xzWr%dW5d;+QW-Ob0J**q<~3A@|J');
define( 'AUTH_SALT',        'R+>I%Pj,!s!J2$Ll-?w%WPdU_(O>-{VaJY|vQH$dRr,KW(@W//-:oA=V<iX1e@#j');
define( 'SECURE_AUTH_SALT', 'C--o7{N3S*KIK52IdeKWd?bGsR4kPH7OVt7q[QOA[#A{8/[]@GR#+G5i@GZIKMm:');
define( 'LOGGED_IN_SALT',   'J46-Q]Ercxr9g0+6fO{I (2|fxPXN_/>$aH|Hx}W/?^7_gL0+gw=j+j1K#2a]n>E');
define( 'NONCE_SALT',       '@L?Z>xeBN7)7~s-EgY8GT&|*;rQ3Q]BCx-V!tO,oy9/er^Sz@W#ON2N1YtJz-GzS');

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

