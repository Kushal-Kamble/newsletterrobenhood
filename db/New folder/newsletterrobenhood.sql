-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2026 at 07:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
  `username` varchar(100) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
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
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
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
  `title` varchar(255) NOT NULL,
  `subcategory` varchar(150) DEFAULT NULL,
  `content_type` enum('text','image','video','link','mixed') NOT NULL DEFAULT 'text',
  `content` longtext DEFAULT NULL,
  `used_in` tinyint(1) DEFAULT 0,
  `used_in_post_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `media_file` varchar(255) DEFAULT NULL,
  `status` enum('draft','published') DEFAULT 'draft'
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
  `subscriber_email` varchar(255) DEFAULT NULL,
  `status` enum('sent','failed') NOT NULL DEFAULT 'sent',
  `error_msg` text DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter_logs`
--

INSERT INTO `newsletter_logs` (`id`, `newsletter_id`, `subscriber_email`, `status`, `error_msg`, `sent_at`) VALUES
(3, 4, 'kushal.kamble@mitsde.com', 'sent', NULL, '2025-09-13 18:01:55'),
(4, 4, 'kushal.kamble1806@gmail.com', 'sent', NULL, '2025-09-13 18:02:04'),
(5, 5, 'kushal.kamble@mitsde.com', 'sent', NULL, '2025-09-13 18:21:14'),
(6, 5, 'kushal.kamble1806@gmail.com', 'sent', NULL, '2025-09-13 18:21:26'),
(7, 6, 'kushal.kamble@mitsde.com', 'failed', 'mailer_error', '2026-03-25 13:22:00'),
(8, 6, 'kushal.kamble1806@gmail.com', 'failed', 'mailer_error', '2026-03-25 13:22:05'),
(9, 6, 'xomosotuf@mailinator.com', 'failed', 'mailer_error', '2026-03-25 13:22:10'),
(10, 6, 'qyxahe@mailinator.com', 'failed', 'mailer_error', '2026-03-25 13:22:14'),
(11, 6, 'kydolywy@mailinator.com', 'failed', 'mailer_error', '2026-03-25 13:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_master`
--

CREATE TABLE `newsletter_master` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory` varchar(150) DEFAULT NULL,
  `editor_content` longtext DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `video` varchar(1000) DEFAULT NULL,
  `links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`links`)),
  `multi_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`multi_content`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `scheduled_at` datetime DEFAULT NULL,
  `sent_status` enum('pending','sent','failed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter_master`
--

