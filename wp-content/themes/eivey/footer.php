<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package eivey
 */

?>
<footer class="small-grid-container text-center">
    <h3 id="footer-tagline">Follow Us!</h3>
    <div id="footer-social-accounts">
        <a href="https://www.facebook.com/eiveydotca" target="_blank">
            <i class="fa fa-facebook" aria-hidden="true"></i>
        </a>
        <a href="https://www.instagram.com/eiveydotca" target="_blank">
            <i class="fa fa-instagram" aria-hidden="true"></i>
        </a>
        <a href="http://twitter.com/eiveydotca" target="_blank">
            <i class="fa fa-twitter" aria-hidden="true"></i>
        </a>
        <a href="https://www.pinterest.com/eiveydotca" target="_blank">
            <i class="fa fa-pinterest-p" aria-hidden="true"></i>
        </a>
    </div>
</footer>
<section id="footer-menu-container">
    <nav class="extra-small-grid-container">
        <div class="small-12 medium-4">
            <h4 class="footer-menu-title">Support</h4>
            <?php wp_nav_menu(array(
                'theme_location' => 'footer-left',
                'menu_class' => 'standard-menu-footer'
            )); ?>
        </div>
        <div class="small-12 medium-4">
            <?php wp_nav_menu(array(
                'theme_location' => 'footer-center',
                'menu_class' => 'standard-menu-footer'
            )); ?>
        </div>
        <div class="small-12 medium-4 grid-end">
            <h4 class="footer-menu-title">Company</h4>
            <?php wp_nav_menu(array(
                'theme_location' => 'footer-right',
                'menu_class' => 'standard-menu-footer'
            )); ?>
        </div>
    </nav>
    <h5 id="footer-trademark" class="small-grid-container">&copy; <?php echo date('Y');?> EIVEY.  All rights reserved, EIVEY <sup>&copy;</sup> is a registered trademark of Eivey</h5>
</section>
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
<?php wp_footer(); ?>
</body>
</html>
