-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 04:28 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_administrator`
--

CREATE TABLE `accounts_administrator` (
  `id` bigint(20) NOT NULL,
  `bio` longtext DEFAULT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customuser`
--

CREATE TABLE `accounts_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `full_name` varchar(60) NOT NULL,
  `role` varchar(25) NOT NULL,
  `phone` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `accounts_customuser`
--

INSERT INTO `accounts_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `email`, `image`, `gender`, `full_name`, `role`, `phone`, `is_active`, `is_staff`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$QdFWfHMBB2GR4WV0GDB6pW$GXxWJQohVcFhkbcTVHQfz7mSSXVAnWOQZ03Z7oOoQBc=', '2023-11-24 13:57:25.397275', 1, '', 'test@test.com', '', '', '', 'Administrator', '', 1, 1, '2023-11-22 07:23:21.123586'),
(2, 'pbkdf2_sha256$260000$s0rutjzfPDD4QHjxtqrTPE$YhR2yGSZiVnHBNILoqyIpI6LKB3AwIT7WDuoFOfaeBk=', '2023-11-23 12:17:25.512253', 0, 'Manu', 'manu@mail.com', '', 'Male', 'manu manu', 'Landlord', '0758 050012', 1, 0, '2023-11-22 07:25:46.807569'),
(3, 'pbkdf2_sha256$260000$7dFecUxXUmGyC2K9CDVsUC$xIvHabs1nKFrTfV+UVYsoWVZ1763y9amuV2hLTd2LxM=', '2023-11-23 18:44:55.081014', 0, 'Bruno', 'jose@jose.com', '', 'Male', 'Bruno Musamali', 'Prospective tenant', '0758 051012', 1, 1, '2023-11-22 07:26:49.748315'),
(4, 'pbkdf2_sha256$260000$0y7KMKmg0cK8e4au1OlXxj$0/8Df57xt31M8et9J5+68w8f/Kb//xvU/y41Oqb1aqI=', '2023-11-24 14:08:33.456635', 0, 'Talia', 'talia@jose.com', '', 'Female', 'Talia Ann', 'Landlord', '0758 051111', 1, 0, '2023-11-22 07:28:59.160256'),
(7, 'pbkdf2_sha256$260000$GPDOjQRI175K9L0bhIBBOZ$t1RcbmjNFmhdx3Dsbe+GPz7phnwu1KAAymC3JpD9IIg=', '2023-11-22 15:16:58.462907', 0, 'Joseph01', 'indiekaj@gmail.com', '', 'Male', 'Joseph TheOne', 'Landlord', '0748 050012', 1, 0, '2023-11-22 15:12:11.606510'),
(8, 'pbkdf2_sha256$260000$76SGReR0FV94X1DbzM3rDL$k/lR4ANYbNsLY83T3yY1OAxUCTaBVi6K4CdEHICb2HM=', '2023-11-22 17:56:35.853522', 0, 'Test2', 'test@mail.com', '', 'Female', 'Test ForAll', 'Prospective tenant', '0713 050012', 1, 0, '2023-11-22 17:50:14.076512'),
(9, 'pbkdf2_sha256$260000$eUaduY1d7dZUonYkfWARpt$g0KGoAqgPUnYYteA4fGkOke3M0zn4qCmZ7FwhO9zhsA=', '2023-11-23 11:20:07.871000', 0, 'Test3', 'test2@test.com', '', 'Male', 'The Test', 'Prospective tenant', '0721 050012', 1, 0, '2023-11-23 08:48:05.627618');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customuser_groups`
--

CREATE TABLE `accounts_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customuser_user_permissions`
--

CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_landlord`
--