INSERT INTO `newsletter_master` (`id`, `title`, `category_id`, `subcategory`, `editor_content`, `image`, `video`, `links`, `multi_content`, `created_at`, `updated_at`, `scheduled_at`, `sent_status`) VALUES
(4, 'newsletter', 1, 'thisd v1', '<p>✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', 'https://mitsde.com/assets/images/homeimages/MITSDE-Banner.jpg', 'https://youtube.com/shorts/3I1eG3cnQlw?si=l_p0xXEJcssTvyQT', NULL, '{\"this_weeks_insights\":{\"label\":\"This Week\\u2019s Insights\",\"category_id\":1,\"subcategory\":\"thisd v1\",\"content\":\"<p>\\u2705 A thought-provoking quote to spark creativity.<br />\\r\\n\\u2705 A one-line reflection or takeaway.<br />\\r\\n\\ud83d\\udccc Use it as your mantra or share with your team.<br />\\r\\n\\ud83c\\udfaf A little wisdom to keep your motivation high.</p>\\r\\n\",\"post_id\":12,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=12\"},\"quick_bytes\":{\"label\":\"Quick Bytes\",\"category_id\":2,\"subcategory\":\"quick v1\",\"content\":\"<p><strong>\\u2705 A thought-provoking quote to spark creativity.<br />\\r\\n\\u2705 A one-line reflection or takeaway.<br />\\r\\n\\ud83d\\udccc Use it as your mantra or share with your team.<br />\\r\\n\\ud83c\\udfaf A little wisdom to keep your motivation high.</strong></p>\\r\\n\",\"post_id\":10,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=10\"},\"ai_tip\":{\"label\":\"AI Tip of the Week\",\"category_id\":3,\"subcategory\":\"av1\",\"content\":\"<p><strong>\\u2705 A thought-provoking quote to spark creativity.<br />\\r\\n\\u2705 A one-line reflection or takeaway.<br />\\r\\n\\ud83d\\udccc Use it as your mantra or share with your team.<br />\\r\\n\\ud83c\\udfaf A little wisdom to keep your motivation high.</strong></p>\\r\\n\",\"post_id\":8,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=8\"},\"toolbox\":{\"label\":\"Toolbox\",\"category_id\":4,\"subcategory\":\"too v1\",\"content\":\"<p>\\u2705 A thought-provoking quote to spark creativity.<br />\\r\\n\\u2705 A one-line reflection or takeaway.<br />\\r\\n\\ud83d\\udccc Use it as your mantra or share with your team.<br />\\r\\n\\ud83c\\udfaf A little wisdom to keep your motivation high.</p>\\r\\n\",\"post_id\":13,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=13\"},\"market_news\":{\"label\":\"Market News\",\"category_id\":5,\"subcategory\":\"market v1\",\"content\":\"<p>\\u2705 A thought-provoking quote to spark creativity.<br />\\r\\n\\u2705 A one-line reflection or takeaway.<br />\\r\\n\\ud83d\\udccc Use it as your mantra or share with your team.<br />\\r\\n\\ud83c\\udfaf A little wisdom to keep your motivation high.</p>\\r\\n\",\"post_id\":9,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=9\"},\"wellnessbyte\":{\"label\":\"Wellnessbyte\",\"category_id\":6,\"subcategory\":\"well t\",\"content\":\"<p>\\u2705 A thought-provoking quote to spark creativity.<br />\\r\\n\\u2705 A one-line reflection or takeaway.<br />\\r\\n\\ud83d\\udccc Use it as your mantra or share with your team.<br />\\r\\n\\ud83c\\udfaf A little wisdom to keep your motivation high.</p>\\r\\n\",\"post_id\":14,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=14\"},\"quote_of_the_day\":{\"label\":\"Quote of the Day\",\"category_id\":7,\"subcategory\":\"quote v1\",\"content\":\"<p>\\u2705 A thought-provoking quote to spark creativity.<br />\\r\\n\\u2705 A one-line reflection or takeaway.<br />\\r\\n\\ud83d\\udccc Use it as your mantra or share with your team.<br />\\r\\n\\ud83c\\udfaf A little wisdom to keep your motivation high.</p>\\r\\n\",\"post_id\":11,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=11\"}}', '2026-01-06 18:01:40', '2026-03-25 13:28:36', NULL, 'sent'),
(5, 'xzzz', 3, 'ssss', '<p><br />\r\nToolbox</p>\r\n\r\n<p>🛠 Your Go-To Resource Hub<br />\r\n✅ Highlighted apps, plugins, and frameworks worth trying.<br />\r\n✅ Step-by-step guidance for setup or best practices.<br />\r\n✅ Tested recommendations that improve workflow.<br />\r\n📌 Keep this section handy for future projects.</p>\r\n\r\n<p>Market News</p>\r\n\r\n<p>📈 Stay Ahead of the Trends<br />\r\n✅ Key updates from finance, startups, and technology.<br />\r\n✅ Simplified analysis for quick understanding.<br />\r\n✅ Charts 📊 and snapshots that reveal the bigger picture.<br />\r\n🎯 Stay informed to make smarter moves.</p>\r\n\r\n<p>Wellnessbyte</p>\r\n\r\n<p>🌱 Balance Work and Well-Being<br />\r\n✅ Simple tips for mental clarity and focus.<br />\r\n✅ Quick exercises or mindfulness hacks 🧘.<br />\r\n✅ Nutrition and lifestyle pointers for busy professionals.<br />\r\n🕒 Small actions, big long-term benefits.</p>\r\n\r\n<p>Quote of the Day</p>\r\n\r\n<p>💡 Inspiration to Power Your Day<br />\r\n✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', 'https://mitsde.com/assets/images/homeimages/MITSDE-Banner.jpg', 'https://youtube.com/shorts/3I1eG3cnQlw?si=l_p0xXEJcssTvyQT', NULL, '{\"this_weeks_insights\":{\"label\":\"This Week\\u2019s Insights\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"quick_bytes\":{\"label\":\"Quick Bytes\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"ai_tip\":{\"label\":\"AI Tip of the Week\",\"category_id\":3,\"subcategory\":\"ssss\",\"content\":\"<p><br />\\r\\nToolbox</p>\\r\\n\\r\\n<p>\\ud83d\\udee0 Your Go-To Resource Hub<br />\\r\\n\\u2705 Highlighted apps, plugins, and frameworks worth trying.<br />\\r\\n\\u2705 Step-by-step guidance for setup or best practices.<br />\\r\\n\\u2705 Tested recommendations that improve workflow.<br />\\r\\n\\ud83d\\udccc Keep this section handy for future projects.</p>\\r\\n\\r\\n<p>Market News</p>\\r\\n\\r\\n<p>\\ud83d\\udcc8 Stay Ahead of the Trends<br />\\r\\n\\u2705 Key updates from finance, startups, and technology.<br />\\r\\n\\u2705 Simplified analysis for quick understanding.<br />\\r\\n\\u2705 Charts \\ud83d\\udcca and snapshots that reveal the bigger picture.<br />\\r\\n\\ud83c\\udfaf Stay informed to make smarter moves.</p>\\r\\n\\r\\n<p>Wellnessbyte</p>\\r\\n\\r\\n<p>\\ud83c\\udf31 Balance Work and Well-Being<br />\\r\\n\\u2705 Simple tips for mental clarity and focus.<br />\\r\\n\\u2705 Quick exercises or mindfulness hacks \\ud83e\\uddd8.<br />\\r\\n\\u2705 Nutrition and lifestyle pointers for busy professionals.<br />\\r\\n\\ud83d\\udd52 Small actions, big long-term benefits.</p>\\r\\n\\r\\n<p>Quote of the Day</p>\\r\\n\\r\\n<p>\\ud83d\\udca1 Inspiration to Power Your Day<br />\\r\\n\\u2705 A thought-provoking quote to spark creativity.<br />\\r\\n\\u2705 A one-line reflection or takeaway.<br />\\r\\n\\ud83d\\udccc Use it as your mantra or share with your team.<br />\\r\\n\\ud83c\\udfaf A little wisdom to keep your motivation high.</p>\\r\\n\",\"post_id\":15,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=15\"},\"toolbox\":{\"label\":\"Toolbox\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"market_news\":{\"label\":\"Market News\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"wellnessbyte\":{\"label\":\"Wellnessbyte\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"quote_of_the_day\":{\"label\":\"Quote of the Day\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null}}', '2026-02-11 18:21:04', '2026-03-25 13:28:50', NULL, 'sent'),
(6, 'Anim enim velit volu', 5, '', '<p>ttt</p>\r\n', 'Quis nostrum facere', 'Culpa suscipit sed', NULL, '{\"this_weeks_insights\":{\"label\":\"This Week\\u2019s Insights\",\"category_id\":5,\"subcategory\":\"\",\"content\":\"<p>ttt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"quick_bytes\":{\"label\":\"Quick Bytes\",\"category_id\":5,\"subcategory\":\"market\",\"content\":\"<p>ttt</p>\\r\\n\",\"post_id\":17,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=17\"},\"ai_tip\":{\"label\":\"AI Tip of the Week\",\"category_id\":7,\"subcategory\":\"quote v1\",\"content\":\"<p>tt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"toolbox\":{\"label\":\"Toolbox\",\"category_id\":6,\"subcategory\":\"\",\"content\":\"<p>tt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"market_news\":{\"label\":\"Market News\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"wellnessbyte\":{\"label\":\"Wellnessbyte\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"quote_of_the_day\":{\"label\":\"Quote of the Day\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null}}', '2026-02-18 13:21:55', '2026-03-25 13:30:30', NULL, 'failed'),
(7, 'Anim enim velit volu', 5, '', '<p>ttt</p>\r\n', 'Quis nostrum facere', 'Culpa suscipit sed', NULL, '{\"this_weeks_insights\":{\"label\":\"This Week\\u2019s Insights\",\"category_id\":5,\"subcategory\":\"\",\"content\":\"<p>ttt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"quick_bytes\":{\"label\":\"Quick Bytes\",\"category_id\":5,\"subcategory\":\"market\",\"content\":\"<p>ttt</p>\\r\\n\",\"post_id\":17,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=17\"},\"ai_tip\":{\"label\":\"AI Tip of the Week\",\"category_id\":7,\"subcategory\":\"quote v1\",\"content\":\"<p>tt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"toolbox\":{\"label\":\"Toolbox\",\"category_id\":6,\"subcategory\":\"\",\"content\":\"<p>tt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"market_news\":{\"label\":\"Market News\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"wellnessbyte\":{\"label\":\"Wellnessbyte\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"quote_of_the_day\":{\"label\":\"Quote of the Day\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null}}', '2026-03-19 13:21:55', '2026-03-25 13:29:40', NULL, 'failed'),
(8, 'Anim enim velit volu', 5, '', '<p>ttt</p>\r\n', 'Quis nostrum facere', 'Culpa suscipit sed', NULL, '{\"this_weeks_insights\":{\"label\":\"This Week\\u2019s Insights\",\"category_id\":5,\"subcategory\":\"\",\"content\":\"<p>ttt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"quick_bytes\":{\"label\":\"Quick Bytes\",\"category_id\":5,\"subcategory\":\"market\",\"content\":\"<p>ttt</p>\\r\\n\",\"post_id\":17,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=17\"},\"ai_tip\":{\"label\":\"AI Tip of the Week\",\"category_id\":7,\"subcategory\":\"quote v1\",\"content\":\"<p>tt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"toolbox\":{\"label\":\"Toolbox\",\"category_id\":6,\"subcategory\":\"\",\"content\":\"<p>tt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"market_news\":{\"label\":\"Market News\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"wellnessbyte\":{\"label\":\"Wellnessbyte\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"quote_of_the_day\":{\"label\":\"Quote of the Day\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null}}', '2026-03-19 13:21:55', '2026-03-25 13:29:40', NULL, 'failed'),
(9, 'Anim enim velit volu', 5, '', '<p>ttt</p>\r\n', 'Quis nostrum facere', 'Culpa suscipit sed', NULL, '{\"this_weeks_insights\":{\"label\":\"This Week\\u2019s Insights\",\"category_id\":5,\"subcategory\":\"\",\"content\":\"<p>ttt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"quick_bytes\":{\"label\":\"Quick Bytes\",\"category_id\":5,\"subcategory\":\"market\",\"content\":\"<p>ttt</p>\\r\\n\",\"post_id\":17,\"post_url\":\"http://localhost/newsletterrobenhood/public/post.php?id=17\"},\"ai_tip\":{\"label\":\"AI Tip of the Week\",\"category_id\":7,\"subcategory\":\"quote v1\",\"content\":\"<p>tt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"toolbox\":{\"label\":\"Toolbox\",\"category_id\":6,\"subcategory\":\"\",\"content\":\"<p>tt</p>\\r\\n\",\"post_id\":null,\"post_url\":null},\"market_news\":{\"label\":\"Market News\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"wellnessbyte\":{\"label\":\"Wellnessbyte\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null},\"quote_of_the_day\":{\"label\":\"Quote of the Day\",\"category_id\":null,\"subcategory\":\"\",\"content\":\"\",\"post_id\":null,\"post_url\":null}}', '2026-03-19 13:21:55', '2026-03-25 13:29:40', NULL, 'failed');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `post_date` date DEFAULT curdate(),
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory` varchar(150) DEFAULT NULL,
  `main_media` varchar(1000) DEFAULT NULL,
  `links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`links`)),
  `component_id` int(11) DEFAULT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `post_date`, `author_id`, `category_id`, `subcategory`, `main_media`, `links`, `component_id`, `status`, `created_at`, `updated_at`) VALUES
