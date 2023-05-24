-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2023 at 03:32 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larave_ui_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'AnalAdmin', 'admin@gmail.com', '$2y$10$eCm6N.cEbOLFjOLHsVVvg.4249X.3AVd7KfwbWCkbqhtBnMGWUE1C', '2023-05-02 16:38:36', '2023-05-02 16:38:36');

-- --------------------------------------------------------

--
-- Stand-in structure for view `alldrives`
-- (See below for the actual view)
--
CREATE TABLE `alldrives` (
`UserID` bigint(20)
,`NameUser` varchar(255)
,`Email` varchar(255)
,`drivesID` bigint(20) unsigned
,`title` varchar(255)
,`description` varchar(300)
,`DriveFile` text
,`state` varchar(50)
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `drives`
--

CREATE TABLE `drives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(300) NOT NULL,
  `file` text NOT NULL,
  `UserID` bigint(20) NOT NULL,
  `state` varchar(50) NOT NULL DEFAULT 'privete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drives`
--

INSERT INTO `drives` (`id`, `title`, `description`, `file`, `UserID`, `state`, `created_at`, `updated_at`) VALUES
(17, 'File_2', 'File_2Description', '1683147192FB_IMG_1654107501531.jpg', 1, 'public', '2023-05-03 17:53:12', '2023-05-04 07:58:44'),
(18, 'file3', 'File3Description', '1683198141FB_IMG_1653846630952.jpg', 1, 'privete', '2023-05-04 08:02:21', '2023-05-04 08:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_02_202531_create_drives_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('moham05871@gmail.com', '$2y$10$U8Eap3Zf1G/7OAjKeb.Ws.W8fE8bb.XDYfEeczzxI2trF8cNh36CW', '2023-05-06 16:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `userjoindrive`
-- (See below for the actual view)
--
CREATE TABLE `userjoindrive` (
`UserID` bigint(20)
,`NameUser` varchar(255)
,`Email` varchar(255)
,`drivesID` bigint(20) unsigned
,`title` varchar(255)
,`description` varchar(300)
,`DriveFile` text
,`state` varchar(50)
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rule` int(11) NOT NULL DEFAULT 2,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `rule`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'abdo', 'ex@gmail.com', 1, NULL, '$2y$10$eCm6N.cEbOLFjOLHsVVvg.4249X.3AVd7KfwbWCkbqhtBnMGWUE1C', NULL, '2023-05-02 16:38:36', '2023-05-02 16:38:36'),
(2, 'mohamed', 'ex2@gmail.com', 2, NULL, '$2y$10$cGYzEskPv/hTOG8rfelwM.2Rtp.xe3RXEnWPvMbrP7CSmRzsSQJVe', NULL, '2023-05-03 16:09:40', '2023-05-03 16:09:40'),
(3, 'testUser', 'ex56@gmail.com', 2, NULL, '$2y$10$PtgqPFo0stWESdrO.otQMuZLK124ss9ugIHP/YTUdLMhwPCzVb.fi', NULL, '2023-05-06 16:46:03', '2023-05-06 16:46:03'),
(4, 'gchnb', 'ehx@gmail.com', 3, NULL, '$2y$10$uYCN.F9Mf2LNyaRg8SNXPuoMqVWEYGDJhSmjoblmE0IKNvFCzxiza', NULL, '2023-05-06 16:47:07', '2023-05-06 16:47:07'),
(5, 'hjgfd', 'moham05871@gmail.com', 3, NULL, '$2y$10$kfg6OmgUjLaabOpvDSOGuunXEZrLRjEkPRB5UrARPYhbKs0xsmwvu', NULL, '2023-05-06 16:57:20', '2023-05-06 16:57:20');

-- --------------------------------------------------------

--
-- Structure for view `alldrives`
--
DROP TABLE IF EXISTS `alldrives`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `alldrives`  AS SELECT `users`.`id` AS `UserID`, `users`.`name` AS `NameUser`, `users`.`email` AS `Email`, `drives`.`id` AS `drivesID`, `drives`.`title` AS `title`, `drives`.`description` AS `description`, `drives`.`file` AS `DriveFile`, `drives`.`state` AS `state`, `drives`.`updated_at` AS `updated_at` FROM (`drives` join `users` on(`users`.`id` = `drives`.`UserID`))  ;

-- --------------------------------------------------------

--
-- Structure for view `userjoindrive`
--
DROP TABLE IF EXISTS `userjoindrive`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userjoindrive`  AS SELECT `users`.`id` AS `UserID`, `users`.`name` AS `NameUser`, `users`.`email` AS `Email`, `drives`.`id` AS `drivesID`, `drives`.`title` AS `title`, `drives`.`description` AS `description`, `drives`.`file` AS `DriveFile`, `drives`.`state` AS `state`, `drives`.`updated_at` AS `updated_at` FROM (`drives` join `users` on(`users`.`id` = `drives`.`UserID`)) WHERE `drives`.`state` = 'public''public'  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drives`
--
ALTER TABLE `drives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drives`
--
ALTER TABLE `drives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drives`
--
ALTER TABLE `drives`
  ADD CONSTRAINT `drives_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
