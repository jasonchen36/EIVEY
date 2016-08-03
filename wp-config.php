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
define('DB_NAME', 'wordpress_eivey');

/** MySQL database username */
define('DB_USER', 'ei_adm_vey');

/** MySQL database password */
define('DB_PASSWORD', 'fTPx2B2XwX4jV5feUfgB');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '4yP}@W^,HTKq*2]PLwmQ!FM?zXn,~}5R!]jTi#+_cs;`Y#~u8O5qCSUo7i&/Z9q+');
define('SECURE_AUTH_KEY',  's]p)/3on]J4~mw?^DH=cgMPJ7?A8gp^54:|m5e~]88S}V8J8EMbgOmhKVLMfoDhz');
define('LOGGED_IN_KEY',    '@&1`T%8lnf5N7hwov=!Vf7M}<tw!2S?l3=Qd$@08epM5iZg1lfRulH3m7Z{/gmJK');
define('NONCE_KEY',        '^b8RXCEu92AZe!s^`<weXl#y5XudSr}-VHkvIVzR |=cco[@I7F:Me7R`RG+)zvx');
define('AUTH_SALT',        '65q`B(^Y#Uo=q:Y/M8^_E|afVhJ`A=n hk9}~XCghd;OJnWH&+$m8y0D- }h~Jj}');
define('SECURE_AUTH_SALT', 'x5!.2h/%_z_K7|+z=dZI5 7m %PP)fP5m`{@xffq0OFaVtTru|65Ge)+C~pb/Jf!');
define('LOGGED_IN_SALT',   '5*HwlKWzcRNt1Xid?!9`66/>P{zh{l/ih9sf;n7jpacRr3;V:BQ>AYd]+-]#Jq1?');
define('NONCE_SALT',       '^$,bI|Sb]P~i,wl8o[DKjM@=vK,d-zNuG@upQG;QXO9sx1n&`.I8~t^zI8P9L -y');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'evy_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
//Disable File Edits
define('DISALLOW_FILE_EDIT', true);