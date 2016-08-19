-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2016 at 03:46 PM
-- Server version: 5.6.30
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sharetribe_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE IF NOT EXISTS `auth_tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT 'unsubscribe',
  `person_id` varchar(255) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `usages_left` int(11) DEFAULT NULL,
  `last_use_attempt` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_tokens`
--

INSERT INTO `auth_tokens` (`id`, `token`, `token_type`, `person_id`, `expires_at`, `usages_left`, `last_use_attempt`, `created_at`, `updated_at`) VALUES
(1, 'unwLm1Mbz48', 'login', 'u_N7PVCq51QvJ_mLh7qXeA', '2016-07-27 16:21:41', 1, NULL, '2016-07-27 16:11:41', '2016-07-27 16:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `billing_agreements`
--

CREATE TABLE IF NOT EXISTS `billing_agreements` (
  `id` int(11) NOT NULL,
  `paypal_account_id` int(11) NOT NULL,
  `billing_agreement_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `paypal_username_to` varchar(255) NOT NULL,
  `request_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `start_on` date DEFAULT NULL,
  `end_on` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `braintree_accounts`
--

CREATE TABLE IF NOT EXISTS `braintree_accounts` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address_street_address` varchar(255) DEFAULT NULL,
  `address_postal_code` varchar(255) DEFAULT NULL,
  `address_locality` varchar(255) DEFAULT NULL,
  `address_region` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `routing_number` varchar(255) DEFAULT NULL,
  `hidden_account_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `braintree_accounts`
--

INSERT INTO `braintree_accounts` (`id`, `created_at`, `updated_at`, `first_name`, `last_name`, `person_id`, `email`, `phone`, `address_street_address`, `address_postal_code`, `address_locality`, `address_region`, `date_of_birth`, `routing_number`, `hidden_account_number`, `status`, `community_id`) VALUES
(1, '2016-08-03 20:11:36', '2016-08-03 20:11:36', 'mike', 'stumpf', 'u_N7PVCq51QvJ_mLh7qXeA', 'mstumpf@ellefsontech.com', '1231231234', 'main st', '53563', 'milton', 'WI', '1990-08-03', '021000021', '***********11', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `sort_priority` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `icon`, `created_at`, `updated_at`, `community_id`, `sort_priority`, `url`) VALUES
(1, NULL, NULL, '2016-07-27 16:11:41', '2016-07-27 16:11:41', 1, NULL, 'default'),
(2, NULL, NULL, '2016-08-03 20:16:45', '2016-08-03 20:16:45', 1, 1, 'tops'),
(3, NULL, NULL, '2016-08-03 20:16:50', '2016-08-03 20:16:50', 1, 2, 'bottoms');

-- --------------------------------------------------------

--
-- Table structure for table `category_custom_fields`
--

CREATE TABLE IF NOT EXISTS `category_custom_fields` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_custom_fields`
--

INSERT INTO `category_custom_fields` (`id`, `category_id`, `custom_field_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2016-07-27 17:48:23', '2016-07-27 17:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `category_listing_shapes`
--

CREATE TABLE IF NOT EXISTS `category_listing_shapes` (
  `category_id` int(11) NOT NULL,
  `listing_shape_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_listing_shapes`
--

INSERT INTO `category_listing_shapes` (`category_id`, `listing_shape_id`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE IF NOT EXISTS `category_translations` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `locale`, `name`, `created_at`, `updated_at`, `description`) VALUES
(1, 1, 'en', 'Default', '2016-07-27 16:11:41', '2016-07-27 16:11:41', NULL),
(2, 2, 'en', 'Tops', '2016-08-03 20:16:45', '2016-08-03 20:16:45', NULL),
(3, 3, 'en', 'Bottoms', '2016-08-03 20:16:50', '2016-08-03 20:16:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `checkout_accounts`
--

CREATE TABLE IF NOT EXISTS `checkout_accounts` (
  `id` int(11) NOT NULL,
  `company_id_or_personal_id` varchar(255) DEFAULT NULL,
  `merchant_id` varchar(255) NOT NULL,
  `merchant_key` varchar(255) NOT NULL,
  `person_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE IF NOT EXISTS `communities` (
  `id` int(11) NOT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `use_domain` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `settings` text,
  `consent` varchar(255) DEFAULT NULL,
  `transaction_agreement_in_use` tinyint(1) DEFAULT '0',
  `email_admins_about_new_members` tinyint(1) DEFAULT '0',
  `use_fb_like` tinyint(1) DEFAULT '0',
  `real_name_required` tinyint(1) DEFAULT '1',
  `automatic_newsletters` tinyint(1) DEFAULT '1',
  `join_with_invite_only` tinyint(1) DEFAULT '0',
  `allowed_emails` mediumtext,
  `users_can_invite_new_users` tinyint(1) DEFAULT '1',
  `private` tinyint(1) DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `show_date_in_listings_list` tinyint(1) DEFAULT '0',
  `all_users_can_add_news` tinyint(1) DEFAULT '1',
  `custom_frontpage_sidebar` tinyint(1) DEFAULT '0',
  `event_feed_enabled` tinyint(1) DEFAULT '1',
  `slogan` varchar(255) DEFAULT NULL,
  `description` text,
  `category` varchar(255) DEFAULT 'other',
  `country` varchar(255) DEFAULT NULL,
  `members_count` int(11) DEFAULT '0',
  `user_limit` int(11) DEFAULT NULL,
  `monthly_price_in_euros` float DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `cover_photo_file_name` varchar(255) DEFAULT NULL,
  `cover_photo_content_type` varchar(255) DEFAULT NULL,
  `cover_photo_file_size` int(11) DEFAULT NULL,
  `cover_photo_updated_at` datetime DEFAULT NULL,
  `small_cover_photo_file_name` varchar(255) DEFAULT NULL,
  `small_cover_photo_content_type` varchar(255) DEFAULT NULL,
  `small_cover_photo_file_size` int(11) DEFAULT NULL,
  `small_cover_photo_updated_at` datetime DEFAULT NULL,
  `custom_color1` varchar(255) DEFAULT NULL,
  `custom_color2` varchar(255) DEFAULT NULL,
  `stylesheet_url` varchar(255) DEFAULT NULL,
  `stylesheet_needs_recompile` tinyint(1) DEFAULT '0',
  `service_logo_style` varchar(255) DEFAULT 'full-logo',
  `available_currencies` text,
  `facebook_connect_enabled` tinyint(1) DEFAULT '1',
  `vat` int(11) DEFAULT NULL,
  `commission_from_seller` int(11) DEFAULT NULL,
  `minimum_price_cents` int(11) DEFAULT NULL,
  `testimonials_in_use` tinyint(1) DEFAULT '1',
  `hide_expiration_date` tinyint(1) DEFAULT '0',
  `facebook_connect_id` varchar(255) DEFAULT NULL,
  `facebook_connect_secret` varchar(255) DEFAULT NULL,
  `google_analytics_key` varchar(255) DEFAULT NULL,
  `google_maps_key` varchar(64) DEFAULT NULL,
  `name_display_type` varchar(255) DEFAULT 'first_name_with_initial',
  `twitter_handle` varchar(255) DEFAULT NULL,
  `use_community_location_as_default` tinyint(1) DEFAULT '0',
  `preproduction_stylesheet_url` varchar(255) DEFAULT NULL,
  `show_category_in_listing_list` tinyint(1) DEFAULT '0',
  `default_browse_view` varchar(255) DEFAULT 'grid',
  `wide_logo_file_name` varchar(255) DEFAULT NULL,
  `wide_logo_content_type` varchar(255) DEFAULT NULL,
  `wide_logo_file_size` int(11) DEFAULT NULL,
  `wide_logo_updated_at` datetime DEFAULT NULL,
  `only_organizations` tinyint(1) DEFAULT NULL,
  `listing_comments_in_use` tinyint(1) DEFAULT '0',
  `show_listing_publishing_date` tinyint(1) DEFAULT '0',
  `require_verification_to_post_listings` tinyint(1) DEFAULT '0',
  `show_price_filter` tinyint(1) DEFAULT '0',
  `price_filter_min` int(11) DEFAULT '0',
  `price_filter_max` int(11) DEFAULT '100000',
  `automatic_confirmation_after_days` int(11) DEFAULT '14',
  `favicon_file_name` varchar(255) DEFAULT NULL,
  `favicon_content_type` varchar(255) DEFAULT NULL,
  `favicon_file_size` int(11) DEFAULT NULL,
  `favicon_updated_at` datetime DEFAULT NULL,
  `default_min_days_between_community_updates` int(11) DEFAULT '7',
  `listing_location_required` tinyint(1) DEFAULT '0',
  `custom_head_script` text,
  `follow_in_use` tinyint(1) NOT NULL DEFAULT '1',
  `logo_processing` tinyint(1) DEFAULT NULL,
  `wide_logo_processing` tinyint(1) DEFAULT NULL,
  `cover_photo_processing` tinyint(1) DEFAULT NULL,
  `small_cover_photo_processing` tinyint(1) DEFAULT NULL,
  `favicon_processing` tinyint(1) DEFAULT NULL,
  `dv_test_file_name` varchar(64) DEFAULT NULL,
  `dv_test_file` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `ident`, `domain`, `use_domain`, `created_at`, `updated_at`, `settings`, `consent`, `transaction_agreement_in_use`, `email_admins_about_new_members`, `use_fb_like`, `real_name_required`, `automatic_newsletters`, `join_with_invite_only`, `allowed_emails`, `users_can_invite_new_users`, `private`, `label`, `show_date_in_listings_list`, `all_users_can_add_news`, `custom_frontpage_sidebar`, `event_feed_enabled`, `slogan`, `description`, `category`, `country`, `members_count`, `user_limit`, `monthly_price_in_euros`, `logo_file_name`, `logo_content_type`, `logo_file_size`, `logo_updated_at`, `cover_photo_file_name`, `cover_photo_content_type`, `cover_photo_file_size`, `cover_photo_updated_at`, `small_cover_photo_file_name`, `small_cover_photo_content_type`, `small_cover_photo_file_size`, `small_cover_photo_updated_at`, `custom_color1`, `custom_color2`, `stylesheet_url`, `stylesheet_needs_recompile`, `service_logo_style`, `available_currencies`, `facebook_connect_enabled`, `vat`, `commission_from_seller`, `minimum_price_cents`, `testimonials_in_use`, `hide_expiration_date`, `facebook_connect_id`, `facebook_connect_secret`, `google_analytics_key`, `google_maps_key`, `name_display_type`, `twitter_handle`, `use_community_location_as_default`, `preproduction_stylesheet_url`, `show_category_in_listing_list`, `default_browse_view`, `wide_logo_file_name`, `wide_logo_content_type`, `wide_logo_file_size`, `wide_logo_updated_at`, `only_organizations`, `listing_comments_in_use`, `show_listing_publishing_date`, `require_verification_to_post_listings`, `show_price_filter`, `price_filter_min`, `price_filter_max`, `automatic_confirmation_after_days`, `favicon_file_name`, `favicon_content_type`, `favicon_file_size`, `favicon_updated_at`, `default_min_days_between_community_updates`, `listing_location_required`, `custom_head_script`, `follow_in_use`, `logo_processing`, `wide_logo_processing`, `cover_photo_processing`, `small_cover_photo_processing`, `favicon_processing`, `dv_test_file_name`, `dv_test_file`, `deleted`) VALUES
(1, 'eivey', NULL, 0, '2016-07-27 16:11:41', '2016-08-03 20:08:39', '---\nlocales:\n- en\n', 'SHARETRIBE1.0', 0, 0, 0, 1, 1, 0, NULL, 1, 0, NULL, 0, 1, 0, 1, NULL, NULL, 'other', 'CA', 2, NULL, NULL, '1431368160275-P-2623750.jpg', 'image/jpeg', 30289, '2016-07-27 17:46:35', 'header.png', 'image/png', 678561, '2016-08-01 15:26:48', NULL, NULL, NULL, NULL, NULL, NULL, 'custom-style-eivey-20160801114058', 0, 'full-logo', 'CAD', 1, NULL, 5, NULL, 1, 0, NULL, NULL, NULL, NULL, 'first_name_with_initial', NULL, 0, NULL, 0, 'grid', 'header-image-12.png', 'image/png', 31888, '2016-07-27 17:46:34', NULL, 0, 0, 0, 0, 0, 100000, 14, NULL, NULL, NULL, NULL, 7, 0, '', 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `community_customizations`
--

CREATE TABLE IF NOT EXISTS `community_customizations` (
  `id` int(11) NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `blank_slate` text,
  `welcome_email_content` text,
  `how_to_use_page_content` mediumtext,
  `about_page_content` mediumtext,
  `terms_page_content` mediumtext,
  `privacy_page_content` mediumtext,
  `storefront_label` varchar(255) DEFAULT NULL,
  `signup_info_content` text,
  `private_community_homepage_content` mediumtext,
  `verification_to_post_listings_info_content` mediumtext,
  `search_placeholder` varchar(255) DEFAULT NULL,
  `transaction_agreement_label` varchar(255) DEFAULT NULL,
  `transaction_agreement_content` mediumtext
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `community_customizations`
--

INSERT INTO `community_customizations` (`id`, `community_id`, `locale`, `name`, `slogan`, `description`, `created_at`, `updated_at`, `blank_slate`, `welcome_email_content`, `how_to_use_page_content`, `about_page_content`, `terms_page_content`, `privacy_page_content`, `storefront_label`, `signup_info_content`, `private_community_homepage_content`, `verification_to_post_listings_info_content`, `search_placeholder`, `transaction_agreement_label`, `transaction_agreement_content`) VALUES
(1, 1, 'en', 'eivey', 'this is the marketplace slogan', 'this is the marketplace description', '2016-07-27 16:11:41', '2016-07-27 17:04:05', NULL, NULL, '<h1>How it works</h1><div>Here you can find information about how eivey works.</div>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `community_memberships`
--

CREATE TABLE IF NOT EXISTS `community_memberships` (
  `id` int(11) NOT NULL,
  `person_id` varchar(255) NOT NULL,
  `community_id` int(11) NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `consent` varchar(255) DEFAULT NULL,
  `invitation_id` int(11) DEFAULT NULL,
  `last_page_load_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'accepted',
  `can_post_listings` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `community_memberships`
--

INSERT INTO `community_memberships` (`id`, `person_id`, `community_id`, `admin`, `created_at`, `updated_at`, `consent`, `invitation_id`, `last_page_load_date`, `status`, `can_post_listings`) VALUES
(1, 'u_N7PVCq51QvJ_mLh7qXeA', 1, 1, '2016-07-27 16:11:41', '2016-08-01 12:36:58', 'SHARETRIBE1.0', NULL, '2016-08-01 12:36:58', 'accepted', 0),
(2, 'hqtFg4Sqxp3EDSoRObD75Q', 1, 0, '2016-08-03 20:10:09', '2016-08-03 20:10:09', 'SHARETRIBE1.0', NULL, '2016-08-03 20:10:09', 'accepted', 0);

-- --------------------------------------------------------

--
-- Table structure for table `community_translations`
--

CREATE TABLE IF NOT EXISTS `community_translations` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `locale` varchar(16) NOT NULL,
  `translation_key` varchar(255) NOT NULL,
  `translation` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `community_translations`
--

INSERT INTO `community_translations` (`id`, `community_id`, `locale`, `translation_key`, `translation`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '032628f5-cc49-4227-affe-5bea2cf94f98', 'Selling', '2016-07-27 16:11:41', '2016-07-27 16:11:41'),
(2, 1, 'en', '9ce963a9-0ba1-45eb-8b98-4f56dd19125d', 'Buy', '2016-07-27 16:11:41', '2016-07-27 16:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `contact_requests`
--

CREATE TABLE IF NOT EXISTS `contact_requests` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `plan_type` varchar(255) DEFAULT NULL,
  `marketplace_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_message_at` datetime DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort_priority` int(11) DEFAULT NULL,
  `search_filter` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '1',
  `min` float DEFAULT NULL,
  `max` float DEFAULT NULL,
  `allow_decimals` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `type`, `sort_priority`, `search_filter`, `created_at`, `updated_at`, `community_id`, `required`, `min`, `max`, `allow_decimals`) VALUES
(1, 'CheckboxField', NULL, 1, '2016-07-27 17:41:05', '2016-07-27 17:41:05', 1, 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_names`
--

CREATE TABLE IF NOT EXISTS `custom_field_names` (
  `id` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `custom_field_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_field_names`
--

INSERT INTO `custom_field_names` (`id`, `value`, `locale`, `custom_field_id`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'en', '1', '2016-07-27 17:41:05', '2016-07-27 17:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_options`
--

CREATE TABLE IF NOT EXISTS `custom_field_options` (
  `id` int(11) NOT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `sort_priority` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_field_options`
--

INSERT INTO `custom_field_options` (`id`, `custom_field_id`, `sort_priority`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2016-07-27 17:41:05', '2016-07-27 17:41:05'),
(2, 1, 2, '2016-07-27 17:41:05', '2016-07-27 17:41:05'),
(3, 1, 3, '2016-07-27 17:41:05', '2016-07-27 17:41:05'),
(4, 1, 4, '2016-07-27 17:41:05', '2016-07-27 17:41:05'),
(5, 1, 5, '2016-07-27 17:48:23', '2016-07-27 17:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_option_selections`
--

CREATE TABLE IF NOT EXISTS `custom_field_option_selections` (
  `id` int(11) NOT NULL,
  `custom_field_value_id` int(11) DEFAULT NULL,
  `custom_field_option_id` int(11) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_option_titles`
--

CREATE TABLE IF NOT EXISTS `custom_field_option_titles` (
  `id` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `custom_field_option_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_field_option_titles`
--

INSERT INTO `custom_field_option_titles` (`id`, `value`, `locale`, `custom_field_option_id`, `created_at`, `updated_at`) VALUES
(1, 'white', 'en', 1, '2016-07-27 17:41:05', '2016-07-27 17:41:05'),
(2, 'black', 'en', 2, '2016-07-27 17:41:05', '2016-07-27 17:41:05'),
(3, 'red', 'en', 3, '2016-07-27 17:41:05', '2016-07-27 17:41:05'),
(4, 'blue', 'en', 4, '2016-07-27 17:41:05', '2016-07-27 17:41:05'),
(5, 'yellow', 'en', 5, '2016-07-27 17:48:23', '2016-07-27 17:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE IF NOT EXISTS `custom_field_values` (
  `id` int(11) NOT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `text_value` text,
  `numeric_value` float DEFAULT NULL,
  `date_value` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `delta` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delayed_jobs`
--

CREATE TABLE IF NOT EXISTS `delayed_jobs` (
  `id` int(11) NOT NULL,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` text,
  `last_error` text,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delayed_jobs`
--

INSERT INTO `delayed_jobs` (`id`, `priority`, `attempts`, `handler`, `last_error`, `run_at`, `locked_at`, `failed_at`, `locked_by`, `created_at`, `updated_at`, `queue`) VALUES
(9, 4, 3, '--- !ruby/object:ThinkingSphinx::Deltas::DelayedDelta::FlagAsDeletedJob\nindex: listing_core\ndocument_id: 7\n', 'index listing_core: index not available - UPDATE listing_core SET sphinx_deleted = 1 WHERE id = 7\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:93:in `rescue in query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:96:in `query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:73:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:8:in `block in perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:39:in `block in take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/innertube-1.1.0/lib/innertube.rb:138:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:37:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:7:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/bundler/gems/ts-delayed-delta-839284f2f28b/lib/thinking_sphinx/deltas/delayed_delta/flag_as_deleted_job.rb:27:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:100:in `block in invoke_job''\n/Users/mstumpf/Work/dev.eivey.com/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:97:in `invoke_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block (2 levels) in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:101:in `timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:223:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `block in reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:207:in `block in work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `times''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:169:in `block (4 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:168:in `block (3 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:167:in `block (2 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `loop''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `block in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:165:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `kernel_load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:24:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:304:in `exec''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/command.rb:27:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/invocation.rb:126:in `invoke_command''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor.rb:359:in `dispatch''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/base.rb:440:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:11:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:27:in `block in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/friendly_errors.rb:98:in `with_friendly_errors''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:19:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `<main>''', '2016-07-27 17:47:02', NULL, '2016-07-27 17:47:04', NULL, '2016-07-27 17:39:39', '2016-07-27 17:47:04', 'default'),
(14, 4, 3, '--- !ruby/object:ThinkingSphinx::Deltas::DelayedDelta::FlagAsDeletedJob\nindex: listing_core\ndocument_id: 7\n', 'index listing_core: index not available - UPDATE listing_core SET sphinx_deleted = 1 WHERE id = 7\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:93:in `rescue in query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:96:in `query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:73:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:8:in `block in perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:39:in `block in take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/innertube-1.1.0/lib/innertube.rb:138:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:37:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:7:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/bundler/gems/ts-delayed-delta-839284f2f28b/lib/thinking_sphinx/deltas/delayed_delta/flag_as_deleted_job.rb:27:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:100:in `block in invoke_job''\n/Users/mstumpf/Work/dev.eivey.com/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:97:in `invoke_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block (2 levels) in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:101:in `timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:223:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `block in reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:207:in `block in work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `times''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:169:in `block (4 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:168:in `block (3 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:167:in `block (2 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `loop''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `block in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:165:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `kernel_load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:24:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:304:in `exec''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/command.rb:27:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/invocation.rb:126:in `invoke_command''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor.rb:359:in `dispatch''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/base.rb:440:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:11:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:27:in `block in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/friendly_errors.rb:98:in `with_friendly_errors''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:19:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `<main>''', '2016-07-27 17:47:02', NULL, '2016-07-27 17:47:04', NULL, '2016-07-27 17:44:12', '2016-07-27 17:47:04', 'default'),
(15, 4, 3, '--- !ruby/object:ThinkingSphinx::Deltas::DelayedDelta::FlagAsDeletedJob\nindex: listing_core\ndocument_id: 7\n', 'index listing_core: index not available - UPDATE listing_core SET sphinx_deleted = 1 WHERE id = 7\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:93:in `rescue in query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:96:in `query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:73:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:8:in `block in perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:39:in `block in take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/innertube-1.1.0/lib/innertube.rb:138:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:37:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:7:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/bundler/gems/ts-delayed-delta-839284f2f28b/lib/thinking_sphinx/deltas/delayed_delta/flag_as_deleted_job.rb:27:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:100:in `block in invoke_job''\n/Users/mstumpf/Work/dev.eivey.com/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:97:in `invoke_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block (2 levels) in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:101:in `timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:223:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `block in reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:207:in `block in work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `times''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:169:in `block (4 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:168:in `block (3 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:167:in `block (2 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `loop''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `block in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:165:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `kernel_load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:24:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:304:in `exec''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/command.rb:27:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/invocation.rb:126:in `invoke_command''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor.rb:359:in `dispatch''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/base.rb:440:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:11:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:27:in `block in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/friendly_errors.rb:98:in `with_friendly_errors''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:19:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `<main>''', '2016-07-27 17:47:02', NULL, '2016-07-27 17:47:04', NULL, '2016-07-27 17:44:12', '2016-07-27 17:47:04', 'default'),
(17, 4, 3, '--- !ruby/object:ThinkingSphinx::Deltas::DelayedDelta::FlagAsDeletedJob\nindex: custom_field_value_core\ndocument_id: 6\n', 'index custom_field_value_core: index not available - UPDATE custom_field_value_core SET sphinx_deleted = 1 WHERE id = 6\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:93:in `rescue in query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:96:in `query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:73:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:8:in `block in perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:39:in `block in take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/innertube-1.1.0/lib/innertube.rb:138:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:37:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:7:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/bundler/gems/ts-delayed-delta-839284f2f28b/lib/thinking_sphinx/deltas/delayed_delta/flag_as_deleted_job.rb:27:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:100:in `block in invoke_job''\n/Users/mstumpf/Work/dev.eivey.com/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:97:in `invoke_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block (2 levels) in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:101:in `timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:223:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `block in reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:207:in `block in work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `times''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:169:in `block (4 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:168:in `block (3 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:167:in `block (2 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `loop''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `block in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:165:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `kernel_load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:24:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:304:in `exec''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/command.rb:27:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/invocation.rb:126:in `invoke_command''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor.rb:359:in `dispatch''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/base.rb:440:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:11:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:27:in `block in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/friendly_errors.rb:98:in `with_friendly_errors''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:19:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `<main>''', '2016-07-27 17:47:02', NULL, '2016-07-27 17:47:04', NULL, '2016-07-27 17:44:12', '2016-07-27 17:47:04', 'default');
INSERT INTO `delayed_jobs` (`id`, `priority`, `attempts`, `handler`, `last_error`, `run_at`, `locked_at`, `failed_at`, `locked_by`, `created_at`, `updated_at`, `queue`) VALUES
(23, 4, 3, '--- !ruby/object:ThinkingSphinx::Deltas::DelayedDelta::FlagAsDeletedJob\nindex: listing_core\ndocument_id: 7\n', 'index listing_core: index not available - UPDATE listing_core SET sphinx_deleted = 1 WHERE id = 7\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:93:in `rescue in query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:96:in `query''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:73:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:8:in `block in perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:39:in `block in take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/innertube-1.1.0/lib/innertube.rb:138:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/connection.rb:37:in `take''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/thinking-sphinx-3.1.4/lib/thinking_sphinx/deltas/delete_job.rb:7:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/bundler/gems/ts-delayed-delta-839284f2f28b/lib/thinking_sphinx/deltas/delayed_delta/flag_as_deleted_job.rb:27:in `perform''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:100:in `block in invoke_job''\n/Users/mstumpf/Work/dev.eivey.com/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/backend/base.rb:97:in `invoke_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block (2 levels) in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/timeout.rb:101:in `timeout''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:224:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:223:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `block in reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:300:in `reserve_and_run_one_job''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:207:in `block in work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `times''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:206:in `work_off''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:169:in `block (4 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/benchmark.rb:308:in `realtime''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:168:in `block (3 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:167:in `block (2 levels) in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `loop''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:166:in `block in start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:61:in `block in initialize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:79:in `block in add''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:66:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/lifecycle.rb:40:in `run_callbacks''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/worker.rb:165:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/delayed_job-4.1.1/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/rake:23:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:63:in `kernel_load''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli/exec.rb:24:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:304:in `exec''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/command.rb:27:in `run''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/invocation.rb:126:in `invoke_command''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor.rb:359:in `dispatch''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/vendor/thor/lib/thor/base.rb:440:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/cli.rb:11:in `start''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:27:in `block in <top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/friendly_errors.rb:98:in `with_friendly_errors''\n/Users/mstumpf/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/exe/bundle:19:in `<top (required)>''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `load''\n/Users/mstumpf/.rbenv/versions/2.3.1/bin/bundle:23:in `<main>''', '2016-07-27 17:47:02', NULL, '2016-07-27 17:47:04', NULL, '2016-07-27 17:46:35', '2016-07-27 17:47:04', 'default'),
(37, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-02 14:21:57', NULL, NULL, NULL, '2016-08-02 14:21:57', '2016-08-02 14:21:57', 'default'),
(38, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-02 14:21:58', NULL, NULL, NULL, '2016-08-02 14:21:58', '2016-08-02 14:21:58', 'default'),
(39, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-02 14:22:03', NULL, NULL, NULL, '2016-08-02 14:22:03', '2016-08-02 14:22:03', 'default'),
(40, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-02 14:22:05', NULL, NULL, NULL, '2016-08-02 14:22:05', '2016-08-02 14:22:05', 'default'),
(41, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-02 14:22:08', NULL, NULL, NULL, '2016-08-02 14:22:08', '2016-08-02 14:22:08', 'default'),
(42, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-02 14:22:11', NULL, NULL, NULL, '2016-08-02 14:22:11', '2016-08-02 14:22:11', 'default'),
(43, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:06:11', NULL, NULL, NULL, '2016-08-03 20:06:11', '2016-08-03 20:06:11', 'default'),
(44, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:07:09', NULL, NULL, NULL, '2016-08-03 20:07:09', '2016-08-03 20:07:09', 'default'),
(45, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:07:21', NULL, NULL, NULL, '2016-08-03 20:07:21', '2016-08-03 20:07:21', 'default'),
(46, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:07:28', NULL, NULL, NULL, '2016-08-03 20:07:28', '2016-08-03 20:07:28', 'default'),
(47, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:07:40', NULL, NULL, NULL, '2016-08-03 20:07:40', '2016-08-03 20:07:40', 'default'),
(48, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:08:06', NULL, NULL, NULL, '2016-08-03 20:08:06', '2016-08-03 20:08:06', 'default'),
(49, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:08:08', NULL, NULL, NULL, '2016-08-03 20:08:08', '2016-08-03 20:08:08', 'default'),
(50, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:08:39', NULL, NULL, NULL, '2016-08-03 20:08:39', '2016-08-03 20:08:39', 'default'),
(51, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:08:39', NULL, NULL, NULL, '2016-08-03 20:08:39', '2016-08-03 20:08:39', 'default'),
(52, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:08:51', NULL, NULL, NULL, '2016-08-03 20:08:51', '2016-08-03 20:08:51', 'default'),
(53, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:08:53', NULL, NULL, NULL, '2016-08-03 20:08:53', '2016-08-03 20:08:53', 'default'),
(54, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:08:53', NULL, NULL, NULL, '2016-08-03 20:08:53', '2016-08-03 20:08:53', 'default'),
(55, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:09:05', NULL, NULL, NULL, '2016-08-03 20:09:05', '2016-08-03 20:09:05', 'default'),
(56, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:09:34', NULL, NULL, NULL, '2016-08-03 20:09:34', '2016-08-03 20:09:34', 'default'),
(57, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:09:35', NULL, NULL, NULL, '2016-08-03 20:09:35', '2016-08-03 20:09:35', 'default'),
(58, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:09:43', NULL, NULL, NULL, '2016-08-03 20:09:43', '2016-08-03 20:09:43', 'default'),
(59, 5, 0, '--- !ruby/struct:CommunityJoinedJob\nperson_id: hqtFg4Sqxp3EDSoRObD75Q\ncommunity_id: 1\n', NULL, '2016-08-03 20:10:09', NULL, NULL, NULL, '2016-08-03 20:10:09', '2016-08-03 20:10:09', 'default'),
(60, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:10:28', NULL, NULL, NULL, '2016-08-03 20:10:28', '2016-08-03 20:10:28', 'default'),
(61, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:10:33', NULL, NULL, NULL, '2016-08-03 20:10:33', '2016-08-03 20:10:33', 'default'),
(62, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:10:35', NULL, NULL, NULL, '2016-08-03 20:10:35', '2016-08-03 20:10:35', 'default'),
(63, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:10:35', NULL, NULL, NULL, '2016-08-03 20:10:35', '2016-08-03 20:10:35', 'default'),
(64, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:11:36', NULL, NULL, NULL, '2016-08-03 20:11:36', '2016-08-03 20:11:36', 'default'),
(65, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:15:31', NULL, NULL, NULL, '2016-08-03 20:15:31', '2016-08-03 20:15:31', 'default'),
(66, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:15:38', NULL, NULL, NULL, '2016-08-03 20:15:38', '2016-08-03 20:15:38', 'default'),
(67, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:34', NULL, NULL, NULL, '2016-08-03 20:16:34', '2016-08-03 20:16:34', 'default'),
(68, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:39', NULL, NULL, NULL, '2016-08-03 20:16:39', '2016-08-03 20:16:39', 'default'),
(69, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:41', NULL, NULL, NULL, '2016-08-03 20:16:41', '2016-08-03 20:16:41', 'default'),
(70, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:42', NULL, NULL, NULL, '2016-08-03 20:16:42', '2016-08-03 20:16:42', 'default'),
(71, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:45', NULL, NULL, NULL, '2016-08-03 20:16:45', '2016-08-03 20:16:45', 'default'),
(72, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:45', NULL, NULL, NULL, '2016-08-03 20:16:45', '2016-08-03 20:16:45', 'default'),
(73, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:47', NULL, NULL, NULL, '2016-08-03 20:16:47', '2016-08-03 20:16:47', 'default'),
(74, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:50', NULL, NULL, NULL, '2016-08-03 20:16:50', '2016-08-03 20:16:50', 'default'),
(75, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:50', NULL, NULL, NULL, '2016-08-03 20:16:50', '2016-08-03 20:16:50', 'default'),
(76, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:55', NULL, NULL, NULL, '2016-08-03 20:16:55', '2016-08-03 20:16:55', 'default'),
(77, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:57', NULL, NULL, NULL, '2016-08-03 20:16:57', '2016-08-03 20:16:57', 'default'),
(78, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:16:59', NULL, NULL, NULL, '2016-08-03 20:16:59', '2016-08-03 20:16:59', 'default'),
(79, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:17:05', NULL, NULL, NULL, '2016-08-03 20:17:05', '2016-08-03 20:17:05', 'default'),
(80, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:17:11', NULL, NULL, NULL, '2016-08-03 20:17:11', '2016-08-03 20:17:11', 'default'),
(81, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:17:13', NULL, NULL, NULL, '2016-08-03 20:17:13', '2016-08-03 20:17:13', 'default'),
(82, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:17:15', NULL, NULL, NULL, '2016-08-03 20:17:15', '2016-08-03 20:17:15', 'default'),
(83, 4, 0, '--- !ruby/object:ThinkingSphinx::Deltas::DelayedDelta::DeltaJob\nindex: listing_delta\n', NULL, '2016-08-03 20:17:15', NULL, NULL, NULL, '2016-08-03 20:17:15', '2016-08-03 20:17:15', 'default'),
(84, 4, 0, '--- !ruby/object:ThinkingSphinx::Deltas::DelayedDelta::FlagAsDeletedJob\nindex: listing_core\ndocument_id: 7\n', NULL, '2016-08-03 20:17:15', NULL, NULL, NULL, '2016-08-03 20:17:15', '2016-08-03 20:17:15', 'default'),
(85, 4, 0, '--- !ruby/object:ThinkingSphinx::Deltas::DelayedDelta::FlagAsDeletedJob\nindex: listing_core\ndocument_id: 7\n', NULL, '2016-08-03 20:17:15', NULL, NULL, NULL, '2016-08-03 20:17:15', '2016-08-03 20:17:15', 'default'),
(86, 5, 0, '--- !ruby/struct:ListingUpdatedJob\nlisting_id: 1\ncommunity_id: 1\n', NULL, '2016-08-03 20:17:15', NULL, NULL, NULL, '2016-08-03 20:17:15', '2016-08-03 20:17:15', 'default'),
(87, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:17:15', NULL, NULL, NULL, '2016-08-03 20:17:15', '2016-08-03 20:17:15', 'default'),
(88, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:17:21', NULL, NULL, NULL, '2016-08-03 20:17:21', '2016-08-03 20:17:21', 'default'),
(89, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-03 20:17:24', NULL, NULL, NULL, '2016-08-03 20:17:24', '2016-08-03 20:17:24', 'default'),
(90, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-04 21:18:51', NULL, NULL, NULL, '2016-08-04 21:18:51', '2016-08-04 21:18:51', 'default'),
(91, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-04 21:19:06', NULL, NULL, NULL, '2016-08-04 21:19:06', '2016-08-04 21:19:06', 'default'),
(92, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-04 21:19:37', NULL, NULL, NULL, '2016-08-04 21:19:37', '2016-08-04 21:19:37', 'default'),
(93, 5, 0, '--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 1\nhost: dev.eivey.com\n', NULL, '2016-08-04 21:20:18', NULL, NULL, NULL, '2016-08-04 21:20:18', '2016-08-04 21:20:18', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(11) NOT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `community_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `send_notifications` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `person_id`, `community_id`, `address`, `confirmed_at`, `confirmation_sent_at`, `confirmation_token`, `created_at`, `updated_at`, `send_notifications`) VALUES
(1, 'u_N7PVCq51QvJ_mLh7qXeA', 1, 'mstumpf@ellefsontech.com', '2016-07-27 16:11:41', NULL, '5FRN2cEJVyYZ0oYa', '2016-07-27 16:11:41', '2016-07-27 16:11:41', 1),
(2, 'hqtFg4Sqxp3EDSoRObD75Q', 1, 'mstumpf@aprilage.com', '2016-08-03 20:10:09', NULL, 'spSA4fkMmuA/X+Gj', '2016-08-03 20:10:09', '2016-08-03 20:10:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favors`
--

CREATE TABLE IF NOT EXISTS `favors` (
  `id` int(11) NOT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `payment` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT 'enabled'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feature_flags`
--

CREATE TABLE IF NOT EXISTS `feature_flags` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `feature` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE IF NOT EXISTS `feedbacks` (
  `id` int(11) NOT NULL,
  `content` text,
  `author_id` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_handled` int(11) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `id` int(11) NOT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `keywords` text,
  `category` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `follower_relationships`
--

CREATE TABLE IF NOT EXISTS `follower_relationships` (
  `id` int(11) NOT NULL,
  `person_id` varchar(255) NOT NULL,
  `follower_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE IF NOT EXISTS `invitations` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `usages_left` int(11) DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `information` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `inviter_id` varchar(255) DEFAULT NULL,
  `message` text,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`id`, `code`, `community_id`, `usages_left`, `valid_until`, `information`, `created_at`, `updated_at`, `inviter_id`, `message`, `email`) VALUES
(1, 'IWPLQO', 1, 1, NULL, NULL, '2016-07-27 17:41:17', '2016-07-27 17:41:17', 'u_N7PVCq51QvJ_mLh7qXeA', '', 'mstumpf@ellefsontech.com');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'enabled'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kassi_events`
--

CREATE TABLE IF NOT EXISTS `kassi_events` (
  `id` int(11) NOT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `realizer_id` varchar(255) DEFAULT NULL,
  `eventable_id` int(11) DEFAULT NULL,
  `eventable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kassi_events_people`
--

CREATE TABLE IF NOT EXISTS `kassi_events_people` (
  `person_id` varchar(255) DEFAULT NULL,
  `kassi_event_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `landing_pages`
--

CREATE TABLE IF NOT EXISTS `landing_pages` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `released_version` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_versions`
--

CREATE TABLE IF NOT EXISTS `landing_page_versions` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `released` datetime DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE IF NOT EXISTS `listings` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `category_old` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `times_viewed` int(11) DEFAULT '0',
  `language` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updates_email_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `sort_date` datetime DEFAULT NULL,
  `listing_type_old` varchar(255) DEFAULT NULL,
  `description` text,
  `origin` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `delta` tinyint(1) NOT NULL DEFAULT '1',
  `open` tinyint(1) DEFAULT '1',
  `share_type_old` varchar(255) DEFAULT NULL,
  `privacy` varchar(255) DEFAULT 'private',
  `comments_count` int(11) DEFAULT '0',
  `subcategory_old` varchar(255) DEFAULT NULL,
  `old_category_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `share_type_id` int(11) DEFAULT NULL,
  `listing_shape_id` int(11) DEFAULT NULL,
  `transaction_process_id` int(11) DEFAULT NULL,
  `shape_name_tr_key` varchar(255) DEFAULT NULL,
  `action_button_tr_key` varchar(255) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `price_cents` int(11) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `unit_type` varchar(32) DEFAULT NULL,
  `quantity_selector` varchar(32) DEFAULT NULL,
  `unit_tr_key` varchar(64) DEFAULT NULL,
  `unit_selector_tr_key` varchar(64) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `require_shipping_address` tinyint(1) DEFAULT '0',
  `pickup_enabled` tinyint(1) DEFAULT '0',
  `shipping_price_cents` int(11) DEFAULT NULL,
  `shipping_price_additional_cents` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `community_id`, `author_id`, `category_old`, `title`, `times_viewed`, `language`, `created_at`, `updates_email_at`, `updated_at`, `last_modified`, `sort_date`, `listing_type_old`, `description`, `origin`, `destination`, `valid_until`, `delta`, `open`, `share_type_old`, `privacy`, `comments_count`, `subcategory_old`, `old_category_id`, `category_id`, `share_type_id`, `listing_shape_id`, `transaction_process_id`, `shape_name_tr_key`, `action_button_tr_key`, `organization_id`, `price_cents`, `currency`, `quantity`, `unit_type`, `quantity_selector`, `unit_tr_key`, `unit_selector_tr_key`, `deleted`, `require_shipping_address`, `pickup_enabled`, `shipping_price_cents`, `shipping_price_additional_cents`) VALUES
(1, 1, 'u_N7PVCq51QvJ_mLh7qXeA', NULL, 'sample listing', 0, NULL, '2016-07-27 17:39:39', '2016-07-27 17:39:39', '2016-08-03 20:17:15', '2016-08-03 20:17:15', '2016-07-27 17:39:39', NULL, 'product description', '', NULL, '2016-12-27 23:59:59', 1, 1, NULL, 'private', 0, NULL, NULL, 2, NULL, 1, 1, '032628f5-cc49-4227-affe-5bea2cf94f98', '9ce963a9-0ba1-45eb-8b98-4f56dd19125d', NULL, 19900, 'CAD', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 2100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `listing_comments`
--

CREATE TABLE IF NOT EXISTS `listing_comments` (
  `id` int(11) NOT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_read` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `listing_followers`
--

CREATE TABLE IF NOT EXISTS `listing_followers` (
  `person_id` varchar(255) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `listing_images`
--

CREATE TABLE IF NOT EXISTS `listing_images` (
  `id` int(11) NOT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `image_processing` tinyint(1) DEFAULT NULL,
  `image_downloaded` tinyint(1) DEFAULT '0',
  `error` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `author_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listing_images`
--

INSERT INTO `listing_images` (`id`, `listing_id`, `created_at`, `updated_at`, `image_file_name`, `image_content_type`, `image_file_size`, `image_updated_at`, `image_processing`, `image_downloaded`, `error`, `width`, `height`, `author_id`) VALUES
(2, 1, '2016-08-01 15:23:11', '2016-08-01 15:23:16', 'P18132079.jpg', 'image/jpeg', 15336, '2016-08-01 15:23:16', 0, 1, NULL, 320, 320, 'u_N7PVCq51QvJ_mLh7qXeA');

-- --------------------------------------------------------

--
-- Table structure for table `listing_shapes`
--

CREATE TABLE IF NOT EXISTS `listing_shapes` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `transaction_process_id` int(11) NOT NULL,
  `price_enabled` tinyint(1) NOT NULL,
  `shipping_enabled` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_tr_key` varchar(255) NOT NULL,
  `action_button_tr_key` varchar(255) NOT NULL,
  `sort_priority` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listing_shapes`
--

INSERT INTO `listing_shapes` (`id`, `community_id`, `transaction_process_id`, `price_enabled`, `shipping_enabled`, `name`, `name_tr_key`, `action_button_tr_key`, `sort_priority`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 1, 1, 1, 1, 'selling', '032628f5-cc49-4227-affe-5bea2cf94f98', '9ce963a9-0ba1-45eb-8b98-4f56dd19125d', 0, '2016-07-27 16:11:41', '2016-07-27 16:11:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `listing_units`
--

CREATE TABLE IF NOT EXISTS `listing_units` (
  `id` int(11) NOT NULL,
  `unit_type` varchar(32) NOT NULL,
  `quantity_selector` varchar(32) NOT NULL,
  `kind` varchar(32) NOT NULL,
  `name_tr_key` varchar(64) DEFAULT NULL,
  `selector_tr_key` varchar(64) DEFAULT NULL,
  `listing_shape_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `google_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_configurations`
--

CREATE TABLE IF NOT EXISTS `marketplace_configurations` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `main_search` varchar(255) NOT NULL DEFAULT 'keyword',
  `distance_unit` varchar(255) NOT NULL DEFAULT 'metric',
  `limit_priority_links` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `limit_search_distance` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marketplace_configurations`
--

INSERT INTO `marketplace_configurations` (`id`, `community_id`, `main_search`, `distance_unit`, `limit_priority_links`, `created_at`, `updated_at`, `limit_search_distance`) VALUES
(1, 1, 'keyword', 'metric', NULL, '2016-07-27 16:11:41', '2016-07-27 16:11:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_plans`
--

CREATE TABLE IF NOT EXISTS `marketplace_plans` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `status` varchar(22) DEFAULT NULL,
  `features` text,
  `member_limit` int(11) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_sender_emails`
--

CREATE TABLE IF NOT EXISTS `marketplace_sender_emails` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `verification_status` varchar(32) NOT NULL,
  `verification_requested_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_setup_steps`
--

CREATE TABLE IF NOT EXISTS `marketplace_setup_steps` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `slogan_and_description` tinyint(1) NOT NULL DEFAULT '0',
  `cover_photo` tinyint(1) NOT NULL DEFAULT '0',
  `filter` tinyint(1) NOT NULL DEFAULT '0',
  `paypal` tinyint(1) NOT NULL DEFAULT '0',
  `listing` tinyint(1) NOT NULL DEFAULT '0',
  `invitation` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marketplace_setup_steps`
--

INSERT INTO `marketplace_setup_steps` (`id`, `community_id`, `slogan_and_description`, `cover_photo`, `filter`, `paypal`, `listing`, `invitation`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `marketplace_trials`
--

CREATE TABLE IF NOT EXISTS `marketplace_trials` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE IF NOT EXISTS `menu_links` (
  `id` int(11) NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sort_priority` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_link_translations`
--

CREATE TABLE IF NOT EXISTS `menu_link_translations` (
  `id` int(11) NOT NULL,
  `menu_link_id` int(11) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mercury_images`
--

CREATE TABLE IF NOT EXISTS `mercury_images` (
  `id` int(11) NOT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `sender_id` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_permissions`
--

CREATE TABLE IF NOT EXISTS `order_permissions` (
  `id` int(11) NOT NULL,
  `paypal_account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `request_token` varchar(255) DEFAULT NULL,
  `paypal_username_to` varchar(255) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `onboarding_id` varchar(36) DEFAULT NULL,
  `permissions_granted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `participations`
--

CREATE TABLE IF NOT EXISTS `participations` (
  `id` int(11) NOT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `is_starter` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_sent_at` datetime DEFAULT NULL,
  `last_received_at` datetime DEFAULT NULL,
  `feedback_skipped` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL,
  `payer_id` varchar(255) DEFAULT NULL,
  `recipient_id` varchar(255) DEFAULT NULL,
  `organization_id` varchar(255) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `payment_gateway_id` int(11) DEFAULT NULL,
  `sum_cents` int(11) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'CheckoutPayment',
  `braintree_transaction_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE IF NOT EXISTS `payment_gateways` (
  `id` int(11) NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `braintree_environment` varchar(255) DEFAULT NULL,
  `braintree_merchant_id` varchar(255) DEFAULT NULL,
  `braintree_master_merchant_id` varchar(255) DEFAULT NULL,
  `braintree_public_key` varchar(255) DEFAULT NULL,
  `braintree_private_key` varchar(255) DEFAULT NULL,
  `braintree_client_side_encryption_key` text,
  `checkout_environment` varchar(255) DEFAULT NULL,
  `checkout_user_id` varchar(255) DEFAULT NULL,
  `checkout_password` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `community_id`, `type`, `braintree_environment`, `braintree_merchant_id`, `braintree_master_merchant_id`, `braintree_public_key`, `braintree_private_key`, `braintree_client_side_encryption_key`, `checkout_environment`, `checkout_user_id`, `checkout_password`, `created_at`, `updated_at`) VALUES
(1, 1, 'BraintreePaymentGateway', 'sandbox', 'vnv7vxmx3qnw6x87', 'bm9njtkjxd4sf94t', 'fccdwww2q8xn962d', 'c08f04681cf51eda4d97e3b6fbbc67f5', 'MIIBCgKCAQEA5hJ5uTUG4OIezxtqEq1IuJqBA8YtO7uzsM4Q8ZfkfLkhKQVB7Cmhrtu/NFHz1EXkbzDMA5MU2FjEuivndb++IVOdZjEqR9R+jB0vuwfKB10tjjoCoTodnC28jVQtjDOH4c6R5nydqlPse/03OVGWCiM1IsAxgpUlk/XK7RFM7mNrgfZqalwlXEmqGS0B5cQXKZisT02YoKdDE53MiodINYZBDsbA5pLlhZhvem3g7QXkRv0KKh1+U52mFafYRRm0ttZ5Hu+H0X/FHsk0Mqtv9ncC2W0jExKsQl0cRWEhPFf2SWRczp2Iyrit8o2PcET/wPomC67YGrYbBuiHVQ0e+wIDAQABl', NULL, NULL, NULL, '2016-08-03 20:08:39', '2016-08-03 20:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `payment_rows`
--

CREATE TABLE IF NOT EXISTS `payment_rows` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `sum_cents` int(11) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE IF NOT EXISTS `payment_settings` (
  `id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `community_id` int(11) NOT NULL,
  `payment_gateway` varchar(64) DEFAULT NULL,
  `payment_process` varchar(64) DEFAULT NULL,
  `commission_from_seller` int(11) DEFAULT NULL,
  `minimum_price_cents` int(11) DEFAULT NULL,
  `minimum_transaction_fee_cents` int(11) DEFAULT NULL,
  `confirmation_after_days` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_accounts`
--

CREATE TABLE IF NOT EXISTS `paypal_accounts` (
  `id` int(11) NOT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `payer_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn_messages`
--

CREATE TABLE IF NOT EXISTS `paypal_ipn_messages` (
  `id` int(11) NOT NULL,
  `body` text,
  `status` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payments`
--

CREATE TABLE IF NOT EXISTS `paypal_payments` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `payer_id` varchar(64) NOT NULL,
  `receiver_id` varchar(64) NOT NULL,
  `merchant_id` varchar(255) NOT NULL,
  `order_id` varchar(64) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `currency` varchar(8) NOT NULL,
  `order_total_cents` int(11) DEFAULT NULL,
  `authorization_id` varchar(64) DEFAULT NULL,
  `authorization_date` datetime DEFAULT NULL,
  `authorization_expires_date` datetime DEFAULT NULL,
  `authorization_total_cents` int(11) DEFAULT NULL,
  `payment_id` varchar(64) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_total_cents` int(11) DEFAULT NULL,
  `fee_total_cents` int(11) DEFAULT NULL,
  `payment_status` varchar(64) NOT NULL,
  `pending_reason` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `commission_payment_id` varchar(64) DEFAULT NULL,
  `commission_payment_date` datetime DEFAULT NULL,
  `commission_status` varchar(64) NOT NULL DEFAULT 'not_charged',
  `commission_pending_reason` varchar(64) DEFAULT NULL,
  `commission_total_cents` int(11) DEFAULT NULL,
  `commission_fee_total_cents` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_process_tokens`
--

CREATE TABLE IF NOT EXISTS `paypal_process_tokens` (
  `id` int(11) NOT NULL,
  `process_token` varchar(64) NOT NULL,
  `community_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `op_completed` tinyint(1) NOT NULL DEFAULT '0',
  `op_name` varchar(64) NOT NULL,
  `op_input` text,
  `op_output` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_refunds`
--

CREATE TABLE IF NOT EXISTS `paypal_refunds` (
  `id` int(11) NOT NULL,
  `paypal_payment_id` int(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `payment_total_cents` int(11) DEFAULT NULL,
  `fee_total_cents` int(11) DEFAULT NULL,
  `refunding_id` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_tokens`
--

CREATE TABLE IF NOT EXISTS `paypal_tokens` (
  `id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `token` varchar(64) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_action` varchar(32) DEFAULT NULL,
  `merchant_id` varchar(255) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_quantity` int(11) DEFAULT NULL,
  `item_price_cents` int(11) DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `express_checkout_url` varchar(255) DEFAULT NULL,
  `shipping_total_cents` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `id` varchar(22) NOT NULL,
  `community_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_admin` int(11) DEFAULT '0',
  `locale` varchar(255) DEFAULT 'fi',
  `preferences` text,
  `active_days_count` int(11) DEFAULT '0',
  `last_page_load_date` datetime DEFAULT NULL,
  `test_group_number` int(11) DEFAULT '1',
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `legacy_encrypted_password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `description` text,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `image_processing` tinyint(1) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `authentication_token` varchar(255) DEFAULT NULL,
  `community_updates_last_sent_at` datetime DEFAULT NULL,
  `min_days_between_community_updates` int(11) DEFAULT '1',
  `is_organization` tinyint(1) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `cloned_from` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `community_id`, `created_at`, `updated_at`, `is_admin`, `locale`, `preferences`, `active_days_count`, `last_page_load_date`, `test_group_number`, `username`, `email`, `encrypted_password`, `legacy_encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `password_salt`, `given_name`, `family_name`, `phone_number`, `description`, `image_file_name`, `image_content_type`, `image_file_size`, `image_updated_at`, `image_processing`, `facebook_id`, `authentication_token`, `community_updates_last_sent_at`, `min_days_between_community_updates`, `is_organization`, `organization_name`, `deleted`, `cloned_from`) VALUES
('hqtFg4Sqxp3EDSoRObD75Q', 1, '2016-08-03 20:10:09', '2016-08-03 20:10:09', 0, 'en', '---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n', 0, NULL, 4, 'aprilage', NULL, '$2a$10$c5NJWXNEREdPbwfC9c/DM.euZXHPkZWpczSLj6BO1DnhRDA.2jUdy', NULL, NULL, NULL, NULL, 1, '2016-08-03 20:10:09', '2016-08-03 20:10:09', '127.0.0.1', '127.0.0.1', NULL, 'mikasd', 'aprial', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, 0, NULL),
('u_N7PVCq51QvJ_mLh7qXeA', 1, '2016-07-27 16:11:41', '2016-08-03 20:16:34', 1, 'en', '---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n', 0, NULL, 3, 'mikes', NULL, '$2a$10$rW5ZE4frYW7JzdAgeWFo4.YeRgtkSx.KXa/vXpX.FCv9HeonImcY6', NULL, NULL, NULL, NULL, 5, '2016-08-03 20:16:34', '2016-08-03 20:10:28', '127.0.0.1', '127.0.0.1', NULL, 'mike', 'stumpf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `person_comments`
--

CREATE TABLE IF NOT EXISTS `person_comments` (
  `id` int(11) NOT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `target_person_id` varchar(255) DEFAULT NULL,
  `text_content` text,
  `grade` int(11) DEFAULT NULL,
  `task_type` varchar(255) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `kassi_event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person_conversations`
--

CREATE TABLE IF NOT EXISTS `person_conversations` (
  `id` int(11) NOT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_read` int(11) DEFAULT '0',
  `last_sent_at` datetime DEFAULT NULL,
  `last_received_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person_interesting_listings`
--

CREATE TABLE IF NOT EXISTS `person_interesting_listings` (
  `id` int(11) NOT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person_read_listings`
--

CREATE TABLE IF NOT EXISTS `person_read_listings` (
  `id` int(11) NOT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_emails`
--

CREATE TABLE IF NOT EXISTS `prospect_emails` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20080806070738'),
('20080807071903'),
('20080807080513'),
('20080808095031'),
('20080815075550'),
('20080818091109'),
('20080818092139'),
('20080821103835'),
('20080825064927'),
('20080825114546'),
('20080828104013'),
('20080828104239'),
('20080919122825'),
('20080925100643'),
('20080925100743'),
('20080925103547'),
('20080925103759'),
('20080925112423'),
('20080925114309'),
('20080929102121'),
('20081008115110'),
('20081009160751'),
('20081010114150'),
('20081024154431'),
('20081024182346'),
('20081024183444'),
('20081103092143'),
('20081104070403'),
('20081118145857'),
('20081121084337'),
('20081202140109'),
('20081205142238'),
('20081215145238'),
('20081216060503'),
('20090119114525'),
('20090218112317'),
('20090219094209'),
('20090225073742'),
('20090323121824'),
('20090330064443'),
('20090330070210'),
('20090330072036'),
('20090401181848'),
('20090401184511'),
('20090401185039'),
('20090402144456'),
('20090403093157'),
('20090406081353'),
('20090414142556'),
('20090415085812'),
('20090415130553'),
('20090415131023'),
('20090424093506'),
('20090424100145'),
('20090618112730'),
('20090629113838'),
('20090629131727'),
('20090701065350'),
('20090701110931'),
('20090713130351'),
('20090729124418'),
('20090730093917'),
('20090730094216'),
('20090731134028'),
('20090821075949'),
('20090904120242'),
('20090907155717'),
('20091006112446'),
('20091028095545'),
('20091028131201'),
('20091109161516'),
('20100322132547'),
('20100505110646'),
('20100707105549'),
('20100721120037'),
('20100721123825'),
('20100721124444'),
('20100726071811'),
('20100727102551'),
('20100727103659'),
('20100729112458'),
('20100729124210'),
('20100729141955'),
('20100729142416'),
('20100730120601'),
('20100730132825'),
('20100809090550'),
('20100809120502'),
('20100813161213'),
('20100817115816'),
('20100818102743'),
('20100819114104'),
('20100820122449'),
('20100902135234'),
('20100902142325'),
('20100908112841'),
('20100909105810'),
('20100909114132'),
('20100920075651'),
('20100921155612'),
('20100922081110'),
('20100922102321'),
('20100922122740'),
('20100923074241'),
('20100927150547'),
('20101007131610'),
('20101007131827'),
('20101013115208'),
('20101013124056'),
('20101026082126'),
('20101027103753'),
('20101028151541'),
('20101103154108'),
('20101103161641'),
('20101103163019'),
('20101109131431'),
('20101116105410'),
('20101124104905'),
('20101125150638'),
('20101126093026'),
('20101201105920'),
('20101201133429'),
('20101203115308'),
('20101203115634'),
('20101213152125'),
('20101216150725'),
('20101216151447'),
('20101216152952'),
('20110308172759'),
('20110308192757'),
('20110321103604'),
('20110322141439'),
('20110322151957'),
('20110325120932'),
('20110412075940'),
('20110414105702'),
('20110414124938'),
('20110421075758'),
('20110428134543'),
('20110529110417'),
('20110629135331'),
('20110704123058'),
('20110704144650'),
('20110707163036'),
('20110728110124'),
('20110808110217'),
('20110808161514'),
('20110817123457'),
('20110819111416'),
('20110819123636'),
('20110909072646'),
('20110912061834'),
('20110912064526'),
('20110912065222'),
('20110913080622'),
('20110914080549'),
('20110914115824'),
('20110915084232'),
('20110915101535'),
('20111111140246'),
('20111111154416'),
('20111111162432'),
('20111114122125'),
('20111114122315'),
('20111116144337'),
('20111116164728'),
('20111116182825'),
('20111123071116'),
('20111123071850'),
('20111124174508'),
('20111210165312'),
('20111210165854'),
('20111210170231'),
('20111211175403'),
('20111228153911'),
('20120104224115'),
('20120105162140'),
('20120113091548'),
('20120121091558'),
('20120206052931'),
('20120208145336'),
('20120210171827'),
('20120303113202'),
('20120303125412'),
('20120303152837'),
('20120303172713'),
('20120510094327'),
('20120510175152'),
('20120514001557'),
('20120514050302'),
('20120516204538'),
('20120518203511'),
('20120522162329'),
('20120522183329'),
('20120526021050'),
('20120614052244'),
('20120625211426'),
('20120628121713'),
('20120704072606'),
('20120705135703'),
('20120705140109'),
('20120710084323'),
('20120711140918'),
('20120718031225'),
('20120730024756'),
('20120907010347'),
('20120907023525'),
('20120908052908'),
('20120909143322'),
('20120929084903'),
('20120929091629'),
('20121023050946'),
('20121105115053'),
('20121203142830'),
('20121212145626'),
('20121214083430'),
('20121218125831'),
('20121220133808'),
('20121229224803'),
('20130103081705'),
('20130103125240'),
('20130103145816'),
('20130104071929'),
('20130104122958'),
('20130105153450'),
('20130107095027'),
('20130110222425'),
('20130123163722'),
('20130123164653'),
('20130124150000'),
('20130208085827'),
('20130212104852'),
('20130213150133'),
('20130213160145'),
('20130217121320'),
('20130218070405'),
('20130305095824'),
('20130306172327'),
('20130309142322'),
('20130317162509'),
('20130318083721'),
('20130318084043'),
('20130318085152'),
('20130319162158'),
('20130319163113'),
('20130320093549'),
('20130322171458'),
('20130323143126'),
('20130325143038'),
('20130325153817'),
('20130325161150'),
('20130325165508'),
('20130325174608'),
('20130325181741'),
('20130326160252'),
('20130328124654'),
('20130328155825'),
('20130329080756'),
('20130329081612'),
('20130331095134'),
('20130331144047'),
('20130331200801'),
('20130405114540'),
('20130418172231'),
('20130418173835'),
('20130423173017'),
('20130424180017'),
('20130424183653'),
('20130425140120'),
('20130514214222'),
('20130517133311'),
('20130520092054'),
('20130520092357'),
('20130520103753'),
('20130520125924'),
('20130520140756'),
('20130520172713'),
('20130521122031'),
('20130521124342'),
('20130521171401'),
('20130521225614'),
('20130531072349'),
('20130605074725'),
('20130607165451'),
('20130710084408'),
('20130718104939'),
('20130719093816'),
('20130719113330'),
('20130724065048'),
('20130724070139'),
('20130729081847'),
('20130807083847'),
('20130815072527'),
('20130815073546'),
('20130815075659'),
('20130815101112'),
('20130823110113'),
('20130902140027'),
('20130910133213'),
('20130917094727'),
('20130920121927'),
('20130925071631'),
('20130925081815'),
('20130926070322'),
('20130926121237'),
('20130930080143'),
('20131024081428'),
('20131028110133'),
('20131028154626'),
('20131028183014'),
('20131030130320'),
('20131031072301'),
('20131031093809'),
('20131101183938'),
('20131104090808'),
('20131107124835'),
('20131107125413'),
('20131108091824'),
('20131108113632'),
('20131108113650'),
('20131111140902'),
('20131112115307'),
('20131112115308'),
('20131112115435'),
('20131114112955'),
('20131119085439'),
('20131119085625'),
('20131122175753'),
('20131126113141'),
('20131126131750'),
('20131126134024'),
('20131126184439'),
('20131128074254'),
('20131128074910'),
('20131128094614'),
('20131128094758'),
('20131128094839'),
('20131128103251'),
('20131128143205'),
('20131129095727'),
('20131202140547'),
('20131203072124'),
('20131204091623'),
('20131204103910'),
('20131206163837'),
('20131209073416'),
('20131209133946'),
('20131210155502'),
('20131212065037'),
('20131214142413'),
('20131214143004'),
('20131214143005'),
('20131220084742'),
('20131220104804'),
('20131220104805'),
('20131227080454'),
('20131227081256'),
('20140102125702'),
('20140102141643'),
('20140102144755'),
('20140102145633'),
('20140102150134'),
('20140102153949'),
('20140103084331'),
('20140103131350'),
('20140106114557'),
('20140109091819'),
('20140109093432'),
('20140109143257'),
('20140109190928'),
('20140116131654'),
('20140123141906'),
('20140124095930'),
('20140124141214'),
('20140128094422'),
('20140128094642'),
('20140128095047'),
('20140129081030'),
('20140204082210'),
('20140205092212'),
('20140205101011'),
('20140205121010'),
('20140206103152'),
('20140207133412'),
('20140219160247'),
('20140219162023'),
('20140222080916'),
('20140223190922'),
('20140223202734'),
('20140223210213'),
('20140224150322'),
('20140224151953'),
('20140225143012'),
('20140226074348'),
('20140226074445'),
('20140226074710'),
('20140226074751'),
('20140226121423'),
('20140227102627'),
('20140228164206'),
('20140228164428'),
('20140228165024'),
('20140301074143'),
('20140303131213'),
('20140304135448'),
('20140306083247'),
('20140312145533'),
('20140312150455'),
('20140314132659'),
('20140318131351'),
('20140319182117'),
('20140324073247'),
('20140328124957'),
('20140328133415'),
('20140402070713'),
('20140402070714'),
('20140411121926'),
('20140415092507'),
('20140415093234'),
('20140417084647'),
('20140417085905'),
('20140417162548'),
('20140417235732'),
('20140422120515'),
('20140425080207'),
('20140425080603'),
('20140425080731'),
('20140425081001'),
('20140425111235'),
('20140428132517'),
('20140428134415'),
('20140507104933'),
('20140507105154'),
('20140509115747'),
('20140512062911'),
('20140516095154'),
('20140519102507'),
('20140519123344'),
('20140519132638'),
('20140519164823'),
('20140523082452'),
('20140526064017'),
('20140530105841'),
('20140530115044'),
('20140530115433'),
('20140604075725'),
('20140604135743'),
('20140610115132'),
('20140610115217'),
('20140611094552'),
('20140611094703'),
('20140612084036'),
('20140613132734'),
('20140623112935'),
('20140701081453'),
('20140701135724'),
('20140701140655'),
('20140703074142'),
('20140703075424'),
('20140710125950'),
('20140710131146'),
('20140711094414'),
('20140724084559'),
('20140724093459'),
('20140724123125'),
('20140805102757'),
('20140811133602'),
('20140811133603'),
('20140811133605'),
('20140811133606'),
('20140811144528'),
('20140812065415'),
('20140815055023'),
('20140815085018'),
('20140819054528'),
('20140819134039'),
('20140819134055'),
('20140820132249'),
('20140829075839'),
('20140829113807'),
('20140901082541'),
('20140901130206'),
('20140902095905'),
('20140903111344'),
('20140903112203'),
('20140903120109'),
('20140909074331'),
('20140912084032'),
('20140912115758'),
('20140925093828'),
('20140925095608'),
('20140925111706'),
('20140925112419'),
('20140929090537'),
('20140930064120'),
('20140930064130'),
('20140930064140'),
('20140930064150'),
('20140930064160'),
('20140930064170'),
('20140930064180'),
('20140930064185'),
('20140930064190'),
('20140930064200'),
('20140930074731'),
('20140930083026'),
('20141001065955'),
('20141001070716'),
('20141001113744'),
('20141003113756'),
('20141006100239'),
('20141006114330'),
('20141007144442'),
('20141009083833'),
('20141015062240'),
('20141015071419'),
('20141015080454'),
('20141015135248'),
('20141015135601'),
('20141015150328'),
('20141017080930'),
('20141020113323'),
('20141020225349'),
('20141022084419'),
('20141022190428'),
('20141023120743'),
('20141023141235'),
('20141023150700'),
('20141028080346'),
('20141028104522'),
('20141028104537'),
('20141029090632'),
('20141029121848'),
('20141029121945'),
('20141030140809'),
('20141102192640'),
('20141104213501'),
('20141111183125'),
('20141112131736'),
('20141113204444'),
('20141117165348'),
('20141203095726'),
('20141204084648'),
('20141205094929'),
('20141216132850'),
('20141216132851'),
('20141217152335'),
('20141218082446'),
('20141219205556'),
('20141222130455'),
('20150103143459'),
('20150107155205'),
('20150116125629'),
('20150121124432'),
('20150121130521'),
('20150128113129'),
('20150202112254'),
('20150204124735'),
('20150204124802'),
('20150205155400'),
('20150205155519'),
('20150206125017'),
('20150206151234'),
('20150212125111'),
('20150213091223'),
('20150213092629'),
('20150213094110'),
('20150224140913'),
('20150225081656'),
('20150225082144'),
('20150225122608'),
('20150226124214'),
('20150226130928'),
('20150226131628'),
('20150303134630'),
('20150303140556'),
('20150304074313'),
('20150304084451'),
('20150311073502'),
('20150311100232'),
('20150311111824'),
('20150311113118'),
('20150316084339'),
('20150316135852'),
('20150316140016'),
('20150316140637'),
('20150316151552'),
('20150316173800'),
('20150317080017'),
('20150317122824'),
('20150317142931'),
('20150319121616'),
('20150320091305'),
('20150320144657'),
('20150323085034'),
('20150323152147'),
('20150324072928'),
('20150324112018'),
('20150324112042'),
('20150324112053'),
('20150324112658'),
('20150324114726'),
('20150325164209'),
('20150327075649'),
('20150330072934'),
('20150330093441'),
('20150330094735'),
('20150331103317'),
('20150331105616'),
('20150331112417'),
('20150401071256'),
('20150401072129'),
('20150401140830'),
('20150402090934'),
('20150402111115'),
('20150403101215'),
('20150407123639'),
('20150407124816'),
('20150407130810'),
('20150407131139'),
('20150413104519'),
('20150413134627'),
('20150415092447'),
('20150416112541'),
('20150416134422'),
('20150420072530'),
('20150420083201'),
('20150426113955'),
('20150429155804'),
('20150507082447'),
('20150507084754'),
('20150507165715'),
('20150508141500'),
('20150512082544'),
('20150512083212'),
('20150512083411'),
('20150512083842'),
('20150518120830'),
('20150518123758'),
('20150519124846'),
('20150520104604'),
('20150520130243'),
('20150520131057'),
('20150527091815'),
('20150527133928'),
('20150528120338'),
('20150528120717'),
('20150608135024'),
('20150608140024'),
('20150608144130'),
('20150609084012'),
('20150612104320'),
('20150622080657'),
('20150630082932'),
('20150630122552'),
('20150729062045'),
('20150729062215'),
('20150731115141'),
('20150731115426'),
('20150731115742'),
('20150804113139'),
('20150804114651'),
('20150805084232'),
('20150806114405'),
('20150806114717'),
('20150807141947'),
('20150821131310'),
('20150821131616'),
('20150825120916'),
('20150825121715'),
('20150825122606'),
('20150828094836'),
('20150902090425'),
('20150902103231'),
('20151008090106'),
('20151008130725'),
('20151022180225'),
('20151022180242'),
('20151022183133'),
('20151102084029'),
('20151202062609'),
('20151204083028'),
('20151209102951'),
('20151215071150'),
('20151230071554'),
('20151230095128'),
('20151231083524'),
('20160119092239'),
('20160119092534'),
('20160120112839'),
('20160126134509'),
('20160126141249'),
('20160209172619'),
('20160209183917'),
('20160216084624'),
('20160223083004'),
('20160223084741'),
('20160229114242'),
('20160311070106'),
('20160322103154'),
('20160322103155'),
('20160322103156'),
('20160407103437'),
('20160407132641'),
('20160408061218'),
('20160408070000'),
('20160408070005'),
('20160420100304'),
('20160420200020'),
('20160420200030'),
('20160420200040'),
('20160420200050'),
('20160420200060'),
('20160420200065'),
('20160420200066'),
('20160420200080'),
('20160420200090'),
('20160420200100'),
('20160420200110'),
('20160422074608'),
('20160422075215'),
('20160422094212'),
('20160422094431'),
('20160422094536'),
('20160422114240'),
('20160422114747'),
('20160422123125'),
('20160422123211'),
('20160425144703'),
('20160427113446'),
('20160509111922'),
('20160511130006'),
('20160518060235'),
('20160608130531'),
('20160609070256'),
('20160609080700'),
('20160609081158'),
('20160614071055'),
('20160615145518'),
('20160627063918'),
('20160708084933'),
('20160728102918');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session_id`, `data`, `created_at`, `updated_at`) VALUES
(1, 'cd67a746b1604babfa8f5e3691a934d6', 'BAh7CEkiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNofQBGSSIW\ncmV0dXJuX3RvX2NvbnRlbnQGOwBGIgYvSSIQX2NzcmZfdG9rZW4GOwBGSSIx\nSExUTVhrYVNza1puUmhnczVWblRNUEswdUtKWlNQVkNhVlNRY0VJOW5DOD0G\nOwBG\n', '2016-07-27 16:12:23', '2016-07-29 18:04:17'),
(3, '5ead26e1392cce7e84f24a8d86f6dcb2', 'BAh7CkkiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNofQBGSSIW\ncmV0dXJuX3RvX2NvbnRlbnQGOwBGIgYvSSIbd2FyZGVuLnVzZXIucGVyc29u\nLmtleQY7AFRbB1sGSSIbdV9ON1BWQ3E1MVF2Sl9tTGg3cVhlQQY7AFRJIiIk\nMmEkMTAkclc1WkU0ZnJZVzdKemRBZ2VXRm80LgY7AFRJIg5wZXJzb25faWQG\nOwBGQA5JIhBfY3NyZl90b2tlbgY7AEZJIjEza1UyS3dxaExTNWo4Qkc0NW1y\nNnk5b0dBYnl4U1VjSlZWdjZ2ZE9Id2w0PQY7AEY=\n', '2016-07-27 17:03:33', '2016-07-29 17:25:43'),
(4, '662d3be73c348a7fa64f5db96fb2864b', 'BAh7CEkiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNofQBGSSIW\ncmV0dXJuX3RvX2NvbnRlbnQGOwBGIiIvZW4vbGlzdGluZ3MvMS1zYW1wbGUt\nbGlzdGluZ0kiEF9jc3JmX3Rva2VuBjsARkkiMVF4cDgvUS9JeEJsWHcvVS9a\nNXJZdFdCRjREV3lRNVRCS1VUWTFBQURhZHM9BjsARg==\n', '2016-07-27 17:42:17', '2016-07-27 17:42:17'),
(5, 'd7eeed883a80b04d826025e15e6da8b1', 'BAh7CEkiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNofQBGSSIW\ncmV0dXJuX3RvX2NvbnRlbnQGOwBGIgYvSSIQX2NzcmZfdG9rZW4GOwBGSSIx\nQ3IwU1k2T2ZlSWNDZ3RiSFIvMmtVRVpEL1lsUFVPTXlrVHpqTmswQjl6az0G\nOwBG\n', '2016-07-29 20:55:53', '2016-07-29 20:55:53'),
(15, 'd478ef8acc9feaeb32271335d1aee800', 'BAh7CkkiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNofQBGSSIb\nd2FyZGVuLnVzZXIucGVyc29uLmtleQY7AFRbB1sGSSIbdV9ON1BWQ3E1MVF2\nSl9tTGg3cVhlQQY7AFRJIiIkMmEkMTAkclc1WkU0ZnJZVzdKemRBZ2VXRm80\nLgY7AFRJIg5wZXJzb25faWQGOwBGQAxJIhZyZXR1cm5fdG9fY29udGVudAY7\nAEYiBi9JIhBfY3NyZl90b2tlbgY7AEZJIjFQZ0dIS1BRV0p4c2xxbTlQUTdj\nQkphSUdjSUxWOFVIYXVDRTJhR0w2ZVhRPQY7AEY=\n', '2016-08-03 20:16:34', '2016-08-04 21:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE IF NOT EXISTS `shipping_addresses` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state_or_province` varchar(255) DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `country_code` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int(11) NOT NULL,
  `grade` float DEFAULT NULL,
  `text` text,
  `author_id` varchar(255) DEFAULT NULL,
  `participation_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL,
  `starter_id` varchar(255) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `automatic_confirmation_after_days` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `starter_skipped_feedback` tinyint(1) DEFAULT '0',
  `author_skipped_feedback` tinyint(1) DEFAULT '0',
  `last_transition_at` datetime DEFAULT NULL,
  `current_state` varchar(255) DEFAULT NULL,
  `commission_from_seller` int(11) DEFAULT NULL,
  `minimum_commission_cents` int(11) DEFAULT '0',
  `minimum_commission_currency` varchar(255) DEFAULT NULL,
  `payment_gateway` varchar(255) NOT NULL DEFAULT 'none',
  `listing_quantity` int(11) DEFAULT '1',
  `listing_author_id` varchar(255) DEFAULT NULL,
  `listing_title` varchar(255) DEFAULT NULL,
  `unit_type` varchar(32) DEFAULT NULL,
  `unit_price_cents` int(11) DEFAULT NULL,
  `unit_price_currency` varchar(8) DEFAULT NULL,
  `unit_tr_key` varchar(64) DEFAULT NULL,
  `unit_selector_tr_key` varchar(64) DEFAULT NULL,
  `payment_process` varchar(31) DEFAULT 'none',
  `delivery_method` varchar(31) DEFAULT 'none',
  `shipping_price_cents` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_processes`
--

CREATE TABLE IF NOT EXISTS `transaction_processes` (
  `id` int(11) NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `process` varchar(32) NOT NULL,
  `author_is_seller` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_processes`
--

INSERT INTO `transaction_processes` (`id`, `community_id`, `process`, `author_is_seller`, `created_at`, `updated_at`) VALUES
(1, 1, 'none', 1, '2016-07-27 16:11:41', '2016-07-27 16:11:41'),
(2, 1, 'none', 0, '2016-07-27 16:11:41', '2016-07-27 16:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_transitions`
--

CREATE TABLE IF NOT EXISTS `transaction_transitions` (
  `id` int(11) NOT NULL,
  `to_state` varchar(255) DEFAULT NULL,
  `metadata` text,
  `sort_key` int(11) DEFAULT '0',
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_auth_tokens_on_token` (`token`) USING BTREE;

--
-- Indexes for table `billing_agreements`
--
ALTER TABLE `billing_agreements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_billing_agreements_on_paypal_account_id` (`paypal_account_id`) USING BTREE;

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_bookings_on_transaction_id` (`transaction_id`) USING BTREE;

--
-- Indexes for table `braintree_accounts`
--
ALTER TABLE `braintree_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_categories_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_categories_on_parent_id` (`parent_id`) USING BTREE,
  ADD KEY `index_categories_on_url` (`url`) USING BTREE;

--
-- Indexes for table `category_custom_fields`
--
ALTER TABLE `category_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_listing_shapes`
--
ALTER TABLE `category_listing_shapes`
  ADD UNIQUE KEY `unique_listing_shape_category_joins` (`listing_shape_id`,`category_id`) USING BTREE,
  ADD KEY `index_category_listing_shapes_on_category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id_with_locale` (`category_id`,`locale`) USING BTREE,
  ADD KEY `index_category_translations_on_category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `checkout_accounts`
--
ALTER TABLE `checkout_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_comments_on_listing_id` (`listing_id`) USING BTREE;

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_communities_on_domain` (`domain`) USING BTREE,
  ADD KEY `index_communities_on_ident` (`ident`) USING BTREE;

--
-- Indexes for table `community_customizations`
--
ALTER TABLE `community_customizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_community_customizations_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `community_memberships`
--
ALTER TABLE `community_memberships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_community_memberships_on_person_id` (`person_id`) USING BTREE,
  ADD KEY `index_community_memberships_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `community_translations`
--
ALTER TABLE `community_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_community_translations_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `contact_requests`
--
ALTER TABLE `contact_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_conversations_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_conversations_on_last_message_at` (`last_message_at`) USING BTREE,
  ADD KEY `index_conversations_on_listing_id` (`listing_id`) USING BTREE;

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_fields_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_custom_fields_on_search_filter` (`search_filter`) USING BTREE;

--
-- Indexes for table `custom_field_names`
--
ALTER TABLE `custom_field_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locale_index` (`custom_field_id`,`locale`) USING BTREE,
  ADD KEY `index_custom_field_names_on_custom_field_id` (`custom_field_id`) USING BTREE;

--
-- Indexes for table `custom_field_options`
--
ALTER TABLE `custom_field_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_field_options_on_custom_field_id` (`custom_field_id`) USING BTREE;

--
-- Indexes for table `custom_field_option_selections`
--
ALTER TABLE `custom_field_option_selections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_field_option_selections_on_custom_field_option_id` (`custom_field_option_id`) USING BTREE,
  ADD KEY `index_selected_options_on_custom_field_value_id` (`custom_field_value_id`) USING BTREE;

--
-- Indexes for table `custom_field_option_titles`
--
ALTER TABLE `custom_field_option_titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locale_index` (`custom_field_option_id`,`locale`) USING BTREE,
  ADD KEY `index_custom_field_option_titles_on_custom_field_option_id` (`custom_field_option_id`) USING BTREE;

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_field_values_on_listing_id` (`listing_id`) USING BTREE,
  ADD KEY `index_custom_field_values_on_type` (`type`) USING BTREE;

--
-- Indexes for table `delayed_jobs`
--
ALTER TABLE `delayed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_delayed_jobs_on_attempts_and_run_at_and_priority` (`attempts`,`run_at`,`priority`) USING BTREE,
  ADD KEY `index_delayed_jobs_on_locked_created` (`locked_at`,`created_at`) USING BTREE,
  ADD KEY `delayed_jobs_priority` (`priority`,`run_at`) USING BTREE;

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_emails_on_address_and_community_id` (`address`,`community_id`) USING BTREE,
  ADD KEY `index_emails_on_address` (`address`) USING BTREE,
  ADD KEY `index_emails_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_emails_on_person_id` (`person_id`) USING BTREE;

--
-- Indexes for table `favors`
--
ALTER TABLE `favors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_flags`
--
ALTER TABLE `feature_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_feature_flags_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follower_relationships`
--
ALTER TABLE `follower_relationships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_follower_relationships_on_person_id_and_follower_id` (`person_id`,`follower_id`) USING BTREE,
  ADD KEY `index_follower_relationships_on_follower_id` (`follower_id`) USING BTREE,
  ADD KEY `index_follower_relationships_on_person_id` (`person_id`) USING BTREE;

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_invitations_on_code` (`code`) USING BTREE,
  ADD KEY `index_invitations_on_inviter_id` (`inviter_id`) USING BTREE;

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kassi_events`
--
ALTER TABLE `kassi_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_landing_pages_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `landing_page_versions`
--
ALTER TABLE `landing_page_versions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_landing_page_versions_on_community_id_and_version` (`community_id`,`version`) USING BTREE;

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_listings_on_new_category_id` (`category_id`) USING BTREE,
  ADD KEY `person_listings` (`community_id`,`author_id`) USING BTREE,
  ADD KEY `homepage_query` (`community_id`,`open`,`sort_date`,`deleted`) USING BTREE,
  ADD KEY `updates_email_listings` (`community_id`,`open`,`updates_email_at`) USING BTREE,
  ADD KEY `homepage_query_valid_until` (`community_id`,`open`,`valid_until`,`sort_date`,`deleted`) USING BTREE,
  ADD KEY `index_listings_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_listings_on_listing_shape_id` (`listing_shape_id`) USING BTREE,
  ADD KEY `index_listings_on_category_id` (`old_category_id`) USING BTREE,
  ADD KEY `index_listings_on_open` (`open`) USING BTREE;

--
-- Indexes for table `listing_comments`
--
ALTER TABLE `listing_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing_followers`
--
ALTER TABLE `listing_followers`
  ADD KEY `index_listing_followers_on_listing_id` (`listing_id`) USING BTREE,
  ADD KEY `index_listing_followers_on_person_id` (`person_id`) USING BTREE;

--
-- Indexes for table `listing_images`
--
ALTER TABLE `listing_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_listing_images_on_listing_id` (`listing_id`) USING BTREE;

--
-- Indexes for table `listing_shapes`
--
ALTER TABLE `listing_shapes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `multicol_index` (`community_id`,`deleted`,`sort_priority`) USING BTREE,
  ADD KEY `index_listing_shapes_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_listing_shapes_on_name` (`name`) USING BTREE;

--
-- Indexes for table `listing_units`
--
ALTER TABLE `listing_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_listing_units_on_listing_shape_id` (`listing_shape_id`) USING BTREE;

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_locations_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_locations_on_listing_id` (`listing_id`) USING BTREE,
  ADD KEY `index_locations_on_person_id` (`person_id`) USING BTREE;

--
-- Indexes for table `marketplace_configurations`
--
ALTER TABLE `marketplace_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_marketplace_configurations_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `marketplace_plans`
--
ALTER TABLE `marketplace_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_marketplace_plans_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_marketplace_plans_on_created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `marketplace_sender_emails`
--
ALTER TABLE `marketplace_sender_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_marketplace_sender_emails_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `marketplace_setup_steps`
--
ALTER TABLE `marketplace_setup_steps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_marketplace_setup_steps_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `marketplace_trials`
--
ALTER TABLE `marketplace_trials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_marketplace_trials_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_marketplace_trials_on_created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `menu_links`
--
ALTER TABLE `menu_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_menu_links_on_community_and_sort` (`community_id`,`sort_priority`) USING BTREE;

--
-- Indexes for table `menu_link_translations`
--
ALTER TABLE `menu_link_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_menu_link_translations_on_menu_link_id` (`menu_link_id`) USING BTREE;

--
-- Indexes for table `mercury_images`
--
ALTER TABLE `mercury_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_messages_on_conversation_id` (`conversation_id`) USING BTREE;

--
-- Indexes for table `order_permissions`
--
ALTER TABLE `order_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_order_permissions_on_paypal_account_id` (`paypal_account_id`) USING BTREE;

--
-- Indexes for table `participations`
--
ALTER TABLE `participations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_participations_on_conversation_id` (`conversation_id`) USING BTREE,
  ADD KEY `index_participations_on_person_id` (`person_id`) USING BTREE;

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_payments_on_payer_id` (`payer_id`) USING BTREE,
  ADD KEY `index_payments_on_conversation_id` (`transaction_id`) USING BTREE;

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_rows`
--
ALTER TABLE `payment_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_payment_rows_on_payment_id` (`payment_id`) USING BTREE;

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_payment_settings_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `paypal_accounts`
--
ALTER TABLE `paypal_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_paypal_accounts_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_paypal_accounts_on_payer_id` (`payer_id`) USING BTREE,
  ADD KEY `index_paypal_accounts_on_person_id` (`person_id`) USING BTREE;

--
-- Indexes for table `paypal_ipn_messages`
--
ALTER TABLE `paypal_ipn_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_paypal_payments_on_transaction_id` (`transaction_id`) USING BTREE,
  ADD UNIQUE KEY `index_paypal_payments_on_authorization_id` (`authorization_id`) USING BTREE,
  ADD UNIQUE KEY `index_paypal_payments_on_order_id` (`order_id`) USING BTREE,
  ADD KEY `index_paypal_payments_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `paypal_process_tokens`
--
ALTER TABLE `paypal_process_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_paypal_process_tokens_on_process_token` (`process_token`) USING BTREE,
  ADD UNIQUE KEY `index_paypal_process_tokens_on_transaction` (`transaction_id`,`community_id`,`op_name`) USING BTREE;

--
-- Indexes for table `paypal_refunds`
--
ALTER TABLE `paypal_refunds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_paypal_refunds_on_refunding_id` (`refunding_id`) USING BTREE;

--
-- Indexes for table `paypal_tokens`
--
ALTER TABLE `paypal_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_paypal_tokens_on_token` (`token`) USING BTREE,
  ADD KEY `index_paypal_tokens_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_paypal_tokens_on_transaction_id` (`transaction_id`) USING BTREE;

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD UNIQUE KEY `index_people_on_username_and_community_id` (`username`,`community_id`) USING BTREE,
  ADD UNIQUE KEY `index_people_on_email` (`email`) USING BTREE,
  ADD UNIQUE KEY `index_people_on_facebook_id_and_community_id` (`facebook_id`,`community_id`) USING BTREE,
  ADD UNIQUE KEY `index_people_on_reset_password_token` (`reset_password_token`) USING BTREE,
  ADD KEY `index_people_on_authentication_token` (`authentication_token`) USING BTREE,
  ADD KEY `index_people_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_people_on_facebook_id` (`facebook_id`) USING BTREE,
  ADD KEY `index_people_on_id` (`id`) USING BTREE,
  ADD KEY `index_people_on_username` (`username`) USING BTREE;

--
-- Indexes for table `person_comments`
--
ALTER TABLE `person_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person_conversations`
--
ALTER TABLE `person_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person_interesting_listings`
--
ALTER TABLE `person_interesting_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person_read_listings`
--
ALTER TABLE `person_read_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prospect_emails`
--
ALTER TABLE `prospect_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_sessions_on_session_id` (`session_id`) USING BTREE,
  ADD KEY `index_sessions_on_updated_at` (`updated_at`) USING BTREE;

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_testimonials_on_author_id` (`author_id`) USING BTREE,
  ADD KEY `index_testimonials_on_receiver_id` (`receiver_id`) USING BTREE,
  ADD KEY `index_testimonials_on_transaction_id` (`transaction_id`) USING BTREE;

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_on_cid_and_deleted` (`community_id`,`deleted`) USING BTREE,
  ADD KEY `index_transactions_on_community_id` (`community_id`) USING BTREE,
  ADD KEY `index_transactions_on_conversation_id` (`conversation_id`) USING BTREE,
  ADD KEY `index_transactions_on_deleted` (`deleted`) USING BTREE,
  ADD KEY `index_transactions_on_last_transition_at` (`last_transition_at`) USING BTREE,
  ADD KEY `index_transactions_on_listing_id` (`listing_id`) USING BTREE;

--
-- Indexes for table `transaction_processes`
--
ALTER TABLE `transaction_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_transaction_process_on_community_id` (`community_id`) USING BTREE;

--
-- Indexes for table `transaction_transitions`
--
ALTER TABLE `transaction_transitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_transaction_transitions_on_sort_key_and_conversation_id` (`sort_key`,`transaction_id`) USING BTREE,
  ADD KEY `index_transaction_transitions_on_conversation_id` (`transaction_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `billing_agreements`
--
ALTER TABLE `billing_agreements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `braintree_accounts`
--
ALTER TABLE `braintree_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `category_custom_fields`
--
ALTER TABLE `category_custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `checkout_accounts`
--
ALTER TABLE `checkout_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `communities`
--
ALTER TABLE `communities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `community_customizations`
--
ALTER TABLE `community_customizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `community_memberships`
--
ALTER TABLE `community_memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `community_translations`
--
ALTER TABLE `community_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contact_requests`
--
ALTER TABLE `contact_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custom_field_names`
--
ALTER TABLE `custom_field_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custom_field_options`
--
ALTER TABLE `custom_field_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `custom_field_option_selections`
--
ALTER TABLE `custom_field_option_selections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `custom_field_option_titles`
--
ALTER TABLE `custom_field_option_titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `delayed_jobs`
--
ALTER TABLE `delayed_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `favors`
--
ALTER TABLE `favors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feature_flags`
--
ALTER TABLE `feature_flags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `follower_relationships`
--
ALTER TABLE `follower_relationships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kassi_events`
--
ALTER TABLE `kassi_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `landing_pages`
--
ALTER TABLE `landing_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `landing_page_versions`
--
ALTER TABLE `landing_page_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `listing_comments`
--
ALTER TABLE `listing_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `listing_images`
--
ALTER TABLE `listing_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `listing_shapes`
--
ALTER TABLE `listing_shapes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `listing_units`
--
ALTER TABLE `listing_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `marketplace_configurations`
--
ALTER TABLE `marketplace_configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `marketplace_plans`
--
ALTER TABLE `marketplace_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `marketplace_sender_emails`
--
ALTER TABLE `marketplace_sender_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `marketplace_setup_steps`
--
ALTER TABLE `marketplace_setup_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `marketplace_trials`
--
ALTER TABLE `marketplace_trials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_links`
--
ALTER TABLE `menu_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_link_translations`
--
ALTER TABLE `menu_link_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mercury_images`
--
ALTER TABLE `mercury_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_permissions`
--
ALTER TABLE `order_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `participations`
--
ALTER TABLE `participations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `payment_rows`
--
ALTER TABLE `payment_rows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_accounts`
--
ALTER TABLE `paypal_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_ipn_messages`
--
ALTER TABLE `paypal_ipn_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_process_tokens`
--
ALTER TABLE `paypal_process_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_refunds`
--
ALTER TABLE `paypal_refunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_tokens`
--
ALTER TABLE `paypal_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person_comments`
--
ALTER TABLE `person_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person_conversations`
--
ALTER TABLE `person_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person_interesting_listings`
--
ALTER TABLE `person_interesting_listings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person_read_listings`
--
ALTER TABLE `person_read_listings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prospect_emails`
--
ALTER TABLE `prospect_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction_processes`
--
ALTER TABLE `transaction_processes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transaction_transitions`
--
ALTER TABLE `transaction_transitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
