<?php
/**
 * The header for our theme.
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package eivey
 */

?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo( 'charset' ); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="http://gmpg.org/xfn/11">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<header class="grid-container">
    <nav id="menu-header-secondary" class="small-12 text-right">
        <?php wp_nav_menu(array(
            'theme_location' => 'header_secondary', 
            'menu_id' => 'header-menu-secondary',
            'menu_class' => 'standard-menu'
        )); ?>
    </nav>
    <div class="small-12 text-center">
        <a href="/">
            <div class="i--icon-logo"></div>
        </a>
        <span id="logo-tagline-border"></span>
        <div id="logo-tagline">
            Buy &amp; Sell Pre-Loved Designer Fashion
        </div>
    </div>
    <div class="small-12">
        <nav id="menu-header" class="standard-menu">
            <?php wp_nav_menu(array( 
                'theme_location' => 'header', 
                'menu_id' => 'header-menu',
                'menu_class' => 'standard-menu'
            )); ?>
        </nav>
    </div>
</header>