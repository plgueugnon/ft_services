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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'dbprojet' );

/** MySQL database username */
define( 'DB_USER', 'yo' );

/** MySQL database password */
define( 'DB_PASSWORD', 'yopwd' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'WP_DEBUG', false );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          ';Qg$8$oNo*oqp3yMLutn`T}1mxe,y@QrH k36;@[ZYG;@#5dhSde1wv2*VT,%WWS' );
define( 'SECURE_AUTH_KEY',   '(;rw2VyD-{%Cc(7cPBRP?Xc#itiUd|2&2z,~@mW]6q8vciu-&.]2pK>[k^pxR,)C' );
define( 'LOGGED_IN_KEY',     'spYX:NQ:l,VECT!E1+MI*JYmpJoHkw%N)2ojD#Jyb@%VnSGgcTj3L#;10MfkuQ<`' );
define( 'NONCE_KEY',         'bmb(2/Lz5k}fvQTf/5%hy*d}-k/]9S08~X]Nx.9l6uJ!RP?%n5] [R^;/YG4c5/w' );
define( 'AUTH_SALT',         '/qU>^%}5&A#RB72s6-]1XI65B AgkP,/l%_8%XA1!xl<COJEeC6b_1$GxPsZpZ7*' );
define( 'SECURE_AUTH_SALT',  'VT-2tJ_QWdc9F2$QAq<i7-i90f1,n0TRi/CCG3#~{qk]:!rF=mTDNPAHx>M[#(b*' );
define( 'LOGGED_IN_SALT',    '_zM8-nly__.cq1ax%KcAbBida|XhUBpowLHDtb<k<?Ko<lb0:PfOC!2S]N6K7l>u' );
define( 'NONCE_SALT',        '}lN.3}t4B75jMW&MD:{;i10,w_;jxEb{XI3C;VE|QiXjIM[o4-ffU-4UElKQ/ Wo' );
define( 'WP_CACHE_KEY_SALT', 'Vhq*T>PMVZ&Q=w!#kbQI$5LwUWNNjZoFYuO_XSLM+vxU8)y=[WD7Ff$ &##Du>K?' );

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';




/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';