-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3309
-- Generation Time: Sep 13, 2025 at 01:21 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsletterrobenhood`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `full_name`, `password`, `created_at`) VALUES
(1, 'admin', 'Kushal Kamble', '$2y$10$z0PgXNPc8MX1pWU25AKzjuMuplf.41EMJwUP5C9uNHVUDsGPWKz6W', '2025-08-11 06:54:42'),
(2, 'kushal_admin', 'Kushal Kamble Dev', '$2y$10$gOSTb.YLX2VLiWgPYnVfS.EU5jRA8hSItUTiEv008ZnIp5OX/L7Ii', '2025-09-13 07:07:52'),
(3, 'Vishal', 'Vishal Kamble', '$2y$10$TrywRtTG4wkw7pLwjMi6Je0caXfBl01EgMgDtHH8fpU1M.xmfEPfO', '2025-09-13 07:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `created_at`) VALUES
(1, 'This weeks insights', 'this-weeks-insights', NULL, '2025-08-28 07:39:01'),
(2, 'Quick bytes', 'quick-bytes', NULL, '2025-08-28 07:39:01'),
(3, 'AI tip of the week', 'ai-tip-week', NULL, '2025-08-28 07:39:01'),
(4, 'Toolbox', 'toolbox', NULL, '2025-08-28 07:39:01'),
(5, 'Market news', 'market-news', NULL, '2025-08-28 07:39:01'),
(6, 'Wellnessbyte', 'wellnessbyte', NULL, '2025-08-28 07:39:01'),
(7, 'Quote of the day', 'quote-of-the-day', NULL, '2025-08-28 07:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `component_master`
--

CREATE TABLE `component_master` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_type` enum('text','image','video','link','mixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_in` tinyint(1) DEFAULT 0,
  `used_in_post_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `media_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('draft','published') COLLATE utf8mb4_unicode_ci DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `component_master`
--

INSERT INTO `component_master` (`id`, `category_id`, `title`, `subcategory`, `content_type`, `content`, `used_in`, `used_in_post_id`, `created_at`, `updated_at`, `media_file`, `status`) VALUES
(4, 1, 'Sample Insight KUSHAL', 'Sample Insight', 'text', 'TEST KAMBLE', 1, NULL, '2025-08-29 09:19:08', '2025-08-29 09:33:27', NULL, 'draft');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_logs`
--

CREATE TABLE `newsletter_logs` (
  `id` int(11) NOT NULL,
  `newsletter_id` int(11) DEFAULT NULL,
  `subscriber_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('sent','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `error_msg` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter_logs`
--

INSERT INTO `newsletter_logs` (`id`, `newsletter_id`, `subscriber_email`, `status`, `error_msg`, `sent_at`) VALUES
(3, 4, 'kushal.kamble@mitsde.com', 'sent', NULL, '2025-09-13 11:19:58'),
(4, 4, 'kushal.kamble1806@gmail.com', 'sent', NULL, '2025-09-13 11:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_master`
--

CREATE TABLE `newsletter_master` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`links`)),
  `multi_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`multi_content`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `scheduled_at` datetime DEFAULT NULL,
  `sent_status` enum('pending','sent','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter_master`
--

INSERT INTO `newsletter_master` (`id`, `title`, `category_id`, `subcategory`, `editor_content`, `image`, `video`, `links`, `multi_content`, `created_at`, `updated_at`, `scheduled_at`, `sent_status`) VALUES
(4, 'abc', 1, 't1', '<p><strong>This Week&rsquo;s Insights</strong></p>\r\n\r\n<p><strong>🚀 Fresh Perspectives for Your Week<br />\r\n✅ Discover trending topics shaping tech and business.<br />\r\n✅ Deep dives into industry shifts and upcoming opportunities.<br />\r\n✅ Actionable strategies to stay ahead of the curve.<br />\r\n🎯 A quick, powerful read to boost your decision-making.</strong></p>\r\n', 'https://chsculture.org/wp-content/uploads/2021/12/Newsletter.png', 'https://youtube.com/shorts/n2J2fJy2GRM?si=vZ9NvtKDpniGVq2R', NULL, '{\"this_weeks_insights\":{\"label\":\"This Week\\u2019s Insights\",\"category_id\":1,\"subcategory\":\"t1\",\"content\":\"<p><strong>This Week&rsquo;s Insights</strong></p>\\r\\n\\r\\n<p><strong>\\ud83d\\ude80 Fresh Perspectives for Your Week<br />\\r\\n\\u2705 Discover trending topics shaping tech and business.<br />\\r\\n\\u2705 Deep dives into industry shifts and upcoming opportunities.<br />\\r\\n\\u2705 Actionable strategies to stay ahead of the curve.<br />\\r\\n\\ud83c\\udfaf A quick, powerful read to boost your decision-making.</strong></p>\\r\\n\",\"post_id\":12,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=12\"},\"quick_bytes\":{\"label\":\"Quick Bytes\",\"category_id\":2,\"subcategory\":\"q1\",\"content\":\"<p>This Week&rsquo;s Insights</p>\\r\\n\\r\\n<p>\\ud83d\\ude80 Fresh Perspectives for Your Week<br />\\r\\n\\u2705 Discover trending topics shaping tech and business.<br />\\r\\n\\u2705 Deep dives into industry shifts and upcoming opportunities.<br />\\r\\n\\u2705 Actionable strategies to stay ahead of the curve.<br />\\r\\n\\ud83c\\udfaf A quick, powerful read to boost your decision-making.</p>\\r\\n\",\"post_id\":10,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=10\"},\"ai_tip\":{\"label\":\"AI Tip of the Week\",\"category_id\":3,\"subcategory\":\"a1\",\"content\":\"<p>This Week&rsquo;s Insights</p>\\r\\n\\r\\n<p>\\ud83d\\ude80 Fresh Perspectives for Your Week<br />\\r\\n\\u2705 Discover trending topics shaping tech and business.<br />\\r\\n\\u2705 Deep dives into industry shifts and upcoming opportunities.<br />\\r\\n\\u2705 Actionable strategies to stay ahead of the curve.<br />\\r\\n\\ud83c\\udfaf A quick, powerful read to boost your decision-making.</p>\\r\\n\",\"post_id\":8,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=8\"},\"toolbox\":{\"label\":\"Toolbox\",\"category_id\":4,\"subcategory\":\"too1\",\"content\":\"<p>This Week&rsquo;s Insights</p>\\r\\n\\r\\n<p>\\ud83d\\ude80 Fresh Perspectives for Your Week<br />\\r\\n\\u2705 Discover trending topics shaping tech and business.<br />\\r\\n\\u2705 Deep dives into industry shifts and upcoming opportunities.<br />\\r\\n\\u2705 Actionable strategies to stay ahead of the curve.<br />\\r\\n\\ud83c\\udfaf A quick, powerful read to boost your decision-making.</p>\\r\\n\",\"post_id\":13,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=13\"},\"market_news\":{\"label\":\"Market News\",\"category_id\":5,\"subcategory\":\"m1\",\"content\":\"<p>This Week&rsquo;s Insights</p>\\r\\n\\r\\n<p>\\ud83d\\ude80 Fresh Perspectives for Your Week<br />\\r\\n\\u2705 Discover trending topics shaping tech and business.<br />\\r\\n\\u2705 Deep dives into industry shifts and upcoming opportunities.<br />\\r\\n\\u2705 Actionable strategies to stay ahead of the curve.<br />\\r\\n\\ud83c\\udfaf A quick, powerful read to boost your decision-making.</p>\\r\\n\",\"post_id\":9,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=9\"},\"wellnessbyte\":{\"label\":\"Wellnessbyte\",\"category_id\":6,\"subcategory\":\"we1\",\"content\":\"<p>This Week&rsquo;s Insights</p>\\r\\n\\r\\n<p>\\ud83d\\ude80 Fresh Perspectives for Your Week<br />\\r\\n\\u2705 Discover trending topics shaping tech and business.<br />\\r\\n\\u2705 Deep dives into industry shifts and upcoming opportunities.<br />\\r\\n\\u2705 Actionable strategies to stay ahead of the curve.<br />\\r\\n\\ud83c\\udfaf A quick, powerful read to boost your decision-making.</p>\\r\\n\",\"post_id\":14,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=14\"},\"quote_of_the_day\":{\"label\":\"Quote of the Day\",\"category_id\":7,\"subcategory\":\"qu1\",\"content\":\"<p>This Week&rsquo;s Insights</p>\\r\\n\\r\\n<p>\\ud83d\\ude80 Fresh Perspectives for Your Week<br />\\r\\n\\u2705 Discover trending topics shaping tech and business.<br />\\r\\n\\u2705 Deep dives into industry shifts and upcoming opportunities.<br />\\r\\n\\u2705 Actionable strategies to stay ahead of the curve.<br />\\r\\n\\ud83c\\udfaf A quick, powerful read to boost your decision-making.</p>\\r\\n\",\"post_id\":11,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=11\"}}', '2025-09-13 11:19:51', '2025-09-13 11:20:05', NULL, 'sent');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_date` date DEFAULT curdate(),
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_media` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`links`)),
  `component_id` int(11) DEFAULT NULL,
  `status` enum('draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `post_date`, `author_id`, `category_id`, `subcategory`, `main_media`, `links`, `component_id`, `status`, `created_at`, `updated_at`) VALUES
(8, 'ai', '<h3><strong>This This Week Insights &nbsp;saturday volumn 11</strong></h3>\r\n\r\n<p>🚀&nbsp;<strong>Fresh Perspectives for Your Week</strong></p>\r\n\r\n<p>In today&rsquo;s fast-moving world, staying ahead means understanding the shifts that drive technology, business, and innovation.&nbsp;<em>This Week&rsquo;s Insights</em>&nbsp;is your trusted source for decoding these changes and turning information into opportunity. Each edition is carefully curated to bring you meaningful updates and strategies you can act on right away.</p>\r\n\r\n<p><strong>📈 Stay Ahead of the Trends</strong></p>\r\n\r\n<ul>\r\n	<li>✅ Key updates from finance, startups, and technology.</li>\r\n	<li>✅ Simplified analysis for quick understanding.</li>\r\n	<li>✅ Charts 📊 and snapshots that reveal the bigger picture.</li>\r\n	<li>🎯 Stay informed to make smarter moves.</li>\r\n</ul>\r\n\r\n<p>✅&nbsp;<strong>Discover Emerging Trends Shaping Industries Worldwide</strong></p>\r\n', '2025-09-13', 1, 3, 'a1', '1757762124_image1.jpg', NULL, NULL, 'published', '2025-09-13 11:15:24', NULL),
(9, 'm1', '<h3><strong>This This Week Insights &nbsp;saturday volumn 11</strong></h3>\r\n\r\n<p>🚀&nbsp;<strong>Fresh Perspectives for Your Week</strong></p>\r\n\r\n<p>In today&rsquo;s fast-moving world, staying ahead means understanding the shifts that drive technology, business, and innovation.&nbsp;<em>This Week&rsquo;s Insights</em>&nbsp;is your trusted source for decoding these changes and turning information into opportunity. Each edition is carefully curated to bring you meaningful updates and strategies you can act on right away.</p>\r\n\r\n<p><strong>📈 Stay Ahead of the Trends</strong></p>\r\n\r\n<ul>\r\n	<li>✅ Key updates from finance, startups, and technology.</li>\r\n	<li>✅ Simplified analysis for quick understanding.</li>\r\n	<li>✅ Charts 📊 and snapshots that reveal the bigger picture.</li>\r\n	<li>🎯 Stay informed to make smarter moves.</li>\r\n</ul>\r\n\r\n<p>✅&nbsp;<strong>Discover Emerging Trends Shaping Industries Worldwide</strong></p>\r\n', '2025-09-13', 1, 5, 'm1', '1757762141_image2.jpg', NULL, NULL, 'published', '2025-09-13 11:15:41', NULL),
(10, 'q1', '<h3><strong>This This Week Insights &nbsp;saturday volumn 11</strong></h3>\r\n\r\n<p>🚀&nbsp;<strong>Fresh Perspectives for Your Week</strong></p>\r\n\r\n<p>In today&rsquo;s fast-moving world, staying ahead means understanding the shifts that drive technology, business, and innovation.&nbsp;<em>This Week&rsquo;s Insights</em>&nbsp;is your trusted source for decoding these changes and turning information into opportunity. Each edition is carefully curated to bring you meaningful updates and strategies you can act on right away.</p>\r\n\r\n<p><strong>📈 Stay Ahead of the Trends</strong></p>\r\n\r\n<ul>\r\n	<li>✅ Key updates from finance, startups, and technology.</li>\r\n	<li>✅ Simplified analysis for quick understanding.</li>\r\n	<li>✅ Charts 📊 and snapshots that reveal the bigger picture.</li>\r\n	<li>🎯 Stay informed to make smarter moves.</li>\r\n</ul>\r\n\r\n<p>✅&nbsp;<strong>Discover Emerging Trends Shaping Industries Worldwide</strong></p>\r\n', '2025-09-13', 1, 2, 'q1', '1757762158_image3.jpg', NULL, NULL, 'published', '2025-09-13 11:15:58', NULL),
(11, 'qu1', '<h3><strong>This This Week Insights &nbsp;saturday volumn 11</strong></h3>\r\n\r\n<p>🚀&nbsp;<strong>Fresh Perspectives for Your Week</strong></p>\r\n\r\n<p>In today&rsquo;s fast-moving world, staying ahead means understanding the shifts that drive technology, business, and innovation.&nbsp;<em>This Week&rsquo;s Insights</em>&nbsp;is your trusted source for decoding these changes and turning information into opportunity. Each edition is carefully curated to bring you meaningful updates and strategies you can act on right away.</p>\r\n\r\n<p><strong>📈 Stay Ahead of the Trends</strong></p>\r\n\r\n<ul>\r\n	<li>✅ Key updates from finance, startups, and technology.</li>\r\n	<li>✅ Simplified analysis for quick understanding.</li>\r\n	<li>✅ Charts 📊 and snapshots that reveal the bigger picture.</li>\r\n	<li>🎯 Stay informed to make smarter moves.</li>\r\n</ul>\r\n\r\n<p>✅&nbsp;<strong>Discover Emerging Trends Shaping Industries Worldwide</strong></p>\r\n', '2025-09-13', 1, 7, 'qu1', '1757762181_image1.jpg', NULL, NULL, 'published', '2025-09-13 11:16:21', NULL),
(12, 't1', '<h3><strong>This This Week Insights &nbsp;saturday volumn 11</strong></h3>\r\n\r\n<p>🚀&nbsp;<strong>Fresh Perspectives for Your Week</strong></p>\r\n\r\n<p>In today&rsquo;s fast-moving world, staying ahead means understanding the shifts that drive technology, business, and innovation.&nbsp;<em>This Week&rsquo;s Insights</em>&nbsp;is your trusted source for decoding these changes and turning information into opportunity. Each edition is carefully curated to bring you meaningful updates and strategies you can act on right away.</p>\r\n\r\n<p><strong>📈 Stay Ahead of the Trends</strong></p>\r\n\r\n<ul>\r\n	<li>✅ Key updates from finance, startups, and technology.</li>\r\n	<li>✅ Simplified analysis for quick understanding.</li>\r\n	<li>✅ Charts 📊 and snapshots that reveal the bigger picture.</li>\r\n	<li>🎯 Stay informed to make smarter moves.</li>\r\n</ul>\r\n\r\n<p>✅&nbsp;<strong>Discover Emerging Trends Shaping Industries Worldwide</strong></p>\r\n', '2025-09-13', 1, 1, 't1', '1757762201_image2.jpg', NULL, NULL, 'published', '2025-09-13 11:16:41', NULL),
(13, 'too1', '<h3><strong>This This Week Insights &nbsp;saturday volumn 11</strong></h3>\r\n\r\n<p>🚀&nbsp;<strong>Fresh Perspectives for Your Week</strong></p>\r\n\r\n<p>In today&rsquo;s fast-moving world, staying ahead means understanding the shifts that drive technology, business, and innovation.&nbsp;<em>This Week&rsquo;s Insights</em>&nbsp;is your trusted source for decoding these changes and turning information into opportunity. Each edition is carefully curated to bring you meaningful updates and strategies you can act on right away.</p>\r\n\r\n<p><strong>📈 Stay Ahead of the Trends</strong></p>\r\n\r\n<ul>\r\n	<li>✅ Key updates from finance, startups, and technology.</li>\r\n	<li>✅ Simplified analysis for quick understanding.</li>\r\n	<li>✅ Charts 📊 and snapshots that reveal the bigger picture.</li>\r\n	<li>🎯 Stay informed to make smarter moves.</li>\r\n</ul>\r\n\r\n<p>✅&nbsp;<strong>Discover Emerging Trends Shaping Industries Worldwide</strong></p>\r\n', '2025-09-13', 1, 4, 'too1', '1757762217_image1.jpg', NULL, NULL, 'published', '2025-09-13 11:16:57', NULL),
(14, 'we1', '<h3><strong>This This Week Insights &nbsp;saturday volumn 11</strong></h3>\r\n\r\n<p>🚀&nbsp;<strong>Fresh Perspectives for Your Week</strong></p>\r\n\r\n<p>In today&rsquo;s fast-moving world, staying ahead means understanding the shifts that drive technology, business, and innovation.&nbsp;<em>This Week&rsquo;s Insights</em>&nbsp;is your trusted source for decoding these changes and turning information into opportunity. Each edition is carefully curated to bring you meaningful updates and strategies you can act on right away.</p>\r\n\r\n<p><strong>📈 Stay Ahead of the Trends</strong></p>\r\n\r\n<ul>\r\n	<li>✅ Key updates from finance, startups, and technology.</li>\r\n	<li>✅ Simplified analysis for quick understanding.</li>\r\n	<li>✅ Charts 📊 and snapshots that reveal the bigger picture.</li>\r\n	<li>🎯 Stay informed to make smarter moves.</li>\r\n</ul>\r\n\r\n<p>✅&nbsp;<strong>Discover Emerging Trends Shaping Industries Worldwide</strong></p>\r\n', '2025-09-13', 1, 6, 'we1', '1757762233_image3.jpg', NULL, NULL, 'published', '2025-09-13 11:17:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `name`, `email`, `created_at`, `status`) VALUES
(1, 'Kushal Kamble', 'kushal.kamble@mitsde.com', '2025-08-28 08:55:59', 1),
(3, 'shahrukh khan', 'kushal.kamble1806@gmail.com', '2025-09-02 06:35:40', 1),
(4, 'akshay kumar', 'manager1@gmail.com', '2025-09-02 06:36:05', 0),
(6, 'Amitabh bacchan', 'amitabh@example.com', '2025-09-04 05:17:19', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_categories_slug` (`slug`);

--
-- Indexes for table `component_master`
--
ALTER TABLE `component_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_component_category` (`category_id`);

--
-- Indexes for table `newsletter_logs`
--
ALTER TABLE `newsletter_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_logs_newsletter` (`newsletter_id`),
  ADD KEY `idx_logs_subscriber_email` (`subscriber_email`);

--
-- Indexes for table `newsletter_master`
--
ALTER TABLE `newsletter_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nl_category` (`category_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_posts_author` (`author_id`),
  ADD KEY `idx_posts_category` (`category_id`),
  ADD KEY `idx_posts_component` (`component_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `component_master`
--
ALTER TABLE `component_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `newsletter_logs`
--
ALTER TABLE `newsletter_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `newsletter_master`
--
ALTER TABLE `newsletter_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `component_master`
--
ALTER TABLE `component_master`
  ADD CONSTRAINT `fk_component_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_logs`
--
ALTER TABLE `newsletter_logs`
  ADD CONSTRAINT `fk_logs_newsletter` FOREIGN KEY (`newsletter_id`) REFERENCES `newsletter_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_master`
--
ALTER TABLE `newsletter_master`
  ADD CONSTRAINT `fk_nl_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_author` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_posts_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_posts_component` FOREIGN KEY (`component_id`) REFERENCES `component_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
