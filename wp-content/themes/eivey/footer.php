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
        <a href="https://www.facebook.com/eivey.ca" target="_blank">
            <i class="fa fa-facebook" aria-hidden="true"></i>
        </a>
        <a href="https://www.instagram.com/eiveycanada" target="_blank">
            <i class="fa fa-instagram" aria-hidden="true"></i>
        </a>
        <a href="http://twitter.com/eivey_ca" target="_blank">
            <i class="fa fa-twitter" aria-hidden="true"></i>
        </a>
        <a href="https://www.pinterest.com/eiveycanada/" target="_blank">
            <i class="fa fa-pinterest-p" aria-hidden="true"></i>
        </a>
    </div>
    <h5 id="footer-trademark">&copy; <?php echo date('Y');?> EIVEY.  All rights reserved, EIVEY <sup>&copy;</sup> is a registered trademark of Eivey</h5>
    <nav id="menu-footer-container">
        <?php wp_nav_menu(array(
            'theme_location' => 'footer',
            'menu_id' => 'menu-footer',
            'menu_class' => 'standard-menu'
        )); ?>
    </nav>
</footer>
<?php wp_footer(); ?>
</body>
</html>
