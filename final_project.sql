-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2023 at 02:42 PM
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
(1, 'pbkdf2_sha256$260000$GEmn9H96XTfmHdbKLzA0N3$FPdR1HenmovJHSDfJAqzmcvJkYAER8muWgElHXh0NRk=', '2023-11-21 11:15:50.276927', 1, '', 'test@test.com', '', '', '', 'Administrator', '', 1, 1, '2023-11-20 15:39:36.421088'),
(2, 'pbkdf2_sha256$260000$uu4yqa2I2IG1vdzVYuENrC$TFyhi5JdQ5ZKLpA+XRoApIYv0M2V7ZYcbmI5aiY3VK0=', NULL, 0, 'JosephA', 'indiekj@gmail.com', '', 'Male', 'JOSEPH Omuya INDIEKA', 'Landlord', '0758 053542', 0, 0, '2023-11-20 15:39:56.809333'),
(6, 'pbkdf2_sha256$260000$kNj0pXLrZdVz6gU3lrUP3i$uijOA1FMospjWAJzIIPkuRJK+/8FsFY2TDHGjVI7JCQ=', NULL, 0, 'Joseph900', 'indikj@gmail.com', '', 'Male', 'JOSEPH INDIEKA', 'Landlord', '0758 053540', 0, 0, '2023-11-20 16:01:02.117638'),
(7, 'pbkdf2_sha256$260000$zuDtq2YZKIdq1dRfa3iWzW$xyJI1j5Egib0R8K2xNg2BX4VYQfR75gDNN2oXy1rSOI=', NULL, 0, 'JosephI', 'j@gmail.com', '', 'Male', 'JOSEPH Alin', 'Landlord', '0758 053500', 1, 0, '2023-11-20 16:09:18.974819'),
(8, 'pbkdf2_sha256$260000$id7YWsGvBB6fgnEq9bdRHt$LYzEIbC+FsIC4WgnSU7gV0vqENyD3jLP7N/jZ2xdOSU=', '2023-11-21 13:14:43.963683', 0, 'manu', 'manu@mail.com', '', 'Female', 'manu manu', 'Landlord', '0758 050012', 1, 0, '2023-11-21 12:03:48.171001');

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
(2, NULL, 'default.png', 2),
(6, NULL, 'default.png', 6),
(7, NULL, 'default.png', 7),
(8, NULL, 'default.png', 8);

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
(1, '', 'profile/20220313_124409_2.jpg', 7);

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
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add content type', 3, 'add_contenttype'),
(10, 'Can change content type', 3, 'change_contenttype'),
(11, 'Can delete content type', 3, 'delete_contenttype'),
(12, 'Can view content type', 3, 'view_contenttype'),
(13, 'Can add User', 4, 'add_customuser'),
(14, 'Can change User', 4, 'change_customuser'),
(15, 'Can delete User', 4, 'delete_customuser'),
(16, 'Can view User', 4, 'view_customuser'),
(17, 'Can add prospectivetenant', 5, 'add_prospectivetenant'),
(18, 'Can change prospectivetenant', 5, 'change_prospectivetenant'),
(19, 'Can delete prospectivetenant', 5, 'delete_prospectivetenant'),
(20, 'Can view prospectivetenant', 5, 'view_prospectivetenant'),
(21, 'Can add landlord', 6, 'add_landlord'),
(22, 'Can change landlord', 6, 'change_landlord'),
(23, 'Can delete landlord', 6, 'delete_landlord'),
(24, 'Can view landlord', 6, 'view_landlord'),
(25, 'Can add administrator', 7, 'add_administrator'),
(26, 'Can change administrator', 7, 'change_administrator'),
(27, 'Can delete administrator', 7, 'delete_administrator'),
(28, 'Can view administrator', 7, 'view_administrator'),
(29, 'Can add log entry', 8, 'add_logentry'),
(30, 'Can change log entry', 8, 'change_logentry'),
(31, 'Can delete log entry', 8, 'delete_logentry'),
(32, 'Can view log entry', 8, 'view_logentry'),
(33, 'Can add session', 9, 'add_session'),
(34, 'Can change session', 9, 'change_session'),
(35, 'Can delete session', 9, 'delete_session'),
(36, 'Can view session', 9, 'view_session'),
(37, 'Can add room', 10, 'add_rooms'),
(38, 'Can change room', 10, 'change_rooms'),
(39, 'Can delete room', 10, 'delete_rooms'),
(40, 'Can view room', 10, 'view_rooms'),
(41, 'Can add Apartment', 11, 'add_apartments'),
(42, 'Can change Apartment', 11, 'change_apartments'),
(43, 'Can delete Apartment', 11, 'delete_apartments'),
(44, 'Can view Apartment', 11, 'view_apartments');

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
(1, '2023-11-20 15:45:19.624435', '2', 'indiekj@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Role\"]}}]', 4, 1),
(2, '2023-11-20 15:46:12.844819', '2', 'indiekj@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Role\"]}}]', 4, 1),
(3, '2023-11-20 16:00:19.925182', '4', 'indikj@gmail.com', 3, '', 4, 1),
(4, '2023-11-20 16:00:57.510241', '5', 'indikj@gmail.com', 3, '', 4, 1),
(5, '2023-11-20 16:15:22.535265', '1', 'JosephI', 1, '[{\"added\": {}}]', 5, 1);

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
(7, 'accounts', 'administrator'),
(4, 'accounts', 'customuser'),
(6, 'accounts', 'landlord'),
(5, 'accounts', 'prospectivetenant'),
(8, 'admin', 'logentry'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'contenttypes', 'contenttype'),
(11, 'rental_app', 'apartments'),
(10, 'rental_app', 'rooms'),
(9, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2023-11-20 15:35:44.283813'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-11-20 15:35:44.480901'),
(3, 'auth', '0001_initial', '2023-11-20 15:35:44.775096'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-11-20 15:35:44.886755'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-11-20 15:35:44.886755'),
(6, 'auth', '0004_alter_user_username_opts', '2023-11-20 15:35:44.910781'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-11-20 15:35:44.919850'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-11-20 15:35:44.922846'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-11-20 15:35:44.925309'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-11-20 15:35:44.938220'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-11-20 15:35:44.938220'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-11-20 15:35:44.959864'),
(13, 'auth', '0011_update_proxy_permissions', '2023-11-20 15:35:44.971031'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-11-20 15:35:44.987523'),
(15, 'accounts', '0001_initial', '2023-11-20 15:35:46.339208'),
(16, 'admin', '0001_initial', '2023-11-20 15:36:23.935409'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-11-20 15:36:23.938917'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-20 15:36:23.956861'),
(19, 'rental_app', '0001_initial', '2023-11-20 15:39:04.295359'),
(20, 'rental_app', '0002_delete_apartments2', '2023-11-20 15:39:04.310989'),
(21, 'sessions', '0001_initial', '2023-11-20 15:39:04.387310');

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
('21r9m7vkrfllavuzxpm83gckgz0b0zfr', '.eJxVjMsOwiAQRf-FtSE8phRcuvcbCMxMpGogKe3K-O9K0oVu7znnvkRM-1bi3nmNC4mz0OL0u-WED64D0D3VW5PY6rYuWQ5FHrTLayN-Xg7376CkXkZN3uCEqJHRO2-ycgkhqOwteFQBNH8NsCEYwuBmo1UGQzyDnVizFe8P50E3dA:1r56Nh:8ff0b_vH4Mg4EZwlSGrZpiYNbjtnvntMytUC7RQBrOo', '2023-12-04 15:40:13.661065'),
('3nnj24koxfxbbyphdcyidqbpvzmd7ou0', '.eJxVjMsOwiAQRf-FtSF0KI-6dO83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJn4cXpdyOMD647SHestyZjq-syk9wVedAury3x83K4fwcFe_nWllV0nnKknKNhYjd4YG0mp7waQWeLdtATapUBXDSJcATPCQh8RrDi_QH-jjg2:1r5QaR:-LumMl17xfGai_SqDecjNbONjhAnhGZRh8sJBnuMtLs', '2023-12-05 13:14:43.967263'),
('tgd9494yviop9q9muly5www7mr486nrd', '.eJxVjMsOwiAQRf-FtSE8phRcuvcbCMxMpGogKe3K-O9K0oVu7znnvkRM-1bi3nmNC4mz0OL0u-WED64D0D3VW5PY6rYuWQ5FHrTLayN-Xg7376CkXkZN3uCEqJHRO2-ycgkhqOwteFQBNH8NsCEYwuBmo1UGQzyDnVizFe8P50E3dA:1r5OjO:iG1gWJY5UdYNkTXF8ZlzKqRMm-bjSDdmxOqyT-obF4o', '2023-12-05 11:15:50.279826');

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
  `date_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `apartment_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  ADD UNIQUE KEY `apartment_name` (`apartment_name`);

--
-- Indexes for table `rental_app_rooms`
--
ALTER TABLE `rental_app_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rental_app_rooms_apartment_id_59d9b7c7_fk_rental_ap` (`apartment_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `accounts_prospectivetenant`
--
ALTER TABLE `accounts_prospectivetenant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `rental_app_apartments`
--
ALTER TABLE `rental_app_apartments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_app_rooms`
--
ALTER TABLE `rental_app_rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `rental_app_rooms`
--
ALTER TABLE `rental_app_rooms`
  ADD CONSTRAINT `rental_app_rooms_apartment_id_59d9b7c7_fk_rental_ap` FOREIGN KEY (`apartment_id`) REFERENCES `rental_app_apartments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
