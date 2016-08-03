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
<footer id="menu-footer">
    <h3>Footer</h3>
    <?php wp_nav_menu( array( 'theme_location' => 'footer', 'menu_id' => 'footer-menu' ) ); ?>
</footer>
<?php wp_footer(); ?>
</body>
</html>
