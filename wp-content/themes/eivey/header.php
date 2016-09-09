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
    <link rel="apple-touch-icon" sizes="57x57" href="/frontend/assets/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/frontend/assets/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/frontend/assets/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/frontend/assets/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/frontend/assets/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/frontend/assets/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/frontend/assets/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/frontend/assets/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/frontend/assets/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="/frontend/assets/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/frontend/assets/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/frontend/assets/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/frontend/assets/favicon/favicon-16x16.png">
    <link rel="manifest" href="/frontend/assets/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/frontend/assets/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link rel="profile" href="http://gmpg.org/xfn/11">
    <?php wp_head(); ?>
</head>
<body <?php body_class('wordpress'); ?>>
<!--desktop menu-->
<header class="grid-container show-for-large">
    <nav id="menu-header-secondary-container" class="small-12 text-right">
        <?php wp_nav_menu(array(
            'theme_location' => 'header_secondary',
            'menu_id' => 'menu-header-secondary',
            'menu_class' => 'standard-menu'
        )); ?>
    </nav>
    <div class="small-12 text-center show-for-large">
        <a href="/">
            <div class="i--icon-logo"></div>
        </a>
        <span id="logo-tagline-border"></span>
        <div id="logo-tagline">
            Buy &amp; Sell Pre-Loved Designer Fashion
        </div>
    </div>
</header>
<!--mobile menu-->
<header id="header-menu-mobile-container" class="grid-container hide-for-large">
    <div class="small-3">
        <a href="#">
            <div class="i--icon-menu l--menu-open"></div>
        </a>
    </div>
    <div class="small-6">
        <a href="/">
            <div class="i--icon-logo-white"></div>
        </a>
    </div>
    <div class="small-3 grid-end text-right">
        <a href="#" class="show-for-sharetribe">
            <div class="i--icon-user"></div>
        </a>
        <a href="#" class="show-for-sharetribe">
            <div class="i--icon-bag"></div>
        </a>
    </div>
    <div class="small-12 no-padding">
        <div class="search-form-input-container">
            <input type="text" class="search-form-input"/>
            <a href="#" class="search-form-submit i--icon-search l--search-submit"></a>
        </div>
    </div>
</header>
<div id="mobile-menu-fullscreen-container" class="full-screen-takeover faded-out">
    <a href="#" class="mobile-menu-close l--menu-close">X</a>
    <h3 class="mobile-menu-header">Clothing</h3>
    <?php wp_nav_menu(array(
        'theme_location' => 'homepage',
        'menu_id' => 'menu-categories-mobile',
        'menu_class' => 'standard-menu'
    )); ?>
    <h3 class="mobile-menu-header">Company</h3>
    <?php wp_nav_menu(array(
        'theme_location' => 'header_secondary',
        'menu_id' => 'menu-header-secondary-mobile',
        'menu_class' => 'standard-menu'
    )); ?>
</div>