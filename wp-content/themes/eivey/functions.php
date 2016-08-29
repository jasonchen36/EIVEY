<?php
/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/php/template-tags.php';


/**
 * eivey functions and definitions.
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package eivey
 */

if (!function_exists('eivey_setup')) {
    /**
     * Sets up theme defaults and registers support for various WordPress features.
     *
     * Note that this function is hooked into the after_setup_theme hook, which
     * runs before the init hook. The init hook is too late for some features, such
     * as indicating support for post thumbnails.
     */
    function eivey_setup() {
        /*
         * Let WordPress manage the document title.
         * By adding theme support, we declare that this theme does not use a
         * hard-coded <title> tag in the document head, and expect WordPress to
         * provide it for us.
         */
        add_theme_support('title-tag');

        /*
         * Enable support for Post Thumbnails on posts and pages.
         *
         * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
         */
        add_theme_support('post-thumbnails');

        // This theme uses wp_nav_menu() in one location.
        register_nav_menus(array(
            'homepage' => esc_html__('Homepage', 'eivey'),
            'header' => esc_html__('Header', 'eivey'),
            'footer-left' => esc_html__('Footer Left Column', 'eivey'),
            'footer-center' => esc_html__('Footer Center Column', 'eivey'),
            'footer-right' => esc_html__('Footer Right Column', 'eivey'),
        ));
    }
}
add_action('after_setup_theme', 'eivey_setup');


/**
 * Enqueue scripts and styles.
 */
function eivey_scripts() {
    wp_enqueue_style('font-awesome', 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css');
    wp_enqueue_style('eivey-style-base', '/frontend/build/app.base.min.css');
    wp_enqueue_style('eivey-style-main', '/frontend/build/app.main.min.css');
    wp_enqueue_script('eivey-logic-base', '/frontend/build/app.base.min.js');
//    wp_enqueue_script('eivey-logic-handlebars', '/frontend/build/app.handlebars.min.js');
    wp_enqueue_script('eivey-logic-main', '/frontend/build/app.main.min.js', array(), '20160803', true);
}
add_action('wp_enqueue_scripts', 'eivey_scripts');


/**
 * custom admin css
 */
function arthistory_admin_css() { ?>
    <style>
        #menu-comments, #menu-tools, /* sidebar */
        #wp-admin-bar-wp-logo, #wp-admin-bar-comments, /*top bar*/
        #contextual-help-link-wrap, #screen-options-link-wrap, /* misc */
        #types-information-table /* editor page */
        {
            display: none!important;
        }
    </style>
<?php }

add_action('admin_head', 'arthistory_admin_css');


/**
 * remove unnecessary wp code
 */
function disable_embeds_init() {

    // Remove the REST API endpoint.
    remove_action('rest_api_init', 'wp_oembed_register_route');

    // Turn off oEmbed auto discovery.
    // Don't filter oEmbed results.
    remove_filter('oembed_dataparse', 'wp_filter_oembed_result', 10);

    // Remove oEmbed discovery links.
    remove_action('wp_head', 'wp_oembed_add_discovery_links');

    // Remove oEmbed-specific JavaScript from the front-end and back-end.
    remove_action('wp_head', 'wp_oembed_add_host_js');
}

add_action('init', 'disable_embeds_init', 9999);

remove_action('wp_head', 'print_emoji_detection_script', 7 );
remove_action('wp_print_styles', 'print_emoji_styles');