CREATE TABLE `accounts_landlord` (
  `id` bigint(20) NOT NULL,
  `bio` longtext DEFAULT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `accounts_landlord`
--

INSERT INTO `accounts_landlord` (`id`, `bio`, `profile_picture`, `user_id`) VALUES
(1, NULL, 'default.png', 2),
(2, NULL, 'default.png', 4),
(5, NULL, 'default.png', 7);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_prospectivetenant`
--

CREATE TABLE `accounts_prospectivetenant` (
  `id` bigint(20) NOT NULL,
  `bio` longtext DEFAULT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `accounts_prospectivetenant`
--

INSERT INTO `accounts_prospectivetenant` (`id`, `bio`, `profile_picture`, `user_id`) VALUES
(1, NULL, 'default.png', 3),
(2, NULL, 'default.png', 8),
(3, NULL, 'default.png', 9);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add User', 6, 'add_customuser'),
(22, 'Can change User', 6, 'change_customuser'),
(23, 'Can delete User', 6, 'delete_customuser'),
(24, 'Can view User', 6, 'view_customuser'),
(25, 'Can add prospectivetenant', 7, 'add_prospectivetenant'),
(26, 'Can change prospectivetenant', 7, 'change_prospectivetenant'),
(27, 'Can delete prospectivetenant', 7, 'delete_prospectivetenant'),
(28, 'Can view prospectivetenant', 7, 'view_prospectivetenant'),
(29, 'Can add landlord', 8, 'add_landlord'),
(30, 'Can change landlord', 8, 'change_landlord'),
(31, 'Can delete landlord', 8, 'delete_landlord'),
(32, 'Can view landlord', 8, 'view_landlord'),
(33, 'Can add administrator', 9, 'add_administrator'),
(34, 'Can change administrator', 9, 'change_administrator'),
(35, 'Can delete administrator', 9, 'delete_administrator'),
(36, 'Can view administrator', 9, 'view_administrator'),
(37, 'Can add Apartment', 10, 'add_apartments'),
(38, 'Can change Apartment', 10, 'change_apartments'),
(39, 'Can delete Apartment', 10, 'delete_apartments'),
(40, 'Can view Apartment', 10, 'view_apartments'),
(41, 'Can add room', 11, 'add_rooms'),
(42, 'Can change room', 11, 'change_rooms'),
(43, 'Can delete room', 11, 'delete_rooms'),
(44, 'Can view room', 11, 'view_rooms'),
(45, 'Can add Booking History', 12, 'add_booking_history'),
(46, 'Can change Booking History', 12, 'change_booking_history'),
(47, 'Can delete Booking History', 12, 'delete_booking_history'),
(48, 'Can view Booking History', 12, 'view_booking_history'),
(49, 'Can add page', 13, 'add_page'),
(50, 'Can change page', 13, 'change_page'),
(51, 'Can delete page', 13, 'delete_page'),
(52, 'Can view page', 13, 'view_page');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-11-22 07:56:46.721483', '1', 'Zion', 1, '[{\"added\": {}}]', 10, 1),
(2, '2023-11-22 08:00:00.559085', '2', 'Riesta', 1, '[{\"added\": {}}]', 10, 1),
(3, '2023-11-22 08:16:40.638759', '3', 'Maroon', 1, '[{\"added\": {}}]', 10, 1),
(4, '2023-11-22 08:22:54.792954', '4', 'LionsGate', 1, '[{\"added\": {}}]', 10, 1),
(5, '2023-11-22 08:26:49.176270', '1', 'Z-23', 1, '[{\"added\": {}}]', 11, 1),
(6, '2023-11-22 08:27:23.910871', '2', 'Z-24', 1, '[{\"added\": {}}]', 11, 1),
(7, '2023-11-22 08:28:08.633337', '3', 'M-15', 1, '[{\"added\": {}}]', 11, 1),
(8, '2023-11-22 08:28:55.869632', '4', 'M-20', 1, '[{\"added\": {}}]', 11, 1),
(9, '2023-11-22 08:29:35.981387', '5', 'A-15', 1, '[{\"added\": {}}]', 11, 1),
(10, '2023-11-22 08:30:15.348241', '6', 'Z-10', 1, '[{\"added\": {}}]', 11, 1),
(11, '2023-11-22 08:31:08.051913', '7', 'L-14', 1, '[{\"added\": {}}]', 11, 1),
(12, '2023-11-22 08:31:44.334214', '8', 'L-20', 1, '[{\"added\": {}}]', 11, 1),
(13, '2023-11-22 08:32:37.869802', '9', 'L-01', 1, '[{\"added\": {}}]', 11, 1),
(14, '2023-11-22 08:33:34.787916', '10', 'A-05', 1, '[{\"added\": {}}]', 11, 1),
(15, '2023-11-22 08:35:50.473439', '2', 'Z-24', 2, '[{\"changed\": {\"fields\": [\"Room Type\", \"Room image\"]}}]', 11, 1),
(16, '2023-11-22 10:15:15.222374', '7', 'L-14', 2, '[{\"changed\": {\"fields\": [\"Booked\"]}}]', 11, 1),
(17, '2023-11-22 10:15:59.118842', '7', 'L-14', 2, '[{\"changed\": {\"fields\": [\"Booked\"]}}]', 11, 1),
(18, '2023-11-22 13:29:01.124436', '3', 'jose@jose.com', 2, '[{\"changed\": {\"fields\": [\"Is staff\"]}}]', 6, 1),
(19, '2023-11-22 13:34:33.150420', '11', 'L-24', 1, '[{\"added\": {}}]', 11, 1),
(20, '2023-11-22 15:11:13.354305', '5', 'indiekaj@gmail.com', 3, '', 6, 1),
(21, '2023-11-22 15:12:05.617888', '6', 'indiekaj@gmail.com', 3, '', 6, 1),
(22, '2023-11-22 16:55:49.912250', '9', 'L-01', 2, '[{\"changed\": {\"fields\": [\"Tenant\"]}}]', 11, 1),
(23, '2023-11-22 17:33:05.455680', '5', 'A-15', 2, '[{\"changed\": {\"fields\": [\"Booked\"]}}]', 11, 1),
(24, '2023-11-22 17:33:53.798472', '5', 'A-15', 2, '[{\"changed\": {\"fields\": [\"Booked\"]}}]', 11, 1),
(25, '2023-11-22 17:46:46.557849', '5', 'A-15', 2, '[{\"changed\": {\"fields\": [\"Booked\"]}}]', 11, 1),
(26, '2023-11-22 17:51:01.533962', '8', 'test@mail.com', 2, '[{\"changed\": {\"fields\": [\"Is active\"]}}]', 6, 1),
(27, '2023-11-22 17:51:54.262878', '3', 'Test2', 1, '[{\"added\": {}}]', 12, 1),
(28, '2023-11-22 17:54:53.591424', '2', 'Bruno', 2, '[{\"changed\": {\"fields\": [\"Room\"]}}]', 12, 1),
(29, '2023-11-22 17:55:34.032627', '5', 'A-15', 3, '', 11, 1),
(30, '2023-11-22 18:13:46.569912', '3', 'Test2', 2, '[{\"changed\": {\"fields\": [\"Room\"]}}]', 12, 1),
(31, '2023-11-22 18:16:29.171026', '3', 'Test2', 2, '[{\"changed\": {\"fields\": [\"Room\"]}}]', 12, 1),
(32, '2023-11-22 18:23:29.734748', '4', 'Bruno', 1, '[{\"added\": {}}]', 12, 1),
(33, '2023-11-22 18:24:29.031247', '10', 'A-05', 2, '[{\"changed\": {\"fields\": [\"Tenant\", \"Booked\"]}}]', 11, 1),
(34, '2023-11-22 18:28:34.783222', '5', 'Bruno', 1, '[{\"added\": {}}]', 12, 1),
(35, '2023-11-23 12:08:07.751225', '9', 'L-01', 2, '[{\"changed\": {\"fields\": [\"Booked\"]}}]', 11, 1),
(36, '2023-11-23 13:56:27.256668', '16', 'A-23', 3, '', 11, 1),
(37, '2023-11-23 13:56:27.265503', '15', 'R-02', 3, '', 11, 1),
(38, '2023-11-23 13:56:27.266652', '14', 'R-27', 3, '', 11, 1),
(39, '2023-11-23 13:56:27.273182', '13', 'R-20', 3, '', 11, 1),
(40, '2023-11-23 13:56:27.276851', '12', 'A-23', 3, '', 11, 1),
(41, '2023-11-24 13:58:29.654143', '21', 'W-06', 2, '[{\"changed\": {\"fields\": [\"Room Type\"]}}]', 11, 1),
(42, '2023-11-24 13:59:03.047062', '10', 'A-05', 2, '[{\"changed\": {\"fields\": [\"Room Type\"]}}]', 11, 1),
(43, '2023-11-24 13:59:30.206370', '1', 'Z-23', 2, '[{\"changed\": {\"fields\": [\"Room Type\"]}}]', 11, 1),
(44, '2023-11-24 14:16:50.446936', '1', 'terms', 1, '[{\"added\": {}}]', 13, 1),
(45, '2023-11-24 14:18:07.726138', '2', 'privacy', 1, '[{\"added\": {}}]', 13, 1),
(46, '2023-11-24 14:22:34.078975', '3', 'aboutus', 1, '[{\"added\": {}}]', 13, 1),
(47, '2023-11-24 14:24:19.840492', '4', 'contact_us', 1, '[{\"added\": {}}]', 13, 1),
(48, '2023-11-24 14:35:59.867157', '2', 'Privacy Policy', 2, '[{\"changed\": {\"fields\": [\"Page Type\"]}}]', 13, 1),
(49, '2023-11-24 14:36:29.566022', '3', 'About', 2, '[{\"changed\": {\"fields\": [\"Page Type\"]}}]', 13, 1),
(50, '2023-11-24 14:37:32.499628', '1', 'Terms of Use', 2, '[{\"changed\": {\"fields\": [\"Page Type\"]}}]', 13, 1),
(51, '2023-11-24 14:38:13.898834', '4', 'Contact Us', 2, '[{\"changed\": {\"fields\": [\"Page Type\"]}}]', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(9, 'accounts', 'administrator'),
(6, 'accounts', 'customuser'),
(8, 'accounts', 'landlord'),
(7, 'accounts', 'prospectivetenant'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(10, 'rental_app', 'apartments'),
(12, 'rental_app', 'booking_history'),
(13, 'rental_app', 'page'),
(11, 'rental_app', 'rooms'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-22 07:18:54.527269'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-11-22 07:18:54.680591'),
(3, 'auth', '0001_initial', '2023-11-22 07:18:54.933685'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-11-22 07:18:54.962762'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-11-22 07:18:54.975755'),
(6, 'auth', '0004_alter_user_username_opts', '2023-11-22 07:18:54.989976'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-11-22 07:18:54.995953'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-11-22 07:18:55.005271'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-11-22 07:18:55.011747'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-11-22 07:18:55.025904'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-11-22 07:18:55.036562'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-11-22 07:18:55.103508'),
(13, 'auth', '0011_update_proxy_permissions', '2023-11-22 07:18:55.121957'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-11-22 07:18:55.130563'),
(15, 'accounts', '0001_initial', '2023-11-22 07:18:55.978274'),
(16, 'admin', '0001_initial', '2023-11-22 07:18:56.244614'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-11-22 07:18:56.266485'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-22 07:18:56.270289'),
(19, 'rental_app', '0001_initial', '2023-11-22 07:18:56.512997'),
(20, 'sessions', '0001_initial', '2023-11-22 07:18:56.667942'),
(21, 'rental_app', '0002_alter_rooms_booked', '2023-11-22 07:54:15.464094'),
(22, 'rental_app', '0003_auto_20231122_1541', '2023-11-22 12:41:24.739147'),
(23, 'rental_app', '0004_booking_history', '2023-11-22 14:16:07.708161'),
(24, 'rental_app', '0005_auto_20231122_1954', '2023-11-22 16:54:39.679019'),
(25, 'rental_app', '0006_auto_20231122_2004', '2023-11-22 17:04:22.678877'),
(26, 'rental_app', '0007_alter_booking_history_date_booked', '2023-11-22 17:07:54.507489'),
(27, 'rental_app', '0008_alter_booking_history_room', '2023-11-22 17:46:12.937591'),
(28, 'rental_app', '0009_alter_booking_history_room', '2023-11-22 18:28:01.447482'),
(29, 'rental_app', '0010_page', '2023-11-23 10:21:25.795726'),
(30, 'rental_app', '0011_alter_rooms_unique_together', '2023-11-23 13:45:01.801729'),
(31, 'rental_app', '0012_auto_20231124_1654', '2023-11-24 13:55:26.075807');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('c5ta4txeubq7oy8ttqzudocqyv2qwfdy', '.eJxVjEEOwiAQRe_C2hCEQcCl-56BDMwgVUOT0q6Md7dNutDtf-_9t4i4LjWunec4krgKI06_W8L85LYDemC7TzJPbZnHJHdFHrTLYSJ-3Q7376Bir1utlSkaEmUi0GBdRgeXZJFdUeDBsLNUStAbUM4kbwECcfFnVRgpBfH5AuxeOG0:1r5stB:4CEFDkIMA70JZKtp-Sp3plo6iB3poj0hNwfTQzp_FfA', '2023-12-06 19:27:57.076028'),
('d540l2sv235lj58symhqecmzz41wstdv', '.eJxVjM0OwiAQhN-FsyG0i_x49O4zkF0WpGogKe3J-O62SQ96mmS-b-YtAq5LCWtPc5hYXMQgTr8dYXymugN-YL03GVtd5onkrsiDdnlrnF7Xw_07KNjLtvYKPBpnElO2kYxTCOxctsaft2A0GiIlmwm8HkYwOtMYCVkRK8cgPl_u4Dh1:1r6WgP:ovP0x8boKhTexiJ7aeW7q6gH2w9mkYlaITnm6dH6mM8', '2023-12-08 13:57:25.403603'),
('edlqaurthkbthj7b8seymu8vic49rk7d', 'e30:1r67ju:H9ydZiEwkZ_I1UEB6yjpMiuxbPIaqEb8afjrNnp9adE', '2023-12-07 11:19:22.100279'),
('j49rm4fhbinpjxixi2jy7glrcgo1sd7l', 'e30:1r67hs:KCgwxEhJVMHBjCLTF_oI84DEBvffxOXkKqRkgxf3PJw', '2023-12-07 11:17:16.670346'),
('n4a8ow73cuk4oacy2f7eh8cofnomn4mo', 'e30:1r67ir:54Uaqsaxa-yNcBQVvRM9sc2oKtVdsRxnGFkDH0Iz7N0', '2023-12-07 11:18:17.519154');

-- --------------------------------------------------------

--
-- Table structure for table `rental_app_apartments`
--

CREATE TABLE `rental_app_apartments` (
  `id` bigint(20) NOT NULL,
  `apartment_name` varchar(80) NOT NULL,
  `description` longtext NOT NULL,
  `facilities` longtext DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `paid_for` longtext DEFAULT NULL,
  `location` varchar(500) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `landlord_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rental_app_apartments`
--

INSERT INTO `rental_app_apartments` (`id`, `apartment_name`, `description`, `facilities`, `image`, `paid_for`, `location`, `date_created`, `date_updated`, `landlord_id`) VALUES
(1, 'Zion', 'A very good and clean apartment', 'bed\r\nchair\r\nmattress\r\ntable', 'Appartments/main.jpg', 'wifi', 'Taita Taveta University, Gate C', '2023-11-22 07:56:46.719487', '2023-11-22 07:56:46.719487', 2),
(2, 'Riesta', 'Well secured appartment', 'bed and mattress', 'Appartments/R.jpeg', 'wifi and water', 'Taita Taveta University, 200m from Gate C', '2023-11-22 08:00:00.558085', '2023-11-22 08:00:00.558085', 1),
(3, 'Maroon', 'One floor apartment with only 24 beautiful rooms', 'fun and clean water', 'Appartments/OIP.jpeg', 'wifi\r\nbed', 'Taita Taveta University, 100m from Gate A', '2023-11-22 08:16:40.636760', '2023-11-22 08:16:40.636760', 2),
(4, 'LionsGate', 'Clean and well secured apartment', 'wifi and water', 'Appartments/apartment2.jpeg', 'furniture', 'Voi town, opposite Equity bank', '2023-11-22 08:22:54.791955', '2023-11-22 08:22:54.791955', 1),
(5, 'Boabab', 'well secured and clean apartment', 'Bed\r\nMattress\r\nChair\r\nTable\r\nCooking area', 'Appartments/main_xhZzO0R.jpg', 'Wi-Fi\r\nwater', '150m from gate C, Taita Taveta School', '2023-11-23 16:08:13.137468', '2023-11-23 16:08:13.137468', 1),
(6, 'White House', 'luxarious apartment with spacius rooms', 'water', 'Appartments/main_sQxPHQz.jpg', 'Wi-Fi', '500 m from gate B, Voi School', '2023-11-23 16:12:35.607070', '2023-11-23 17:27:29.361717', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rental_app_booking_history`
--

CREATE TABLE `rental_app_booking_history` (
  `id` bigint(20) NOT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_booked` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rental_app_booking_history`
--

INSERT INTO `rental_app_booking_history` (`id`, `room_id`, `user_id`, `date_booked`) VALUES
(2, NULL, 1, '2023-11-22 17:54:53.586442'),
(3, NULL, 2, '2023-11-22 18:16:29.161866'),
(4, 10, 1, '2023-11-22 18:23:29.717537'),
(5, 1, 1, '2023-11-22 18:28:34.776215'),
(6, 8, 3, '2023-11-23 10:06:58.065852');

-- --------------------------------------------------------

--
-- Table structure for table `rental_app_page`
--

CREATE TABLE `rental_app_page` (
  `id` bigint(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `details` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rental_app_page`
--

INSERT INTO `rental_app_page` (`id`, `type`, `details`) VALUES
(1, 'Terms of Use', 'align=\"justify\"><font size=\"2\"><strong><font color=\"#990000\">(1) ACCEPTANCE OF TERMS</font><br><br></strong>Welcome to Yahoo! India. 1Yahoo Web Services India Private Limited Yahoo\", \"we\" or \"us\" as the case may be) provides the Service (defined below) to you, subject to the following Terms of Service (\"TOS\"), which may be updated by us from time to time without notice to you. You can review the most current version of the TOS at any time at: <a href=\"http://in.docs.yahoo.com/info/terms/\">http://in.docs.yahoo.com/info/terms/</a>. In addition, when using particular Yahoo services or third party services, you and Yahoo shall be subject to any posted guidelines or rules applicable to such services which may be posted from time to time. All such guidelines or rules, which maybe subject to change, are hereby incorporated by reference into the TOS. In most cases the guides and rules are specific to a particular part of the Service and will assist you in applying the TOS to that part, but to the extent of any inconsistency between the TOS and any guide or rule, the TOS will prevail. We may also offer other services from time to time that are governed by different Terms of Services, in which case the TOS do not apply to such other services if and to the extent expressly excluded by such different Terms of Services. Yahoo also may offer other services from time to time that are governed by different Terms of Services. These TOS do not apply to such other services that are governed by different Terms of Service. </font></p>\r\n<p align=\"justify\"><font size=\"2\">Welcome to Yahoo! India. Yahoo Web Services India Private Limited Yahoo\", \"we\" or \"us\" as the case may be) provides the Service (defined below) to you, subject to the following Terms of Service (\"TOS\"), which may be updated by us from time to time without notice to you. You can review the most current version of the TOS at any time at: </font><a href=\"http://in.docs.yahoo.com/info/terms/\"><font size=\"2\">http://in.docs.yahoo.com/info/terms/</font></a><font size=\"2\">. In addition, when using particular Yahoo services or third party services, you and Yahoo shall be subject to any posted guidelines or rules applicable to such services which may be posted from time to time. All such guidelines or rules, which maybe subject to change, are hereby incorporated by reference into the TOS. In most cases the guides and rules are specific to a particular part of the Service and will assist you in applying the TOS to that part, but to the extent of any inconsistency between the TOS and any guide or rule, the TOS will prevail. We may also offer other services from time to time that are governed by different Terms of Services, in which case the TOS do not apply to such other services if and to the extent expressly excluded by such different Terms of Services. Yahoo also may offer other services from time to time that are governed by different Terms of Services. These TOS do not apply to such other services that are governed by different Terms of Service. </font></p>\r\n<p align=\"justify\"><font size=\"2\">Welcome to Yahoo! India. Yahoo Web Services India Private Limited Yahoo\", \"we\" or \"us\" as the case may be) provides the Service (defined below) to you, subject to the following Terms of Service (\"TOS\"), which may be updated by us from time to time without notice to you. You can review the most current version of the TOS at any time at: </font><a href=\"http://in.docs.yahoo.com/info/terms/\"><font size=\"2\">http://in.docs.yahoo.com/info/terms/</font></a><font size=\"2\">. In addition, when using particular Yahoo services or third party services, you and Yahoo shall be subject to any posted guidelines or rules applicable to such services which may be posted from time to time. All such guidelines or rules, which maybe subject to change, are hereby incorporated by reference into the TOS. In most cases the guides and rules are specific to a particular part of the Service and will assist you in applying the TOS to that part, but to the extent of any inconsistency between the TOS and any guide or rule, the TOS will prevail. We may also offer other services from time to time that are governed by different Terms of Services, in which case the TOS do not apply to such other services if and to the extent expressly excluded by such different Terms of Services. Yahoo also may offer other services from time to time that are governed by different Terms of Services. These TOS do not apply to such other services that are governed by different Terms of Service. </font></p>'),
(2, 'Privacy Policy', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span>'),
(3, 'About', '<div><span style=\"color: rgb(0, 0, 0); font-family: Georgia; font-size: 15px; text-align: justify; font-weight: bold;\">Welcome to Room Booking Management System!!!</span></div><span style=\"font-family: &quot;courier new&quot;;\"><span style=\"color: rgb(0, 0, 0); font-size: 15px; text-align: justify;\">Since then, our courteous and committed team members have always ensured a pleasant and enjoyable room booking for the clients. This arduous effort has enabled Safe &amp; Secure to be recognized as a dependable booking Solutions provider with three offices in Nairobi.</span><span style=\"color: rgb(80, 80, 80); font-size: 13px;\">&nbsp;We have got rooms to suit the discerning tenants\'s budget and savor. Book your dream room online. Supported quality and proposals of our book consultants, we have a tendency to welcome you to decide on according to your plan.</span></span>'),
(4, 'Contact Us', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Address------J-890 Harambee House Nairobi-110096</span>');

-- --------------------------------------------------------

--
-- Table structure for table `rental_app_rooms`
--

CREATE TABLE `rental_app_rooms` (
  `id` bigint(20) NOT NULL,
  `room_number` varchar(50) NOT NULL,
  `size` varchar(30) NOT NULL,
  `room_type` varchar(40) NOT NULL,
  `booked` tinyint(1) NOT NULL,
  `rent` int(10) UNSIGNED NOT NULL CHECK (`rent` >= 0),
  `image` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `apartment_id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `rate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rental_app_rooms`
--

INSERT INTO `rental_app_rooms` (`id`, `room_number`, `size`, `room_type`, `booked`, `rent`, `image`, `date_created`, `date_updated`, `apartment_id`, `tenant_id`, `rate`) VALUES
(1, 'Z-23', '120 sq cm', 'Studio', 1, 3200, 'Rooms/room1.jpeg', '2023-11-22 08:26:49.176270', '2023-11-24 13:59:30.201181', 1, NULL, 'Per Month'),
(2, 'Z-24', '120 sq cm', 'Shared room', 0, 3200, 'Rooms/room3.jpeg', '2023-11-22 08:27:23.910244', '2023-11-22 08:35:50.473439', 1, NULL, 'Per Month'),
(3, 'M-15', '150 sq ft', 'Bedsitter', 0, 5000, 'Rooms/room2.jpeg', '2023-11-22 08:28:08.631338', '2023-11-22 08:28:08.631338', 3, NULL, 'Per Month'),
(4, 'M-20', '150 sq ft', 'Bedsitter', 0, 5000, 'Rooms/room4.jpeg', '2023-11-22 08:28:55.868257', '2023-11-22 08:28:55.868257', 3, NULL, 'Per Month'),
(6, 'Z-10', '120 sq cm', 'Bedsitter', 0, 5000, 'Rooms/room6.jpeg', '2023-11-22 08:30:15.342927', '2023-11-22 08:30:15.342927', 1, NULL, 'Per Month'),
(7, 'L-14', '250 sq ft', 'One-Bedroom', 0, 7500, 'Rooms/room9.jpeg', '2023-11-22 08:31:08.049917', '2023-11-22 10:15:59.118842', 4, NULL, 'Per Month'),
(8, 'L-20', '250 sq ft', 'One-Bedroom', 1, 7500, 'Rooms/room9_FtMGlEW.jpeg', '2023-11-22 08:31:44.332205', '2023-11-23 10:07:08.297368', 4, 3, 'Per Month'),
(9, 'L-01', '200 sq ft', 'Bedsitter', 0, 6500, 'Rooms/room7.jpg', '2023-11-22 08:32:37.867835', '2023-11-23 12:08:07.739843', 4, 1, 'Per Month'),
(10, 'A-05', '120sq cm', 'Single room', 1, 6500, 'Rooms/room5_fffVofJ.jpeg', '2023-11-22 08:33:34.785918', '2023-11-24 13:59:03.027783', 2, 1, 'Per Month'),
(11, 'L-24', '100 sq cm', 'Studio', 0, 200, 'Rooms/room4_zTe5Cqd.jpeg', '2023-11-22 13:34:33.148958', '2023-11-22 13:34:33.148958', 4, NULL, 'Per Hour'),
(19, 'R-20', '145sq m', 'Bedsitter', 0, 6500, 'Rooms/room4_59WOLzQ.jpeg', '2023-11-23 13:58:13.987178', '2023-11-23 13:58:13.987178', 2, NULL, 'Per Month'),
(20, 'W-23', '200sq m', 'Bedsitter', 0, 4800, 'Rooms/room2_wZeBciZ.jpeg', '2023-11-23 16:20:31.383658', '2023-11-23 17:35:53.508066', 6, NULL, 'Per Month'),
(21, 'W-06', '200sq m', 'Single room', 0, 3600, 'Rooms/room6_ORu0vYp.jpeg', '2023-11-23 17:36:53.099390', '2023-11-24 13:58:29.643108', 6, NULL, 'Per Month');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_administrator`
--
ALTER TABLE `accounts_administrator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_customuser`
--
ALTER TABLE `accounts_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `accounts_customuser_groups`
--
ALTER TABLE `accounts_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  ADD KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_customuser_user_permissions`
--
ALTER TABLE `accounts_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `accounts_landlord`
--
ALTER TABLE `accounts_landlord`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_prospectivetenant`
--
ALTER TABLE `accounts_prospectivetenant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `rental_app_apartments`
--
ALTER TABLE `rental_app_apartments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apartment_name` (`apartment_name`),
  ADD KEY `rental_app_apartment_landlord_id_75e9ce50_fk_accounts_` (`landlord_id`);

--
-- Indexes for table `rental_app_booking_history`
--
ALTER TABLE `rental_app_booking_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rental_app_booking_h_user_id_2bf44900_fk_accounts_` (`user_id`),
  ADD KEY `rental_app_booking_h_room_id_ece31507_fk_rental_ap` (`room_id`);

--
-- Indexes for table `rental_app_page`
--
ALTER TABLE `rental_app_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rental_app_rooms`
--
ALTER TABLE `rental_app_rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rental_app_rooms_room_number_apartment_id_538a1433_uniq` (`room_number`,`apartment_id`),
  ADD KEY `rental_app_rooms_apartment_id_59d9b7c7_fk_rental_ap` (`apartment_id`),
  ADD KEY `rental_app_rooms_tenant_id_26d80a46_fk_accounts_` (`tenant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_administrator`
--
ALTER TABLE `accounts_administrator`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_customuser`
--
ALTER TABLE `accounts_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `accounts_customuser_groups`
--
ALTER TABLE `accounts_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_customuser_user_permissions`
--
ALTER TABLE `accounts_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_landlord`
--
ALTER TABLE `accounts_landlord`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `accounts_prospectivetenant`
--
ALTER TABLE `accounts_prospectivetenant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `rental_app_apartments`
--
ALTER TABLE `rental_app_apartments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rental_app_booking_history`
--
ALTER TABLE `rental_app_booking_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rental_app_page`
--
ALTER TABLE `rental_app_page`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rental_app_rooms`
--
ALTER TABLE `rental_app_rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_administrator`
--
ALTER TABLE `accounts_administrator`
  ADD CONSTRAINT `accounts_administrat_user_id_d91897b7_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `accounts_customuser_groups`
--
ALTER TABLE `accounts_customuser_groups`
  ADD CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `accounts_customuser_user_permissions`
--
ALTER TABLE `accounts_customuser_user_permissions`
  ADD CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `accounts_landlord`
--
ALTER TABLE `accounts_landlord`
  ADD CONSTRAINT `accounts_landlord_user_id_c95bb3a2_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `accounts_prospectivetenant`
--
ALTER TABLE `accounts_prospectivetenant`
  ADD CONSTRAINT `accounts_prospective_user_id_b7fe9301_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `rental_app_apartments`
--
ALTER TABLE `rental_app_apartments`
  ADD CONSTRAINT `rental_app_apartment_landlord_id_75e9ce50_fk_accounts_` FOREIGN KEY (`landlord_id`) REFERENCES `accounts_landlord` (`id`);

--
-- Constraints for table `rental_app_booking_history`
--
ALTER TABLE `rental_app_booking_history`
  ADD CONSTRAINT `rental_app_booking_h_room_id_ece31507_fk_rental_ap` FOREIGN KEY (`room_id`) REFERENCES `rental_app_rooms` (`id`),
  ADD CONSTRAINT `rental_app_booking_h_user_id_2bf44900_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_prospectivetenant` (`id`);

--
-- Constraints for table `rental_app_rooms`
--
ALTER TABLE `rental_app_rooms`
  ADD CONSTRAINT `rental_app_rooms_apartment_id_59d9b7c7_fk_rental_ap` FOREIGN KEY (`apartment_id`) REFERENCES `rental_app_apartments` (`id`),
  ADD CONSTRAINT `rental_app_rooms_tenant_id_26d80a46_fk_accounts_` FOREIGN KEY (`tenant_id`) REFERENCES `accounts_prospectivetenant` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
