-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 29, 2024 at 02:26 AM
-- Server version: 5.7.33
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_lilasia`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_08_27_114848_create_personal_access_tokens_table', 1),
(5, '2024_08_27_115549_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'def6b80b4e4708020025dde4dd11ae895559ca36b8e31a2c30eab830657cb94d', '[\"*\"]', NULL, NULL, '2024-08-27 06:42:30', '2024-08-27 06:42:30'),
(2, 'App\\Models\\User', 1, 'auth_token', '6771f86224a1865b7ac6cb873283d606c8d5ad5ebc5b2db48a459f5c94df6ff3', '[\"*\"]', NULL, NULL, '2024-08-27 06:42:47', '2024-08-27 06:42:47'),
(3, 'App\\Models\\User', 1, 'auth_token', '370675a678d02b4d33e694268e1ef885f4e109047eb6946268c4d26f0ec31545', '[\"*\"]', NULL, NULL, '2024-08-27 06:44:26', '2024-08-27 06:44:26'),
(4, 'App\\Models\\User', 1, 'auth_token', '25b07abd0d76aa82f3e39c30abacd2c70c6eda8f979ed188c724c58c82b0eb92', '[\"*\"]', '2024-08-27 07:19:55', NULL, '2024-08-27 06:44:58', '2024-08-27 07:19:55'),
(5, 'App\\Models\\User', 1, 'auth_token', 'f058a74e6871cad4904947660ad7ffd202282820f5790661f60fa018d2fc27c7', '[\"*\"]', '2024-08-27 21:42:05', NULL, '2024-08-27 06:46:05', '2024-08-27 21:42:05'),
(6, 'App\\Models\\User', 1, 'auth_token', '24bf975a23b1a408cebb0f6e7cec26a44b59add8eab31b62f732b65f3cd0f3f0', '[\"*\"]', '2024-08-27 07:21:41', NULL, '2024-08-27 07:20:14', '2024-08-27 07:21:41'),
(7, 'App\\Models\\User', 1, 'auth_token', '019c1eb89dd7412311a5aa7a401c3202303645a7b22466f5cb0cb5e5c97586d4', '[\"*\"]', '2024-08-27 18:31:59', NULL, '2024-08-27 07:23:54', '2024-08-27 18:31:59'),
(8, 'App\\Models\\User', 1, 'auth_token', '31973bd983de6fc3bc0a6d11e7e2459a79ade5ce5bb5dac5b6fda92b6db1e4a5', '[\"*\"]', NULL, NULL, '2024-08-27 07:48:12', '2024-08-27 07:48:12'),
(9, 'App\\Models\\User', 1, 'auth_token', '401a6fa50d7a1310630d303d119a95396519f74558b6f3e738780a18b641cadc', '[\"*\"]', '2024-08-27 19:05:09', NULL, '2024-08-27 18:41:00', '2024-08-27 19:05:09'),
(10, 'App\\Models\\User', 1, 'auth_token', 'fd10bb3798c54e7ed8df2064e1e9cfe313df8fe37bc0dab1e4e25d8f4811fb27', '[\"*\"]', NULL, NULL, '2024-08-27 19:02:26', '2024-08-27 19:02:26'),
(11, 'App\\Models\\User', 1, 'auth_token', '3edaa87e059128eaffd279fa3d320440faba2827dcf97fecc2b8b2520d6c6ebe', '[\"*\"]', '2024-08-27 19:11:23', NULL, '2024-08-27 19:11:11', '2024-08-27 19:11:23'),
(12, 'App\\Models\\User', 1, 'auth_token', '069de254dbebb65140fae48abac5cbc6cd1122769c710bc055e24aad04446ca6', '[\"*\"]', '2024-08-27 19:12:44', NULL, '2024-08-27 19:12:25', '2024-08-27 19:12:44'),
(13, 'App\\Models\\User', 1, 'auth_token', '3eeeab06e8ba85f1cfbd5942c42362819c5e4f0ba6aa2de319151b396a52f3d9', '[\"*\"]', '2024-08-27 19:16:21', NULL, '2024-08-27 19:14:56', '2024-08-27 19:16:21'),
(14, 'App\\Models\\User', 1, 'auth_token', '74747bee005cc9cdc4dcd7ce1cd07ab12d1f3e996ced465a42ef185d792bde1b', '[\"*\"]', '2024-08-27 19:16:46', NULL, '2024-08-27 19:16:31', '2024-08-27 19:16:46'),
(15, 'App\\Models\\User', 1, 'auth_token', '15becb155f98854cf7148a2edb227804c62bff744fec36dd29500037bcc8560e', '[\"*\"]', '2024-08-27 19:19:50', NULL, '2024-08-27 19:19:39', '2024-08-27 19:19:50'),
(16, 'App\\Models\\User', 1, 'auth_token', 'cd77fbb92cfd26d5c445eb1206427fd93033e9206effd89faa170d47118c4dc6', '[\"*\"]', '2024-08-27 19:24:29', NULL, '2024-08-27 19:24:28', '2024-08-27 19:24:29'),
(17, 'App\\Models\\User', 1, 'auth_token', 'aecff582c8a2ce230465195aa43dc188fc8069c56e303a0fdfdc5701decdc874', '[\"*\"]', '2024-08-27 19:36:10', NULL, '2024-08-27 19:25:07', '2024-08-27 19:36:10'),
(18, 'App\\Models\\User', 1, 'auth_token', 'acd18df3cb6ff97b285516b01d32a67bd4b46a6d5a49064e11a6d94d06fd0f2c', '[\"*\"]', '2024-08-27 19:36:17', NULL, '2024-08-27 19:36:16', '2024-08-27 19:36:17'),
(19, 'App\\Models\\User', 1, 'auth_token', '76f38f48af95e6a21157c3d8821d35fd4944bf7da791e60e4d670c9d54c23156', '[\"*\"]', '2024-08-27 19:45:16', NULL, '2024-08-27 19:37:31', '2024-08-27 19:45:16'),
(20, 'App\\Models\\User', 1, 'auth_token', '44e79a918947ad3df65a19fa9028277c07b6494eaf786b29ca324a4eb8f27782', '[\"*\"]', NULL, NULL, '2024-08-27 19:49:48', '2024-08-27 19:49:48'),
(21, 'App\\Models\\User', 1, 'auth_token', 'da975e08e39f94cfe6747b8d67751ec218f86b4aaf107b304c463f0ddc56592f', '[\"*\"]', '2024-08-27 19:50:55', NULL, '2024-08-27 19:50:54', '2024-08-27 19:50:55'),
(22, 'App\\Models\\User', 1, 'auth_token', 'fb2e468b5f2a1fad37af1fb1ebb23d322190e7e32075d34f831e21455ae2d48e', '[\"*\"]', '2024-08-27 19:51:34', NULL, '2024-08-27 19:51:33', '2024-08-27 19:51:34'),
(23, 'App\\Models\\User', 1, 'auth_token', 'e1cb88915303de0b2696ce2ed0988a0ca528526f5a97ae6f59ca0b0e52850596', '[\"*\"]', '2024-08-27 19:53:32', NULL, '2024-08-27 19:53:30', '2024-08-27 19:53:32'),
(24, 'App\\Models\\User', 1, 'auth_token', 'f9782388d67771e2fd9c2a42c8bbe3faa4d02da31732c0e1eb4c49a78cee0032', '[\"*\"]', '2024-08-27 19:56:59', NULL, '2024-08-27 19:56:59', '2024-08-27 19:56:59'),
(25, 'App\\Models\\User', 1, 'auth_token', '877c0b0aaaa305e14f953ef5d77a9f1c01de0607c884471438ddf57e13c75f76', '[\"*\"]', '2024-08-28 02:43:04', NULL, '2024-08-27 19:59:10', '2024-08-28 02:43:04'),
(26, 'App\\Models\\User', 2, 'auth_token', '113d22e8d7e59b13ac3e235a2622358d37f583c31f71f8fd656a9037d5ed9979', '[\"*\"]', '2024-08-28 19:22:49', NULL, '2024-08-28 02:43:48', '2024-08-28 19:22:49'),
(27, 'App\\Models\\User', 2, 'auth_token', '9deba7b2770b9b4da06b2258a18169636cacd6095c0befb89e5d217f11d41931', '[\"*\"]', '2024-08-28 02:46:06', NULL, '2024-08-28 02:45:05', '2024-08-28 02:46:06'),
(28, 'App\\Models\\User', 1, 'auth_token', '43f6300ef87a26f5f3a92ba8c284e6fc9f9a92d572eae0d4e62b7b11e8aec11d', '[\"*\"]', '2024-08-28 19:23:09', NULL, '2024-08-28 19:23:08', '2024-08-28 19:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category`, `image`, `created_at`, `updated_at`) VALUES
(5, 'Product 12', 'This is a description of Product 1', 10000, 'Category 1', 'products/3JXv9kl0fXO1Fq7jZf1R2LiYaz2n1tYPamKrbSji.jpg', '2024-08-27 06:47:15', '2024-08-27 06:47:15'),
(7, 'Updated Product 12345', 'This is an updated description of Product 1', 120, 'Updated Category 1', 'products/qAbCnpDZnV3WIdnYUQp5cqYKXqtPq3qxTXCvOPe7.jpg', '2024-08-27 20:47:16', '2024-08-28 01:43:26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vPRWkEf4eAzyDK0Kxlu3fDOlkhyXHSzrqivVzzQX', NULL, '127.0.0.1', 'PostmanRuntime/7.40.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUxOdldqNW9HYzR5bnB1UmQ4akt4SU1Hb251b0NCblN2VTg3bXBiWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1724766102);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Denis Setiawan', 'denis1@example.com', NULL, '$2y$12$m66ZtltxrSs94RGN2NumHOGi9JvZE.HxAqyajnukpnsMo5uPRsgOG', 'admin', NULL, '2024-08-27 06:42:12', '2024-08-27 06:42:12'),
(2, 'Denis Setiawan', 'denis@example.com', NULL, '$2y$12$BwuMkCxo80tJDzro7adic.vMoAwKGD0sbifonPslA/7F6Mx8ArjZ2', 'user', NULL, '2024-08-28 02:43:41', '2024-08-28 02:43:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