(8, 'ai t', '<p>https://chsculture.org/wp-content/uploads/2021/12/Newsletter.png</p>\r\n\r\n<p>This Week&rsquo;s Insights</p>\r\n\r\n<p>🚀 Fresh Perspectives for Your Week<br />\r\n✅ Discover trending topics shaping tech and business.<br />\r\n✅ Deep dives into industry shifts and upcoming opportunities.<br />\r\n✅ Actionable strategies to stay ahead of the curve.<br />\r\n🎯 A quick, powerful read to boost your decision-making.</p>\r\n\r\n<p>Quick Bytes</p>\r\n\r\n<p>⚡ Small Nuggets, Big Impact<br />\r\n✅ Bite-sized tips on productivity, learning, and tools.<br />\r\n✅ Curated links 🔗 to must-read articles and resources.<br />\r\n✅ Fast facts 📊 to stay informed without information overload.<br />\r\n📌 Perfect for a 2-minute coffee break update.</p>\r\n\r\n<p>AI Tip of the Week</p>\r\n\r\n<p>🤖 Unlock AI&rsquo;s Potential<br />\r\n✅ Practical advice for using AI tools effectively.<br />\r\n✅ How to automate small tasks and save time.<br />\r\n✅ Quick demonstrations for beginners and pros.<br />\r\n🕒 Boost efficiency with smart AI shortcuts.</p>\r\n\r\n<p>Toolbox</p>\r\n\r\n<p>🛠 Your Go-To Resource Hub<br />\r\n✅ Highlighted apps, plugins, and frameworks worth trying.<br />\r\n✅ Step-by-step guidance for setup or best practices.<br />\r\n✅ Tested recommendations that improve workflow.<br />\r\n📌 Keep this section handy for future projects.</p>\r\n\r\n<p>Market News</p>\r\n\r\n<p>📈 Stay Ahead of the Trends<br />\r\n✅ Key updates from finance, startups, and technology.<br />\r\n✅ Simplified analysis for quick understanding.<br />\r\n✅ Charts 📊 and snapshots that reveal the bigger picture.<br />\r\n🎯 Stay informed to make smarter moves.</p>\r\n\r\n<p>Wellnessbyte</p>\r\n\r\n<p>🌱 Balance Work and Well-Being<br />\r\n✅ Simple tips for mental clarity and focus.<br />\r\n✅ Quick exercises or mindfulness hacks 🧘.<br />\r\n✅ Nutrition and lifestyle pointers for busy professionals.<br />\r\n🕒 Small actions, big long-term benefits.</p>\r\n\r\n<p>Quote of the Day</p>\r\n\r\n<p>💡 Inspiration to Power Your Day<br />\r\n✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', '2025-09-13', 1, 3, 'av1', '1757786191_image1.jpg', NULL, NULL, 'published', '2025-09-13 17:56:31', NULL),
(9, 'maeket title', '<p>https://chsculture.org/wp-content/uploads/2021/12/Newsletter.png</p>\r\n\r\n<p>This Week&rsquo;s Insights</p>\r\n\r\n<p>🚀 Fresh Perspectives for Your Week<br />\r\n✅ Discover trending topics shaping tech and business.<br />\r\n✅ Deep dives into industry shifts and upcoming opportunities.<br />\r\n✅ Actionable strategies to stay ahead of the curve.<br />\r\n🎯 A quick, powerful read to boost your decision-making.</p>\r\n\r\n<p>Quick Bytes</p>\r\n\r\n<p>⚡ Small Nuggets, Big Impact<br />\r\n✅ Bite-sized tips on productivity, learning, and tools.<br />\r\n✅ Curated links 🔗 to must-read articles and resources.<br />\r\n✅ Fast facts 📊 to stay informed without information overload.<br />\r\n📌 Perfect for a 2-minute coffee break update.</p>\r\n\r\n<p>AI Tip of the Week</p>\r\n\r\n<p>🤖 Unlock AI&rsquo;s Potential<br />\r\n✅ Practical advice for using AI tools effectively.<br />\r\n✅ How to automate small tasks and save time.<br />\r\n✅ Quick demonstrations for beginners and pros.<br />\r\n🕒 Boost efficiency with smart AI shortcuts.</p>\r\n\r\n<p>Toolbox</p>\r\n\r\n<p>🛠 Your Go-To Resource Hub<br />\r\n✅ Highlighted apps, plugins, and frameworks worth trying.<br />\r\n✅ Step-by-step guidance for setup or best practices.<br />\r\n✅ Tested recommendations that improve workflow.<br />\r\n📌 Keep this section handy for future projects.</p>\r\n\r\n<p>Market News</p>\r\n\r\n<p>📈 Stay Ahead of the Trends<br />\r\n✅ Key updates from finance, startups, and technology.<br />\r\n✅ Simplified analysis for quick understanding.<br />\r\n✅ Charts 📊 and snapshots that reveal the bigger picture.<br />\r\n🎯 Stay informed to make smarter moves.</p>\r\n\r\n<p>Wellnessbyte</p>\r\n\r\n<p>🌱 Balance Work and Well-Being<br />\r\n✅ Simple tips for mental clarity and focus.<br />\r\n✅ Quick exercises or mindfulness hacks 🧘.<br />\r\n✅ Nutrition and lifestyle pointers for busy professionals.<br />\r\n🕒 Small actions, big long-term benefits.</p>\r\n\r\n<p>Quote of the Day</p>\r\n\r\n<p>💡 Inspiration to Power Your Day<br />\r\n✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', '2025-09-13', 1, 5, 'market v1', '1757786220_image3.jpg', NULL, NULL, 'published', '2025-09-13 17:57:00', NULL),
(10, 'quick bytes', '<p>https://chsculture.org/wp-content/uploads/2021/12/Newsletter.png</p>\r\n\r\n<p>This Week&rsquo;s Insights</p>\r\n\r\n<p>🚀 Fresh Perspectives for Your Week<br />\r\n✅ Discover trending topics shaping tech and business.<br />\r\n✅ Deep dives into industry shifts and upcoming opportunities.<br />\r\n✅ Actionable strategies to stay ahead of the curve.<br />\r\n🎯 A quick, powerful read to boost your decision-making.</p>\r\n\r\n<p>Quick Bytes</p>\r\n\r\n<p>⚡ Small Nuggets, Big Impact<br />\r\n✅ Bite-sized tips on productivity, learning, and tools.<br />\r\n✅ Curated links 🔗 to must-read articles and resources.<br />\r\n✅ Fast facts 📊 to stay informed without information overload.<br />\r\n📌 Perfect for a 2-minute coffee break update.</p>\r\n\r\n<p>AI Tip of the Week</p>\r\n\r\n<p>🤖 Unlock AI&rsquo;s Potential<br />\r\n✅ Practical advice for using AI tools effectively.<br />\r\n✅ How to automate small tasks and save time.<br />\r\n✅ Quick demonstrations for beginners and pros.<br />\r\n🕒 Boost efficiency with smart AI shortcuts.</p>\r\n\r\n<p>Toolbox</p>\r\n\r\n<p>🛠 Your Go-To Resource Hub<br />\r\n✅ Highlighted apps, plugins, and frameworks worth trying.<br />\r\n✅ Step-by-step guidance for setup or best practices.<br />\r\n✅ Tested recommendations that improve workflow.<br />\r\n📌 Keep this section handy for future projects.</p>\r\n\r\n<p>Market News</p>\r\n\r\n<p>📈 Stay Ahead of the Trends<br />\r\n✅ Key updates from finance, startups, and technology.<br />\r\n✅ Simplified analysis for quick understanding.<br />\r\n✅ Charts 📊 and snapshots that reveal the bigger picture.<br />\r\n🎯 Stay informed to make smarter moves.</p>\r\n\r\n<p>Wellnessbyte</p>\r\n\r\n<p>🌱 Balance Work and Well-Being<br />\r\n✅ Simple tips for mental clarity and focus.<br />\r\n✅ Quick exercises or mindfulness hacks 🧘.<br />\r\n✅ Nutrition and lifestyle pointers for busy professionals.<br />\r\n🕒 Small actions, big long-term benefits.</p>\r\n\r\n<p>Quote of the Day</p>\r\n\r\n<p>💡 Inspiration to Power Your Day<br />\r\n✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', '2025-09-13', 1, 2, 'quick v1', '1757786249_image2.jpg', NULL, NULL, 'published', '2025-09-13 17:57:29', NULL),
(11, 'quote', '<p>https://chsculture.org/wp-content/uploads/2021/12/Newsletter.png</p>\r\n\r\n<p>This Week&rsquo;s Insights</p>\r\n\r\n<p>🚀 Fresh Perspectives for Your Week<br />\r\n✅ Discover trending topics shaping tech and business.<br />\r\n✅ Deep dives into industry shifts and upcoming opportunities.<br />\r\n✅ Actionable strategies to stay ahead of the curve.<br />\r\n🎯 A quick, powerful read to boost your decision-making.</p>\r\n\r\n<p>Quick Bytes</p>\r\n\r\n<p>⚡ Small Nuggets, Big Impact<br />\r\n✅ Bite-sized tips on productivity, learning, and tools.<br />\r\n✅ Curated links 🔗 to must-read articles and resources.<br />\r\n✅ Fast facts 📊 to stay informed without information overload.<br />\r\n📌 Perfect for a 2-minute coffee break update.</p>\r\n\r\n<p>AI Tip of the Week</p>\r\n\r\n<p>🤖 Unlock AI&rsquo;s Potential<br />\r\n✅ Practical advice for using AI tools effectively.<br />\r\n✅ How to automate small tasks and save time.<br />\r\n✅ Quick demonstrations for beginners and pros.<br />\r\n🕒 Boost efficiency with smart AI shortcuts.</p>\r\n\r\n<p>Toolbox</p>\r\n\r\n<p>🛠 Your Go-To Resource Hub<br />\r\n✅ Highlighted apps, plugins, and frameworks worth trying.<br />\r\n✅ Step-by-step guidance for setup or best practices.<br />\r\n✅ Tested recommendations that improve workflow.<br />\r\n📌 Keep this section handy for future projects.</p>\r\n\r\n<p>Market News</p>\r\n\r\n<p>📈 Stay Ahead of the Trends<br />\r\n✅ Key updates from finance, startups, and technology.<br />\r\n✅ Simplified analysis for quick understanding.<br />\r\n✅ Charts 📊 and snapshots that reveal the bigger picture.<br />\r\n🎯 Stay informed to make smarter moves.</p>\r\n\r\n<p>Wellnessbyte</p>\r\n\r\n<p>🌱 Balance Work and Well-Being<br />\r\n✅ Simple tips for mental clarity and focus.<br />\r\n✅ Quick exercises or mindfulness hacks 🧘.<br />\r\n✅ Nutrition and lifestyle pointers for busy professionals.<br />\r\n🕒 Small actions, big long-term benefits.</p>\r\n\r\n<p>Quote of the Day</p>\r\n\r\n<p>💡 Inspiration to Power Your Day<br />\r\n✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', '2025-09-13', 1, 7, ' quote v1', '1757786276_image1.jpg', NULL, NULL, 'published', '2025-09-13 17:57:56', NULL),
(12, 'this', '<p>https://chsculture.org/wp-content/uploads/2021/12/Newsletter.png</p>\r\n\r\n<p>This Week&rsquo;s Insights</p>\r\n\r\n<p>🚀 Fresh Perspectives for Your Week<br />\r\n✅ Discover trending topics shaping tech and business.<br />\r\n✅ Deep dives into industry shifts and upcoming opportunities.<br />\r\n✅ Actionable strategies to stay ahead of the curve.<br />\r\n🎯 A quick, powerful read to boost your decision-making.</p>\r\n\r\n<p>Quick Bytes</p>\r\n\r\n<p>⚡ Small Nuggets, Big Impact<br />\r\n✅ Bite-sized tips on productivity, learning, and tools.<br />\r\n✅ Curated links 🔗 to must-read articles and resources.<br />\r\n✅ Fast facts 📊 to stay informed without information overload.<br />\r\n📌 Perfect for a 2-minute coffee break update.</p>\r\n\r\n<p>AI Tip of the Week</p>\r\n\r\n<p>🤖 Unlock AI&rsquo;s Potential<br />\r\n✅ Practical advice for using AI tools effectively.<br />\r\n✅ How to automate small tasks and save time.<br />\r\n✅ Quick demonstrations for beginners and pros.<br />\r\n🕒 Boost efficiency with smart AI shortcuts.</p>\r\n\r\n<p>Toolbox</p>\r\n\r\n<p>🛠 Your Go-To Resource Hub<br />\r\n✅ Highlighted apps, plugins, and frameworks worth trying.<br />\r\n✅ Step-by-step guidance for setup or best practices.<br />\r\n✅ Tested recommendations that improve workflow.<br />\r\n📌 Keep this section handy for future projects.</p>\r\n\r\n<p>Market News</p>\r\n\r\n<p>📈 Stay Ahead of the Trends<br />\r\n✅ Key updates from finance, startups, and technology.<br />\r\n✅ Simplified analysis for quick understanding.<br />\r\n✅ Charts 📊 and snapshots that reveal the bigger picture.<br />\r\n🎯 Stay informed to make smarter moves.</p>\r\n\r\n<p>Wellnessbyte</p>\r\n\r\n<p>🌱 Balance Work and Well-Being<br />\r\n✅ Simple tips for mental clarity and focus.<br />\r\n✅ Quick exercises or mindfulness hacks 🧘.<br />\r\n✅ Nutrition and lifestyle pointers for busy professionals.<br />\r\n🕒 Small actions, big long-term benefits.</p>\r\n\r\n<p>Quote of the Day</p>\r\n\r\n<p>💡 Inspiration to Power Your Day<br />\r\n✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', '2025-09-13', 1, 1, 'thisd v1', '1757786302_image2.jpg', NULL, NULL, 'published', '2025-09-13 17:58:22', NULL),
(13, 'toolx', '<p>https://chsculture.org/wp-content/uploads/2021/12/Newsletter.png</p>\r\n\r\n<p>This Week&rsquo;s Insights</p>\r\n\r\n<p>🚀 Fresh Perspectives for Your Week<br />\r\n✅ Discover trending topics shaping tech and business.<br />\r\n✅ Deep dives into industry shifts and upcoming opportunities.<br />\r\n✅ Actionable strategies to stay ahead of the curve.<br />\r\n🎯 A quick, powerful read to boost your decision-making.</p>\r\n\r\n<p>Quick Bytes</p>\r\n\r\n<p>⚡ Small Nuggets, Big Impact<br />\r\n✅ Bite-sized tips on productivity, learning, and tools.<br />\r\n✅ Curated links 🔗 to must-read articles and resources.<br />\r\n✅ Fast facts 📊 to stay informed without information overload.<br />\r\n📌 Perfect for a 2-minute coffee break update.</p>\r\n\r\n<p>AI Tip of the Week</p>\r\n\r\n<p>🤖 Unlock AI&rsquo;s Potential<br />\r\n✅ Practical advice for using AI tools effectively.<br />\r\n✅ How to automate small tasks and save time.<br />\r\n✅ Quick demonstrations for beginners and pros.<br />\r\n🕒 Boost efficiency with smart AI shortcuts.</p>\r\n\r\n<p>Toolbox</p>\r\n\r\n<p>🛠 Your Go-To Resource Hub<br />\r\n✅ Highlighted apps, plugins, and frameworks worth trying.<br />\r\n✅ Step-by-step guidance for setup or best practices.<br />\r\n✅ Tested recommendations that improve workflow.<br />\r\n📌 Keep this section handy for future projects.</p>\r\n\r\n<p>Market News</p>\r\n\r\n<p>📈 Stay Ahead of the Trends<br />\r\n✅ Key updates from finance, startups, and technology.<br />\r\n✅ Simplified analysis for quick understanding.<br />\r\n✅ Charts 📊 and snapshots that reveal the bigger picture.<br />\r\n🎯 Stay informed to make smarter moves.</p>\r\n\r\n<p>Wellnessbyte</p>\r\n\r\n<p>🌱 Balance Work and Well-Being<br />\r\n✅ Simple tips for mental clarity and focus.<br />\r\n✅ Quick exercises or mindfulness hacks 🧘.<br />\r\n✅ Nutrition and lifestyle pointers for busy professionals.<br />\r\n🕒 Small actions, big long-term benefits.</p>\r\n\r\n<p>Quote of the Day</p>\r\n\r\n<p>💡 Inspiration to Power Your Day<br />\r\n✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', '2025-09-13', 1, 4, 'too v1', '1757786328_image1.jpg', NULL, NULL, 'published', '2025-09-13 17:58:48', NULL),
(14, 'wellne', '<p>https://chsculture.org/wp-content/uploads/2021/12/Newsletter.png</p>\r\n\r\n<p>This Week&rsquo;s Insights</p>\r\n\r\n<p>🚀 Fresh Perspectives for Your Week<br />\r\n✅ Discover trending topics shaping tech and business.<br />\r\n✅ Deep dives into industry shifts and upcoming opportunities.<br />\r\n✅ Actionable strategies to stay ahead of the curve.<br />\r\n🎯 A quick, powerful read to boost your decision-making.</p>\r\n\r\n<p>Quick Bytes</p>\r\n\r\n<p>⚡ Small Nuggets, Big Impact<br />\r\n✅ Bite-sized tips on productivity, learning, and tools.<br />\r\n✅ Curated links 🔗 to must-read articles and resources.<br />\r\n✅ Fast facts 📊 to stay informed without information overload.<br />\r\n📌 Perfect for a 2-minute coffee break update.</p>\r\n\r\n<p>AI Tip of the Week</p>\r\n\r\n<p>🤖 Unlock AI&rsquo;s Potential<br />\r\n✅ Practical advice for using AI tools effectively.<br />\r\n✅ How to automate small tasks and save time.<br />\r\n✅ Quick demonstrations for beginners and pros.<br />\r\n🕒 Boost efficiency with smart AI shortcuts.</p>\r\n\r\n<p>Toolbox</p>\r\n\r\n<p>🛠 Your Go-To Resource Hub<br />\r\n✅ Highlighted apps, plugins, and frameworks worth trying.<br />\r\n✅ Step-by-step guidance for setup or best practices.<br />\r\n✅ Tested recommendations that improve workflow.<br />\r\n📌 Keep this section handy for future projects.</p>\r\n\r\n<p>Market News</p>\r\n\r\n<p>📈 Stay Ahead of the Trends<br />\r\n✅ Key updates from finance, startups, and technology.<br />\r\n✅ Simplified analysis for quick understanding.<br />\r\n✅ Charts 📊 and snapshots that reveal the bigger picture.<br />\r\n🎯 Stay informed to make smarter moves.</p>\r\n\r\n<p>Wellnessbyte</p>\r\n\r\n<p>🌱 Balance Work and Well-Being<br />\r\n✅ Simple tips for mental clarity and focus.<br />\r\n✅ Quick exercises or mindfulness hacks 🧘.<br />\r\n✅ Nutrition and lifestyle pointers for busy professionals.<br />\r\n🕒 Small actions, big long-term benefits.</p>\r\n\r\n<p>Quote of the Day</p>\r\n\r\n<p>💡 Inspiration to Power Your Day<br />\r\n✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', '2025-09-13', 1, 6, 'well t', '1757786357_image2.jpg', NULL, NULL, 'published', '2025-09-13 17:59:17', NULL),
(15, 'sdss', '<p><br />\r\nToolbox</p>\r\n\r\n<p>🛠 Your Go-To Resource Hub<br />\r\n✅ Highlighted apps, plugins, and frameworks worth trying.<br />\r\n✅ Step-by-step guidance for setup or best practices.<br />\r\n✅ Tested recommendations that improve workflow.<br />\r\n📌 Keep this section handy for future projects.</p>\r\n\r\n<p>Market News</p>\r\n\r\n<p>📈 Stay Ahead of the Trends<br />\r\n✅ Key updates from finance, startups, and technology.<br />\r\n✅ Simplified analysis for quick understanding.<br />\r\n✅ Charts 📊 and snapshots that reveal the bigger picture.<br />\r\n🎯 Stay informed to make smarter moves.</p>\r\n\r\n<p>Wellnessbyte</p>\r\n\r\n<p>🌱 Balance Work and Well-Being<br />\r\n✅ Simple tips for mental clarity and focus.<br />\r\n✅ Quick exercises or mindfulness hacks 🧘.<br />\r\n✅ Nutrition and lifestyle pointers for busy professionals.<br />\r\n🕒 Small actions, big long-term benefits.</p>\r\n\r\n<p>Quote of the Day</p>\r\n\r\n<p>💡 Inspiration to Power Your Day<br />\r\n✅ A thought-provoking quote to spark creativity.<br />\r\n✅ A one-line reflection or takeaway.<br />\r\n📌 Use it as your mantra or share with your team.<br />\r\n🎯 A little wisdom to keep your motivation high.</p>\r\n', '2025-09-13', 1, 3, 'ssss', '1757787612_image2.jpg', NULL, NULL, 'published', '2025-09-13 18:20:12', NULL),
(16, 'ai', '<p>test</p>\r\n', '2026-01-07', 1, 3, 'ai v1', '', NULL, NULL, 'published', '2025-09-13 18:34:59', '2026-03-25 13:26:27'),
(17, 'Market Ttititlele', '<p>sdsdas</p>\r\n', '2026-02-04', 1, 5, 'market', '1757788675_image1.jpg', NULL, NULL, 'published', '2025-09-13 18:37:55', '2026-03-25 13:26:06'),
(18, 'Harum quia inventore', '', '2026-02-05', 1, 4, 'Enim architecto in m', '', NULL, NULL, 'published', '2026-03-25 13:19:19', '2026-03-25 13:27:45'),
(19, 'Quae amet sint bea', '', '2026-03-25', 1, 4, 'Nostrum aliquid et a', '', NULL, NULL, 'draft', '2026-03-25 13:26:48', NULL),
(20, 'Cum perspiciatis in', '', '2026-03-25', 1, 6, 'Ipsam voluptatem vel', '', NULL, NULL, 'draft', '2026-03-25 13:26:55', NULL),
(21, 'Qui excepteur placea', '', '2026-03-25', 1, 1, 'Dignissimos aut est ', '', NULL, NULL, 'published', '2026-03-25 13:27:08', NULL),
(22, 'Itaque aspernatur qu', '', '2026-03-25', 1, 7, 'Non nemo nulla tempo', '', NULL, NULL, 'draft', '2026-03-25 13:27:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `name`, `email`, `created_at`, `status`) VALUES
(1, 'Kushal Kamble', 'kushal.kamble@mits.com', '2026-01-07 08:55:59', 1),
(3, 'shahrukh khan', 'kushal.kamble1806@gmail.com', '2025-09-02 06:35:40', 1),
(4, 'akshay kumar', 'manager1@gmail.com', '2025-09-02 06:36:05', 0),
(6, 'Amitabh bacchan', 'amitabh@example.com', '2025-09-04 05:17:19', 0),
(13, 'Rahim Cotton', 'xomosotuf@mailinator.com', '2026-02-04 13:18:51', 1),
(14, 'Chaney Fitzpatrick', 'qyxahe@mailinator.com', '2026-02-11 13:19:33', 1),
(15, 'Jenette Schultz', 'kydolywy@mailinator.com', '2026-02-13 13:20:06', 1),
(16, 'Jameson Wright', 'qakexicuh@mailinator.com', '2026-03-25 13:23:33', 1),
(17, 'Vivian Leonard', 'tozi@mailinator.com', '2026-03-25 13:23:37', 1),
(18, 'Dawn Vargas', 'cavoledus@mailinator.com', '2026-03-25 13:23:40', 1),
(19, 'Beck Washington', 'larubew@mailinator.com', '2026-03-25 13:23:45', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `newsletter_master`
--
ALTER TABLE `newsletter_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
