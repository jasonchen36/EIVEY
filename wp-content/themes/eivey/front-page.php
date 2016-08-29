<?php get_header();
$banner_image = get_post_meta(get_the_ID(), 'wpcf-homepage-banner-image', true);
?>
    <main class="small-grid-container">
        <div class="small-12">
            <nav id="menu-homepage-container">
                <?php wp_nav_menu(array(
                    'theme_location' => 'homepage',
                    'menu_id' => 'menu-categories',
                    'menu_class' => 'standard-menu'
                )); ?>
            </nav>
            <img src="<?php echo $banner_image;?>" alt="Eivey - Designer Fashion" id="homepage-banner-image"/>
        </div>
    </main>
<?php
get_footer();