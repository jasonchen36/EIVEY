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
    <?php wp_nav_menu(array(
        'theme_location' => 'footer',
        'menu_id' => 'footer-menu',
        'menu_class' => 'standard-menu'
    )); ?>
</footer>
<?php wp_footer(); ?>
</body>
</html>
