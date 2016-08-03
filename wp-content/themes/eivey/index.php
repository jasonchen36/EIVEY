<?php
/**
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package eivey
 */

get_header(); ?>
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <?php if ( have_posts()) {
                if (is_home() && !is_front_page()){ ?>
                    <header>
                        <h1 class="page-title screen-reader-text"><?php single_post_title(); ?></h1>
                    </header>
                <?php }
                /* Start the Loop */
                while (have_posts()) {
                    the_post(); ?>
                    <div class="entry-content">
                        <?php the_content(); ?>
                    </div><!-- .entry-content -->
                <?php }
            } else { ?>
                <div class="entry-content">
                    No results found
                </div><!-- .entry-content -->
            <?php } ?>
        </main><!-- #main -->
    </div><!-- #primary -->
<?php
get_footer();
