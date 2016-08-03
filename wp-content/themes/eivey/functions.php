<?php
/**
 * eivey functions and definitions.
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package eivey
 */

if (!function_exists( 'eivey_setup' )) {
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
            'header' => esc_html__('Header', 'eivey'),
            'footer' => esc_html__('Footer', 'eivey'),
        ));
    }
}
add_action( 'after_setup_theme', 'eivey_setup' );


/**
 * Enqueue scripts and styles.
 */
function eivey_scripts() {
    wp_enqueue_style( 'eivey-style', get_stylesheet_uri() );
}
add_action( 'wp_enqueue_scripts', 'eivey_scripts' );
