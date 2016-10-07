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

function getSocialAccounts(){ ?>
    <a href="https://www.facebook.com/eiveydotca" target="_blank">
        <i class="fa fa-facebook" aria-hidden="true"></i>
    </a>
    <a href="https://www.instagram.com/eiveydotca" target="_blank">
        <i class="fa fa-instagram" aria-hidden="true"></i>
    </a>
    <a href="https://www.pinterest.com/eiveydotca" target="_blank">
        <i class="fa fa-pinterest-p" aria-hidden="true"></i>
    </a>
    <a href="http://twitter.com/eiveydotca" target="_blank">
        <i class="fa fa-twitter" aria-hidden="true"></i>
    </a>
<?php } ?>
<footer>
    <!-- homepage -->
    <section id="homepage-footer">
        <div class="small-grid-container text-center">
            <h3 id="footer-tagline">Follow Us!</h3>
            <h3 class="footer-tagline-social">@eiveydotca</h3>
            <h3 class="footer-tagline-social">#eiveydotca</h3>
            <div id="footer-social-accounts">
                <?php getSocialAccounts();?>
            </div>
        </div>
        <nav>
            <div class="grid-container">
                <div class="small-12 medium-3">
                    <h4 class="footer-menu-title">Support</h4>
                    <?php wp_nav_menu(array(
                        'theme_location' => 'footer-left',
                        'menu_class' => 'standard-menu-footer'
                    )); ?>
                </div>
                <div class="small-12 medium-3">
                    <h4 class="footer-menu-title hide-for-small">&nbsp;</h4>
                    <?php wp_nav_menu(array(
                        'theme_location' => 'footer-center-left',
                        'menu_class' => 'standard-menu-footer'
                    )); ?>
                </div>
                <div class="small-12 medium-3">
                    <h4 class="footer-menu-title hide-for-small">&nbsp;</h4>
                    <?php wp_nav_menu(array(
                        'theme_location' => 'footer-center-right',
                        'menu_class' => 'standard-menu-footer'
                    )); ?>
                </div>
                <div class="small-12 medium-3 grid-end">
                    <h4 class="footer-menu-title">Company</h4>
                    <?php wp_nav_menu(array(
                        'theme_location' => 'footer-right',
                        'menu_class' => 'standard-menu-footer'
                    )); ?>
                </div>
            </div>
        </nav>
    </section>
    <!-- default -->
    <section id="standard-footer">
        <nav>
            <div class="grid-container">
                <div class="small-12 medium-2">
                    <h4 class="footer-menu-title">Support</h4>
                    <?php wp_nav_menu(array(
                        'theme_location' => 'footer-left',
                        'menu_class' => 'standard-menu-footer'
                    )); ?>
                </div>
                <div class="small-12 medium-2">
                    <h4 class="footer-menu-title hide-for-small">&nbsp;</h4>
                    <?php wp_nav_menu(array(
                        'theme_location' => 'footer-center-left',
                        'menu_class' => 'standard-menu-footer'
                    )); ?>
                </div>
                <div class="small-12 medium-2">
                    <h4 class="footer-menu-title hide-for-small">&nbsp;</h4>
                    <?php wp_nav_menu(array(
                        'theme_location' => 'footer-center-right',
                        'menu_class' => 'standard-menu-footer'
                    )); ?>
                </div>
                <div class="small-12 medium-2">
                    <h4 class="footer-menu-title">Company</h4>
                    <?php wp_nav_menu(array(
                        'theme_location' => 'footer-right',
                        'menu_class' => 'standard-menu-footer'
                    )); ?>
                </div>
                <div class="small-12 medium-2 grid-end">
                    <div id="footer-nav-social-accounts">
                        <?php getSocialAccounts();?>
                    </div>
                    <h3 class="footer-nav-tagline">@eiveydotca</h3>
                    <h3 class="footer-nav-tagline">#eiveydotca</h3>
                </div>
            </div>
        </nav>
    </section>
    <section id="footer-menu-container">
        <h5 id="footer-trademark">&copy; <?php echo date('Y');?> EIVEY Inc.</h5>
    </section>
</footer>
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
