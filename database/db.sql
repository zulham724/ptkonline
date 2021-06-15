-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) unsigned NOT NULL,
  `answer_list_id` bigint(20) unsigned DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_question_id_foreign` (`question_id`),
  KEY `answers_answer_list_id_foreign` (`answer_list_id`),
  CONSTRAINT `answers_answer_list_id_foreign` FOREIGN KEY (`answer_list_id`) REFERENCES `answer_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `answers` (`id`, `question_id`, `answer_list_id`, `value`, `score`, `created_at`, `updated_at`) VALUES
(67,	76,	7,	'identifikasi masalah',	NULL,	'2020-10-08 23:23:49',	'2020-10-08 23:23:49'),
(68,	77,	10,	'Carr dan Kemmis',	100,	'2020-10-08 23:23:49',	'2020-10-11 21:35:44'),
(69,	78,	6,	'analisis masalah',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(70,	79,	2,	'Empirik',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(71,	80,	12,	'Mc Taggard',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(72,	81,	NULL,	'sad',	17,	'2020-10-08 23:30:58',	'2020-10-09 22:23:48'),
(73,	82,	18,	'1 dan 3',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(74,	83,	21,	'Kenakalan remaja',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(75,	84,	NULL,	'sd',	35,	'2020-10-08 23:30:58',	'2020-10-09 20:45:59'),
(78,	87,	33,	'sampel acak',	NULL,	'2020-10-09 21:22:21',	'2020-10-09 21:22:21'),
(79,	88,	40,	'kualitas pembelajaran di kelas',	100,	'2020-10-09 21:22:21',	'2020-10-11 18:08:11'),
(82,	91,	26,	'anda tau',	100,	'2020-10-11 19:08:48',	'2020-10-11 19:08:48'),
(83,	92,	31,	'hmm',	NULL,	'2020-10-11 19:08:48',	'2020-10-11 19:27:44'),
(84,	93,	35,	'sampel khusus, yaitu kelas',	NULL,	'2020-10-11 23:16:40',	'2020-10-11 23:16:40'),
(85,	94,	37,	'daya inovasi pada diri guru',	NULL,	'2020-10-11 23:16:40',	'2020-10-11 23:16:40'),
(86,	95,	6,	'analisis masalah',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(87,	96,	2,	'Empirik',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(88,	97,	11,	'Schmuc',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(89,	98,	NULL,	'13',	0,	'2020-10-12 00:33:04',	'2020-10-12 00:43:34'),
(90,	99,	19,	'2 dan 3',	100,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(91,	100,	24,	'Prestasi belajar',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(92,	101,	NULL,	'123',	51,	'2020-10-12 00:33:04',	'2020-10-12 00:43:34'),
(93,	102,	26,	'anda tau',	100,	'2020-10-12 00:37:27',	'2020-10-12 00:37:27'),
(94,	103,	31,	'hmm',	NULL,	'2020-10-12 00:37:27',	'2020-10-12 00:37:27');

DROP TABLE IF EXISTS `answer_lists`;
CREATE TABLE `answer_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question_list_id` bigint(20) unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_lists_question_list_id_foreign` (`question_list_id`),
  CONSTRAINT `answer_lists_question_list_id_foreign` FOREIGN KEY (`question_list_id`) REFERENCES `question_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `answer_lists` (`id`, `question_list_id`, `value`, `score`, `created_at`, `updated_at`) VALUES
(1,	1,	'Diagnostik',	NULL,	'2020-09-28 18:55:17',	'2020-09-28 18:55:17'),
(2,	1,	'Empirik',	NULL,	'2020-09-28 18:56:01',	'2020-10-08 00:46:41'),
(3,	1,	'Partisipan',	NULL,	'2020-09-28 18:56:10',	'2020-09-28 18:56:10'),
(4,	1,	'Ekperimental',	100,	'2020-09-28 18:56:18',	'2020-10-08 00:46:41'),
(5,	2,	'pembatasan masalah',	NULL,	'2020-09-28 18:56:34',	'2020-10-09 21:46:33'),
(6,	2,	'analisis masalah',	NULL,	'2020-09-28 18:56:49',	'2020-10-08 00:46:34'),
(7,	2,	'identifikasi masalah',	100,	'2020-09-28 18:57:08',	'2020-10-09 21:46:33'),
(8,	2,	'perumusan masalah',	NULL,	'2020-09-28 18:57:17',	'2020-10-04 20:09:52'),
(9,	4,	'Rochman',	NULL,	'2020-09-28 18:57:50',	'2020-10-11 21:35:44'),
(10,	4,	'Carr dan Kemmis',	100,	'2020-09-28 18:58:01',	'2020-10-11 21:35:44'),
(11,	4,	'Schmuc',	NULL,	'2020-09-28 18:58:11',	'2020-09-28 18:58:11'),
(12,	4,	'Mc Taggard',	NULL,	'2020-09-28 18:58:18',	'2020-09-28 18:58:18'),
(13,	5,	'車の発明者は aa',	100,	'2020-09-30 18:53:19',	'2020-10-04 20:54:41'),
(16,	8,	'Anda Tau??',	NULL,	'2020-10-04 20:55:13',	'2020-10-04 20:55:13'),
(17,	9,	'1 dan 2',	NULL,	'2020-10-04 21:02:04',	'2020-10-04 21:02:04'),
(18,	9,	'1 dan 3',	NULL,	'2020-10-04 21:02:04',	'2020-10-04 21:02:04'),
(19,	9,	'2 dan 3',	100,	'2020-10-04 21:02:04',	'2020-10-09 11:58:21'),
(20,	9,	'1, 2 dan 3',	NULL,	'2020-10-04 21:02:04',	'2020-10-04 21:02:04'),
(21,	10,	'Kenakalan remaja',	NULL,	'2020-10-04 21:02:04',	'2020-10-04 21:02:04'),
(22,	10,	'Disiplin belajar',	NULL,	'2020-10-04 21:02:04',	'2020-10-04 21:02:04'),
(23,	10,	'Interaksi belajar',	100,	'2020-10-04 21:02:04',	'2020-10-09 11:58:21'),
(24,	10,	'Prestasi belajar',	NULL,	'2020-10-04 21:02:04',	'2020-10-04 21:02:04'),
(25,	11,	'少年非行',	NULL,	'2020-10-04 21:06:58',	'2020-10-04 21:06:58'),
(26,	12,	'anda tau',	100,	'2020-10-05 18:45:42',	'2020-10-08 00:48:33'),
(27,	12,	'ajg?',	NULL,	'2020-10-05 18:45:42',	'2020-10-05 18:45:42'),
(28,	12,	'asdad',	NULL,	'2020-10-05 18:45:42',	'2020-10-05 18:45:42'),
(29,	13,	'asd',	NULL,	'2020-10-05 18:45:42',	'2020-10-05 18:45:42'),
(30,	13,	'asdsd',	100,	'2020-10-05 18:45:42',	'2020-10-11 19:27:44'),
(31,	13,	'hmm',	NULL,	'2020-10-05 19:05:37',	'2020-10-11 19:27:44'),
(32,	13,	'aa',	NULL,	'2020-10-07 20:17:23',	'2020-10-07 20:17:23'),
(33,	15,	'sampel acak',	NULL,	'2020-10-08 21:07:39',	'2020-10-09 20:52:27'),
(34,	15,	'sampel representatif',	100,	'2020-10-08 21:07:39',	'2020-10-09 20:52:27'),
(35,	15,	'sampel khusus, yaitu kelas',	NULL,	'2020-10-09 20:52:27',	'2020-10-09 20:52:27'),
(36,	15,	'sampel purposif',	NULL,	'2020-10-09 20:52:27',	'2020-10-09 20:52:27'),
(37,	16,	'daya inovasi pada diri guru',	NULL,	'2020-10-09 20:52:27',	'2020-10-09 20:52:27'),
(38,	16,	'kualitas pendidikan di sekolah yang bersangkutan',	NULL,	'2020-10-09 20:52:27',	'2020-10-09 22:18:37'),
(39,	16,	'kemampuan guru di bidang instruksional',	NULL,	'2020-10-09 20:52:27',	'2020-10-11 18:08:11'),
(40,	16,	'kualitas pembelajaran di kelas',	100,	'2020-10-09 20:52:27',	'2020-10-11 18:08:11');

DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE `campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `campaign_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_user_id_foreign` (`user_id`),
  KEY `campaigns_campaign_type_campaign_id_index` (`campaign_type`,`campaign_id`),
  CONSTRAINT `campaigns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `campaigns` (`id`, `user_id`, `value`, `created_at`, `updated_at`, `campaign_type`, `campaign_id`) VALUES
(26,	1,	100.00,	'2020-10-08 23:23:49',	'2020-10-11 21:36:03',	'App\\Models\\Pretest',	2),
(27,	1,	7.43,	'2020-10-08 23:30:58',	'2020-10-09 22:25:33',	'App\\Models\\Pretest',	1),
(29,	1,	0.00,	'2020-10-09 21:22:21',	'2020-10-09 22:23:37',	'App\\Models\\Pretest',	3),
(31,	1,	50.00,	'2020-10-11 19:08:48',	'2020-10-11 19:28:35',	'App\\Models\\Posttest',	1),
(32,	3,	0.00,	'2020-10-11 23:16:40',	'2020-10-11 23:16:40',	'App\\Models\\Pretest',	3),
(33,	3,	21.57,	'2020-10-12 00:33:03',	'2020-10-12 00:43:34',	'App\\Models\\Pretest',	1),
(34,	3,	50.00,	'2020-10-12 00:37:27',	'2020-10-12 00:37:27',	'App\\Models\\Posttest',	1);

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1,	NULL,	1,	'Category 1',	'category-1',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(2,	NULL,	1,	'Category 2',	'category-2',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56');

DROP TABLE IF EXISTS `classroom_researches`;
CREATE TABLE `classroom_researches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `year` year(4) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educational_level_id` bigint(20) unsigned DEFAULT NULL,
  `school_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classroom_researches_educational_level_id_foreign` (`educational_level_id`),
  KEY `classroom_researches_user_id_foreign` (`user_id`),
  CONSTRAINT `classroom_researches_educational_level_id_foreign` FOREIGN KEY (`educational_level_id`) REFERENCES `educational_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `classroom_researches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `classroom_researches` (`id`, `user_id`, `year`, `title`, `educational_level_id`, `school_address`, `school_name`, `created_at`, `updated_at`) VALUES
(57,	1,	'2020',	'asd',	2,	'asd',	'asd',	'2020-10-06 20:49:22',	'2020-10-06 20:49:22'),
(58,	1,	'2020',	'asd',	2,	'as',	'asd',	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(59,	1,	'2020',	'asd',	2,	'as',	'asd',	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(60,	1,	'2020',	'asd',	2,	'as',	'asd',	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(61,	1,	'2020',	'Klasifikasi',	3,	'asdasd',	'SMK',	'2020-10-06 21:31:35',	'2020-10-06 21:31:35'),
(62,	1,	'2020',	'Klasifikasi',	3,	'asdasd',	'SMK',	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(63,	1,	'2020',	'Klasifikasi',	3,	'asdasd',	'SMK',	'2020-10-06 21:31:56',	'2020-10-06 21:31:56'),
(64,	3,	'2020',	'Sempak',	2,	'sadadasd',	'SMP 1 Kudus',	'2020-10-12 00:05:19',	'2020-10-12 00:05:19'),
(65,	1,	'2020',	'test',	2,	'test',	'test',	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(66,	1,	'2021',	'PENGGUNAAN MULTIMEDIA INTERAKTIF DAN WEBBLOG UNTUK MENINGKATKAN HASIL BELAJAR PADA MATERI SEJARAH NABI MUHAMMAD SAW. DI KELAS VIIA SMPN 7 SEMARANG',	2,	'Jl. Imam Bonjol 191A',	'SMPN 7 Semarang',	'2021-06-13 23:38:07',	'2021-06-13 23:38:07');

DROP TABLE IF EXISTS `classroom_research_contents`;
CREATE TABLE `classroom_research_contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `classroom_research_id` bigint(20) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plagiarism_score` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classroom_research_contents_classroom_research_id_foreign` (`classroom_research_id`),
  CONSTRAINT `classroom_research_contents_classroom_research_id_foreign` FOREIGN KEY (`classroom_research_id`) REFERENCES `classroom_researches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `classroom_research_contents` (`id`, `classroom_research_id`, `name`, `value`, `plagiarism_score`, `created_at`, `updated_at`) VALUES
(331,	57,	'A. Pendahuluan',	'<p>asu</p>',	0,	'2020-10-06 20:49:22',	'2020-10-06 20:49:23'),
(332,	57,	'B. Rumusan Masalah',	'<p>asu</p>',	0,	'2020-10-06 20:49:22',	'2020-10-06 20:49:23'),
(333,	57,	'C. Tujuan Penelitian',	'<p>asu</p>',	0,	'2020-10-06 20:49:22',	'2020-10-06 20:49:23'),
(334,	57,	'D. Kemanfaatan Hasil Penelitian',	'<p>asu</p>',	0,	'2020-10-06 20:49:22',	'2020-10-06 20:49:23'),
(335,	57,	'E. KAJIAN PUSTAKA',	'<p>asu</p>',	0,	'2020-10-06 20:49:23',	'2020-10-06 20:49:23'),
(336,	57,	'F. METODE PENELITIAN',	'<p>asu</p>',	0,	'2020-10-06 20:49:23',	'2020-10-06 20:49:23'),
(337,	58,	'A. Pendahuluan',	'<p>asda</p>',	57,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(338,	58,	'B. Rumusan Masalah',	'<p>asd</p>',	67,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(339,	58,	'C. Tujuan Penelitian',	'<p>asd</p>',	67,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(340,	58,	'D. Kemanfaatan Hasil Penelitian',	'<p>asd</p>',	67,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(341,	58,	'E. KAJIAN PUSTAKA',	'<p>asd</p>',	67,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(342,	58,	'F. METODE PENELITIAN',	'<p>asd</p>',	67,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(343,	59,	'A. Pendahuluan',	'<p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum.</span></p>',	1,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(344,	59,	'B. Rumusan Masalah',	'<p><span style=\"color: rgb(0, 0, 0);\">Sudah merupakan fakta bahwa seorang pembaca akan terpengaruh oleh isi tulisan dari sebuah halaman saat ia melihat tata letaknya. Maksud penggunaan Lorem Ipsum adalah karena ia kurang lebih memiliki penyebaran huruf yang normal, ketimbang menggunakan kalimat seperti \"Bagian isi disini, bagian isi disini\", sehingga ia seolah menjadi naskah Inggris yang bisa dibaca. Banyak paket Desktop Publishing dan editor situs web yang kini menggunakan Lorem Ipsum sebagai contoh teks. Karenanya pencarian terhadap kalimat \"Lorem Ipsum\" akan berujung pada banyak situs web yang masih dalam tahap pengembangan. Berbagai versi juga telah berubah dari tahun ke tahun, kadang karena tidak sengaja, kadang karena disengaja (misalnya karena dimasukkan unsur humor atau semacamnya)</span></p>',	2,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(345,	59,	'C. Tujuan Penelitian',	'<p><span style=\"color: rgb(0, 0, 0);\">Tidak seperti anggapan banyak orang, Lorem Ipsum bukanlah teks-teks yang diacak. Ia berakar dari sebuah naskah sastra latin klasik dari era 45 sebelum masehi, hingga bisa dipastikan usianya telah mencapai lebih dari 2000 tahun. Richard McClintock, seorang professor Bahasa Latin dari Hampden-Sidney College di Virginia, mencoba mencari makna salah satu kata latin yang dianggap paling tidak jelas, yakni consectetur, yang diambil dari salah satu bagian Lorem Ipsum. Setelah ia mencari maknanya di di literatur klasik, ia mendapatkan sebuah sumber yang tidak bisa diragukan. Lorem Ipsum berasal dari bagian 1.10.32 dan 1.10.33 dari naskah \"de Finibus Bonorum et Malorum\" (Sisi Ekstrim dari Kebaikan dan Kejahatan) karya Cicero, yang ditulis pada tahun 45 sebelum masehi. BUku ini adalah risalah dari teori etika yang sangat terkenal pada masa Renaissance. Baris pertama dari Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", berasal dari sebuah baris di bagian 1.10.32.</span></p>',	1,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(346,	59,	'D. Kemanfaatan Hasil Penelitian',	'<p><span style=\"color: rgb(0, 0, 0);\">Nulla efficitur felis a efficitur volutpat. Suspendisse id tincidunt eros. Maecenas eu nulla eget libero iaculis sagittis. Morbi cursus nisl sit amet est pharetra ornare. Morbi eget ipsum tincidunt, elementum diam ut, efficitur dolor. Sed et finibus nisi. Sed semper purus at mauris aliquam condimentum. Praesent ac fermentum velit. Nullam sit amet pharetra magna, tempus faucibus turpis. Vivamus pharetra quam at dictum imperdiet.</span></p>',	1,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(347,	59,	'E. KAJIAN PUSTAKA',	'<p><span style=\"color: rgb(0, 0, 0);\">Sed in lectus sollicitudin, tempus purus et, finibus mauris. Mauris quis mi dictum, commodo ante id, lacinia orci. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam lacus neque, pretium in orci sit amet, porttitor ultrices elit. Morbi finibus eu dui vel finibus. Nullam sodales consectetur felis, vitae auctor arcu. Sed nec posuere nibh. Ut nec lectus ut ligula convallis euismod ut bibendum diam. Curabitur at lorem eu nisi facilisis ultrices in et metus. Cras mollis erat vitae varius ullamcorper. Phasellus consequat accumsan lorem in gravida. Nulla congue ligula massa, eget convallis lacus tempus nec. Morbi quis ipsum malesuada mi commodo pulvinar in sed erat. Morbi quis ex lectus.</span></p>',	1,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(348,	59,	'F. METODE PENELITIAN',	'<p><span style=\"color: rgb(0, 0, 0);\">Aliquam quam mauris, feugiat at arcu eget, tristique dictum justo. Donec eleifend sollicitudin nisi ut pellentesque. Proin congue aliquam massa, at pulvinar risus placerat nec. Morbi at eros laoreet, eleifend orci nec, hendrerit libero. Donec non venenatis nibh. Nulla magna ante, cursus eget velit iaculis, feugiat convallis erat. Curabitur quis imperdiet est, at consequat dolor. Pellentesque tristique efficitur dui, vel iaculis quam feugiat id. Nam finibus lacus ac convallis mattis. Proin gravida lorem id sem maximus, ut consequat nulla pharetra. Suspendisse elementum sit amet nibh quis aliquam. Maecenas maximus efficitur elit. Nam accumsan est et elit molestie volutpat. Morbi sit amet tempor est.</span></p>',	1,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(349,	60,	'A. Pendahuluan',	'<p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum.</span></p>',	12,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(350,	60,	'B. Rumusan Masalah',	'<p><span style=\"color: rgb(0, 0, 0);\">Sudah merupakan fakta bahwa seorang pembaca akan terpengaruh oleh isi tulisan dari sebuah halaman saat ia melihat tata letaknya. Maksud penggunaan Lorem Ipsum adalah karena ia kurang lebih memiliki penyebaran huruf yang normal, ketimbang menggunakan kalimat seperti \"Bagian isi disini, bagian isi disini\", sehingga ia seolah menjadi naskah Inggris yang bisa dibaca. Banyak paket Desktop Publishing dan editor situs web yang kini menggunakan Lorem Ipsum sebagai contoh teks. Karenanya pencarian terhadap kalimat \"Lorem Ipsum\" akan berujung pada banyak situs web yang masih dalam tahap pengembangan. Berbagai versi juga telah berubah dari tahun ke tahun, kadang karena tidak sengaja, kadang karena disengaja (misalnya karena dimasukkan unsur humor atau semacamnya)</span></p>',	13,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(351,	60,	'C. Tujuan Penelitian',	'<p><span style=\"color: rgb(0, 0, 0);\">Tidak seperti anggapan banyak orang, Lorem Ipsum bukanlah teks-teks yang diacak. Ia berakar dari sebuah naskah sastra latin klasik dari era 45 sebelum masehi, hingga bisa dipastikan usianya telah mencapai lebih dari 2000 tahun. Richard McClintock, seorang professor Bahasa Latin dari Hampden-Sidney College di Virginia, mencoba mencari makna salah satu kata latin yang dianggap paling tidak jelas, yakni consectetur, yang diambil dari salah satu bagian Lorem Ipsum. Setelah ia mencari maknanya di di literatur klasik, ia mendapatkan sebuah sumber yang tidak bisa diragukan. Lorem Ipsum berasal dari bagian 1.10.32 dan 1.10.33 dari naskah \"de Finibus Bonorum et Malorum\" (Sisi Ekstrim dari Kebaikan dan Kejahatan) karya Cicero, yang ditulis pada tahun 45 sebelum masehi. BUku ini adalah risalah dari teori etika yang sangat terkenal pada masa Renaissance. Baris pertama dari Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", berasal dari sebuah baris di bagian 1.10.32.</span></p>',	12,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(352,	60,	'D. Kemanfaatan Hasil Penelitian',	'<p><span style=\"color: rgb(0, 0, 0);\">Nulla efficitur felis a efficitur volutpat. Suspendisse id tincidunt eros. Maecenas eu nulla eget libero iaculis sagittis. Morbi cursus nisl sit amet est pharetra ornare. Morbi eget ipsum tincidunt, elementum diam ut, efficitur dolor. Sed et finibus nisi. Sed semper purus at mauris aliquam condimentum. Praesent ac fermentum velit. Nullam sit amet pharetra magna, tempus faucibus turpis. Vivamus pharetra quam at dictum imperdiet.</span></p>',	12,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(353,	60,	'E. KAJIAN PUSTAKA',	'<p><span style=\"color: rgb(0, 0, 0);\">Sed in lectus sollicitudin, tempus purus et, finibus mauris. Mauris quis mi dictum, commodo ante id, lacinia orci. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam lacus neque, pretium in orci sit amet, porttitor ultrices elit. Morbi finibus eu dui vel finibus. Nullam sodales consectetur felis, vitae auctor arcu. Sed nec posuere nibh. Ut nec lectus ut ligula convallis euismod ut bibendum diam. Curabitur at lorem eu nisi facilisis ultrices in et metus. Cras mollis erat vitae varius ullamcorper. Phasellus consequat accumsan lorem in gravida. Nulla congue ligula massa, eget convallis lacus tempus nec. Morbi quis ipsum malesuada mi commodo pulvinar in sed erat. Morbi quis ex lectus.</span></p>',	12,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(354,	60,	'F. METODE PENELITIAN',	'<p><span style=\"color: rgb(0, 0, 0);\">Aliquam quam mauris, feugiat at arcu eget, tristique dictum justo. Donec eleifend sollicitudin nisi ut pellentesque. Proin congue aliquam massa, at pulvinar risus placerat nec. Morbi at eros laoreet, eleifend orci nec, hendrerit libero. Donec non venenatis nibh. Nulla magna ante, cursus eget velit iaculis, feugiat convallis erat. Curabitur quis imperdiet est, at consequat dolor. Pellentesque tristique efficitur dui, vel iaculis quam feugiat id. Nam finibus lacus ac convallis mattis. Proin gravida lorem id sem maximus, ut consequat nulla pharetra. Suspendisse elementum sit amet nibh quis aliquam. Maecenas maximus efficitur elit. Nam accumsan est et elit molestie volutpat. Morbi sit amet tempor est.</span></p>',	11,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(355,	61,	'A. Pendahuluan',	'<p>Klasifikasi adalah suatu permodelan yang dilakukan untuk menentukan sebuah record pada data baru ke salah satu dari beberapa kategori yang telah didefinisikan sebelumnya, yaitu bagaimana mempelajari sekumpulan data sehingga dihasilkan aturan yang bisa mengklasifikasi atau mengenali data-data baru yang belum pernah dipelajari (Zaki &amp; Meira, 2014, p. 34)</p>',	11,	'2020-10-06 21:31:35',	'2020-10-06 21:31:35'),
(356,	61,	'B. Rumusan Masalah',	'<p>Pada klasifikasi, langkah yang paling utama adalah menyediakan training set (data latih) dengan records yang label class yang telah diketahui. Setelah itu, learning algorithm membuat model dengan masukan berupa training set yang telah disiapkan</p>',	10,	'2020-10-06 21:31:35',	'2020-10-06 21:31:36'),
(357,	61,	'C. Tujuan Penelitian',	'<p>Model yang dibuat akan mempelajari pola dari dari training set tersebut, yang kemudian digunakan untuk memprediksi label class pada pada test set yang belum diketahui label class-nya (Tan, Steinbach, &amp; Kumar, 2006, pp. 148–149). Proses untuk membangun klasifikasi bisa dilihat pada Gambar 2</p>',	9,	'2020-10-06 21:31:35',	'2020-10-06 21:31:36'),
(358,	61,	'D. Kemanfaatan Hasil Penelitian',	'<p>Klasifikasi data memainkan peran untuk menentukan layak atau tidaknya suatu data secara objektif. Setelah model klasifikasi dibangun, akan dibandingkan dengan model yang lain untuk memilih yang terbaik</p>',	11,	'2020-10-06 21:31:35',	'2020-10-06 21:31:36'),
(359,	61,	'E. KAJIAN PUSTAKA',	'<p>Menurut Han et al. (2012), metode K-Nearest Neighbor (KNN) pertama kali diperkenalkan pada awal tahun 1950 (p. 406). Metode klasifikasi KNN bekerja dengan baik saat diberikan data latih yang besar tetapi metode ini masih belum populer, hingga pada tahun 1960 metode ini mulai terkenal ketika ada peningkatan daya komputasi. Sejak saat itu metode ini telah banyak digunakan di bidang pengenalan pola. KNN paling sering digunakan dalam klasifikasi, meskipun tidak jarang digunakan untuk estimasi dan prediksi (Larose &amp; Larose, 2014, p. 150). KNN merupakan salah satu algoritme klasifikasi paling sederhana untuk supervised learning (Goel &amp; Mahajan, 2017, p. 166).&nbsp;</p>',	8,	'2020-10-06 21:31:35',	'2020-10-06 21:31:36'),
(360,	61,	'F. METODE PENELITIAN',	'<p>Klasifikasi KNN dilakukan dengan membandingkan jarak antara data latih dengan data tes. Ketika ada masukan data tes, maka KNN mencari jarak terdekat (Euclidean distance) data tes terhadap data latih yang diketahui. Matrik Euclidean distance digunakan untuk menentukan kedekatan titik-titik data/jarak antar data dalam K-Nearest Neighbor (Larose &amp; Larose, 2014, pp. 150-155).&nbsp;</p>',	11,	'2020-10-06 21:31:35',	'2020-10-06 21:31:36'),
(361,	62,	'A. Pendahuluan',	'<p>Klasifikasi adalah suatu permodelan yang dilakukan untuk menentukan sebuah record pada data baru ke salah satu dari beberapa kategori yang telah didefinisikan sebelumnya, yaitu bagaimana mempelajari sekumpulan data sehingga dihasilkan aturan yang bisa mengklasifikasi atau mengenali data-data baru yang belum pernah dipelajari (Zaki &amp; Meira, 2014, p. 34)</p>',	18,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(362,	62,	'B. Rumusan Masalah',	'<p>Pada klasifikasi, langkah yang paling utama adalah menyediakan training set (data latih) dengan records yang label class yang telah diketahui. Setelah itu, learning algorithm membuat model dengan masukan berupa training set yang telah disiapkan</p>',	17,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(363,	62,	'C. Tujuan Penelitian',	'<p>Model yang dibuat akan mempelajari pola dari dari training set tersebut, yang kemudian digunakan untuk memprediksi label class pada pada test set yang belum diketahui label class-nya (Tan, Steinbach, &amp; Kumar, 2006, pp. 148–149). Proses untuk membangun klasifikasi bisa dilihat pada Gambar 2</p>',	14,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(364,	62,	'D. Kemanfaatan Hasil Penelitian',	'<p>Klasifikasi data memainkan peran untuk menentukan layak atau tidaknya suatu data secara objektif. Setelah model klasifikasi dibangun, akan dibandingkan dengan model yang lain untuk memilih yang terbaik</p>',	18,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(365,	62,	'E. KAJIAN PUSTAKA',	'<p>Menurut Han et al. (2012), metode K-Nearest Neighbor (KNN) pertama kali diperkenalkan pada awal tahun 1950 (p. 406). Metode klasifikasi KNN bekerja dengan baik saat diberikan data latih yang besar tetapi metode ini masih belum populer, hingga pada tahun 1960 metode ini mulai terkenal ketika ada peningkatan daya komputasi. Sejak saat itu metode ini telah banyak digunakan di bidang pengenalan pola. KNN paling sering digunakan dalam klasifikasi, meskipun tidak jarang digunakan untuk estimasi dan prediksi (Larose &amp; Larose, 2014, p. 150). KNN merupakan salah satu algoritme klasifikasi paling sederhana untuk supervised learning (Goel &amp; Mahajan, 2017, p. 166).&nbsp;</p>',	13,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(366,	62,	'F. METODE PENELITIAN',	'<p>Klasifikasi KNN dilakukan dengan membandingkan jarak antara data latih dengan data tes. Ketika ada masukan data tes, maka KNN mencari jarak terdekat (Euclidean distance) data tes terhadap data latih yang diketahui. Matrik Euclidean distance digunakan untuk menentukan kedekatan titik-titik data/jarak antar data dalam K-Nearest Neighbor (Larose &amp; Larose, 2014, pp. 150-155).&nbsp;</p>',	16,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(367,	63,	'A. Pendahuluan',	'<p>Klasifikasi adalah suatu permodelan yang dilakukan untuk menentukan sebuah record pada data baru ke salah satu dari beberapa kategori yang telah didefinisikan sebelumnya, yaitu bagaimana mempelajari sekumpulan data sehingga dihasilkan aturan yang bisa mengklasifikasi atau mengenali data-data baru yang belum pernah dipelajari (Zaki &amp; Meira, 2014, p. 34)</p>',	22,	'2020-10-06 21:31:56',	'2020-10-06 21:31:56'),
(368,	63,	'B. Rumusan Masalah',	'<p>Pada klasifikasi, langkah yang paling utama adalah menyediakan training set (data latih) dengan records yang label class yang telah diketahui. Setelah itu, learning algorithm membuat model dengan masukan berupa training set yang telah disiapkan</p>',	22,	'2020-10-06 21:31:56',	'2020-10-06 21:31:57'),
(369,	63,	'C. Tujuan Penelitian',	'<p>Model yang dibuat akan mempelajari pola dari dari training set tersebut, yang kemudian digunakan untuk memprediksi label class pada pada test set yang belum diketahui label class-nya (Tan, Steinbach, &amp; Kumar, 2006, pp. 148–149). Proses untuk membangun klasifikasi bisa dilihat pada Gambar 2</p>',	17,	'2020-10-06 21:31:56',	'2020-10-06 21:31:57'),
(370,	63,	'D. Kemanfaatan Hasil Penelitian',	'<p>Klasifikasi data memainkan peran untuk menentukan layak atau tidaknya suatu data secara objektif. Setelah model klasifikasi dibangun, akan dibandingkan dengan model yang lain untuk memilih yang terbaik</p>',	22,	'2020-10-06 21:31:56',	'2020-10-06 21:31:57'),
(371,	63,	'E. KAJIAN PUSTAKA',	'<p>Menurut Han et al. (2012), metode K-Nearest Neighbor (KNN) pertama kali diperkenalkan pada awal tahun 1950 (p. 406). Metode klasifikasi KNN bekerja dengan baik saat diberikan data latih yang besar tetapi metode ini masih belum populer, hingga pada tahun 1960 metode ini mulai terkenal ketika ada peningkatan daya komputasi. Sejak saat itu metode ini telah banyak digunakan di bidang pengenalan pola. KNN paling sering digunakan dalam klasifikasi, meskipun tidak jarang digunakan untuk estimasi dan prediksi (Larose &amp; Larose, 2014, p. 150). KNN merupakan salah satu algoritme klasifikasi paling sederhana untuk supervised learning (Goel &amp; Mahajan, 2017, p. 166).&nbsp;</p>',	17,	'2020-10-06 21:31:56',	'2020-10-06 21:31:57'),
(372,	63,	'F. METODE PENELITIAN',	'<p>Klasifikasi KNN dilakukan dengan membandingkan jarak antara data latih dengan data tes. Ketika ada masukan data tes, maka KNN mencari jarak terdekat (Euclidean distance) data tes terhadap data latih yang diketahui. Matrik Euclidean distance digunakan untuk menentukan kedekatan titik-titik data/jarak antar data dalam K-Nearest Neighbor (Larose &amp; Larose, 2014, pp. 150-155).&nbsp;</p>',	19,	'2020-10-06 21:31:56',	'2020-10-06 21:31:57'),
(373,	64,	'A. Pendahuluan',	'<p>jadi gini mas</p>',	14,	'2020-10-12 00:05:19',	'2020-10-12 00:05:20'),
(374,	64,	'B. Rumusan Masalah',	'<p>Anda tahu		</p>',	0,	'2020-10-12 00:05:19',	'2020-10-12 00:05:20'),
(375,	64,	'C. Tujuan Penelitian',	'<p>jadi gini mas</p>',	14,	'2020-10-12 00:05:19',	'2020-10-12 00:05:20'),
(376,	64,	'D. Kemanfaatan Hasil Penelitian',	'<p>Anda tahu</p>',	0,	'2020-10-12 00:05:19',	'2020-10-12 00:05:20'),
(377,	64,	'E. KAJIAN PUSTAKA',	'<p>Anda tah</p>',	11,	'2020-10-12 00:05:19',	'2020-10-12 00:05:20'),
(378,	64,	'F. METODE PENELITIAN',	'<p>Anda tahu		</p>',	0,	'2020-10-12 00:05:19',	'2020-10-12 00:05:20'),
(379,	65,	'A. Pendahuluan',	'<p>test</p>',	10,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(380,	65,	'B. Rumusan Masalah',	'<p>test</p>',	10,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(381,	65,	'C. Tujuan Penelitian',	'<p>test</p>',	10,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(382,	65,	'D. Kemanfaatan Hasil Penelitian',	'<p>test</p>',	10,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(383,	65,	'E. KAJIAN PUSTAKA',	'<p>test</p>',	10,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(384,	65,	'F. METODE PENELITIAN',	'<p>jadi gini, anda tau?</p>',	14,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(385,	66,	'A. Pendahuluan',	'<p class=\"ql-align-justify\">	Perkembangan masyarakat dunia pada umumnya dan masyarakat Indonesia khususnya sudah memasuki masyarakat informasi yang merupakan kelanjutan dari masyarakat modern. Adapun ciri-cirinya: bersifat rasional, berorientasi ke masa depan, terbuka, menghargai waktu, kreatif, mandiri, dan inovatif (Noer, 1987: 24). Terhadap kondisi tersebut pendidikan seharusnya meresponnya dengan positif. Hal ini ditegaskan Muhajir (2011: 22), pendidikan harus dapat memberikan informasi yang paling berharga mengenai pegangan hidup dan masa depan di dunia, serta membantu anak didik dalam mempersiapkan kebutuhan yang esensial untuk menghadapi perubahan.</p><p class=\"ql-align-justify\">	Paradigma baru pendidikan melihat guru bukan lagi dianggap sebagai satu-satunya sumber informasi, melainkan hanya salah satu saja. Sumber informasi yang dapat diakses peserta didik adalah mass media baik media cetak maupun elektronik, internet dan lain sebaganya (Nata, 2010: 145-146). Selain itu, pemahaman terhadap karakteristik peserta didik secara benar dan baik merupakan salah satu persyaratan yang tidak boleh ditinggalkan oleh guru dalam menghadapi peserta didik. </p><p class=\"ql-align-justify\">	Kondisi tersebut didasarkan pada beberapa alasan, yakni: pertama, dengan memahami peserta didik dapat menentukan metode dan pendekatan dalam belajar mengajar. Kedua, dengan memahami peserta didik dapat menetapkan materi pelajaran yang sesuai dengan tingkat kemampuannya. Ketiga, dengan memahami peserta didik dapat memberikan perlakuan yang sesuai dengan fitrah, bakat, kecenderungan, dan kemanusiaannya (Nata, 2010: 174-175). </p><p class=\"ql-align-justify\">	Diakui atau tidak sekarang ini tidak sedikit guru dalam pembelajaran di kelas masih monoton (ceramah). Termasuk didalamnya guru mata pelajaran Pendidikan Agama Islam (PAI). Guru mengajarkan di depan kelas, sedangkan peserta didik senang atau tidak harus mau mendengarkannya. Akibatnya, peserta didik merasa bosan dengan mata pelajaran yang diajarkan. Hal ini ditunjukkan dengan peserta didik yang mengantuk, berbicara dengan teman, sering ijin keluar, menulis atau menggambar dan aktifitas lainnya yang tidak ada hubungan dengan mata pelajaran tersebut.&nbsp;</p><p class=\"ql-align-justify\">	Pembelajaran yang seperti itu, menurut Hensley (2007: 4-5) akan menjadi peserta didik yang asing di sekolahnya. Kemudian muncul masalah kekerasan, perkelahian, tidak masuk sekolah, dan mengganggu temannya. Kondisi tersebut, diantara penyebabnya adalah dominasi guru di kelas. Sedangkkan Trianto (2007: 1) kenyataan tersebut merupakan salah satu pokok dalam pembelajaran di sekolah sekarang ini. Hal ini nampak dari rerata hasil belajar peserta didik yang senantiasa masih sangat memprihatinkan.&nbsp;</p><p><br></p>',	6,	'2021-06-13 23:38:07',	'2021-06-13 23:38:08'),
(386,	66,	'B. Rumusan Masalah',	'<p class=\"ql-align-justify\">	Berdasarkan latar belakang di atas, maka dalam penelitian ini dapat dirumuskan masalah sebagai berikut: </p><p class=\"ql-align-justify\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bagaimanakah peningkatan hasil belajar pada materi sejarah Nabi Muhammad Saw setelah menggunakan multimedia interaktif dan webblog di kelas VIIA SMPN 7 Semarang ?</p><p class=\"ql-align-justify\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bagaimanakah penggunaan multimedia interaktif dan webblog pada materi sejarah Nabi Muhammad Saw dapat mengubah perilaku belajar di kelas VIIA SMP Negeri 7 Semarang ?</p><p><br></p>',	10,	'2021-06-13 23:38:07',	'2021-06-13 23:38:08'),
(387,	66,	'C. Tujuan Penelitian',	'<p class=\"ql-align-justify\">	Berdasarkan dari rumusan masalah yang di atas, maka penelitian ini bertujuan sebagai berikut:</p><p class=\"ql-align-justify\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;untuk mendeskripsikan penggunaan multimedia interaktif dan webblog dapat meningkatkan hasil belajar pada materi sejarah Nabi Muhammad Saw di kelas VIIA SMPN 7 Semarang;</p><p class=\"ql-align-justify\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;untuk mendekripsikan penggunaan multimedia interakktif dan webblog dapat&nbsp;</p><p><br></p>',	12,	'2021-06-13 23:38:07',	'2021-06-13 23:38:08'),
(388,	66,	'D. Kemanfaatan Hasil Penelitian',	'<p class=\"ql-align-justify\">	Adapun manfaat dalam penelitian ini dibagi menjadi dua, yakni manfaat teoritis dan praktis. Penjelasan kedua manfaat tersebut dijelaskan sebagai berikut:</p><p class=\"ql-align-justify\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manfaat Teoritis</p><p class=\"ql-align-justify\">	Penelitian ini diharapkan dapat menambah kajian tentang penggunaan multimedia interaktif dan webblog.</p><p class=\"ql-align-justify\">	&nbsp;</p><p class=\"ql-align-justify\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manfaat Praktis</p><p class=\"ql-align-justify\">	Pada sisi kajian praktis, hasil penelitian ini nantinya diharapkan dapat memberikan manfaat, antara lain:</p><p class=\"ql-align-justify\">a)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bagi peserta didik, yakni peserta lebih tertarik mempelajari PAI dan akhirnya lebih memahami PAI dan mempraktikkannya; &nbsp;</p><p class=\"ql-align-justify\">b)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bagi SMP Negeri 7 Semarang, yakni meningkatkan kualitas pembelajaran PAI. Peningkatan kualitas pembelajaran PAI di SMP Negeri 7 Semarang akan menularkan perbaikan kualitas pembelajaran mata pelajaran lain. </p><p class=\"ql-align-justify\">&nbsp;</p><p><br></p>',	9,	'2021-06-13 23:38:07',	'2021-06-13 23:38:08'),
(389,	66,	'E. KAJIAN PUSTAKA',	'<p class=\"ql-align-justify\">	Ada beberapa hasil penelitian yang dapat peneliti jadikan pembanding dalam penulisan tesis ini, yaitu:</p><p class=\"ql-align-justify\">	<em>Pertama,</em> penelitian tesis yang dilakukan Huda (2010) yang berjudul, “Pengaruh Pemanfaatan Internet dan Buku Teks Pelajaran terhadap Prestasi Belajar Siswa MTs Tholabuddin Masin Warungasem Batang Tahun 2009/2010”. Hasil dalam penelitian tersebut adalah adanya pengaruh positif yang signifikan antara pemanfaatan internet dan buku teks pelajaran terhadap prestasi belajar siswa MTs Tholabuddin Masin. Semakin tinggi kemampuan memanfaatkan internet dan memanfaatkan buku teks pelajaran oleh siswa MTs Tholabuddin Masin, maka akan semakin tinggi pula prestasi belajarnya. &nbsp;Sebaliknya semakin rendah kemampuan memanfaatkan internet dan memanfaatkan buku teks pelajaran oleh siswa MTs Tholabuddin Masin, maka akan semakin rendah pula prestasi belajarnya. </p><p class=\"ql-align-justify\">	Perbedaan dengan penelitian yang peneliti lakukan adalah penekakanan pada model pembelajaran PAI menggunakan webblog dan multimedia interaktif secara kualitatif. &nbsp;Selain itu internet yang dikaji Huda &nbsp;bersifat umum dan kuantitatif, sedangkan kajian peneliti yang akan lakukan spesifik webblog. </p><p class=\"ql-align-justify\">	<em style=\"color: black;\">Kedua,</em><span style=\"color: black;\"> penelitian</span><strong> tesis Ahmad Luthfi (2010) yang berjudul, “</strong><span style=\"color: black;\">Pemanfaatan teknologi web sebagai media interaktif dan pengaruhnya terhadap minat belajar bagi mahasiswa”. </span>Hasil penelitian tersebut adalah perkembangan teknologi informasi sangat mempengaruhi pola pikir dan kebiasaan masyarakat dalam hal mencari informasi yang dibutuhkan. Teknologi web menjadi garda terdepan dalam jembatan penyampaian dan penyebaran informasi. Adanya media <em>e-learning</em>, e-Book, dan web blog telah terbukti menjadi alternatif bagi kalangan pendidikan dalam berinteraksi dalam proses pembelajaran.&nbsp;Media TIK juga telah dianggap berhasil dalam meningkatkan motivasi dan minat belajar bagi para siswa atau mahasiswa.</p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Perbedaan penelitian yang akan peneliti lakukan adalah media yang digunakan tidak hanya pada website, tetapi juga multimedia interaktif. Selain itu sasaranya juga berbeda, yakni lebih ke peserta didik SMA Negeri 3 Semarang dalam mata pelajaran PAI. </span></p><p class=\"ql-align-justify\">	<em>Ketiga,</em> penelitian tesis Muaraputra Sinaga (2009) yang berjudul, “Pemanfaatan Program Powerpoint dalam Pembelajaran Sejarah di Sekolah Menengah Pertama Negeri 1 Nainggolan Sumatera Utara”. Hasil dalam penelitian tersebut adalah mata pelajaran sejarah makin tersisihkan dalam rumpun ilmu pengetahuan di dunia pendidikan Indonesia, sehingga ikut mempengaruhi minat siswa untuk mempelajarinya secara optimal. </p><p class=\"ql-align-justify\">	&nbsp;Penggunaan media pengajaran berbasis tekhnologi komunikasi dan informasi pada pelajaran sejarah dapat meningkatkan minat dan ketertarikan siswa untuk mempelajari materi pelajaran. Hal ini terbukti dari antusias siswa dalam proses pembelajaran. Media pembelajaran dengan powerpoint dalam mata pelajaran sejarah dapat mengurangi penilaian kuno dan ketinggalan zaman terhadap mata pelajaran ini. Media pengajaran berbasis tekhnologi komunikasi dan informasi, yang dalam hal ini memanfaatkan program <em>microsoft office powerpoint</em>, telah membantu peningkatan penguasaan materi pelajaran sejarah. Terbukti dengan meningkatnya persentase ketuntasan siswa dalam materi pelajaran ini. </p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Perbedaan penelitian yang akan dilakukan peneliti adalah media pembelajarannya adalah multimedia interaktif dan webblog. Selain itu obyek penelitian dan mata pelajaran yang teliti juga berbeda.</span></p><p class=\"ql-align-justify\">	<em style=\"color: black;\">Keempat</em><span style=\"color: black;\">, penelitian tesis yang dilakukan oleh </span><a href=\"mailto:darmadi@ikip.ac.id\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: black;\">Darmadi</a><span style=\"color: black;\"> </span><strong style=\"color: black;\">&nbsp;(2007) yang berjudul “Pemanfaatan program powerpoint dalam Pembelajaran Matematika terhadap prestasi belajar di tinjau dari gaya belajar siswa”. H</strong><span style=\"color: black;\">asil penelitian tersebut adalah pembelajaran dengan menggunakan program powerpoint lebih baik daripada pembelajaran tanpa menggunakan program powerpoint. Pada pembelajaran konvensional, gaya belajar siswa tidak mempengaruhi prestasi siswa matematika. Pada pembelajaran dengan menggunakan program powerpoint, gaya belajar mempengaruhi prestasi belajar dimana prestasi belajar auditorial dan kinestetik adalah sama dan prestasi belajar visual lebih baik daripada keduanya. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Perbedaan penelitian yang akan dilakukan peneliti dengan penelitian ini adalah media pembelajarannya adalah multimedia interaktif dan webblog. Sedangkan penelitian ini hanya menggunakan satu media, yakni program </span><em style=\"color: black;\">microsoft power point</em><span style=\"color: black;\"> &nbsp;Selain itu obyek penelitian dan mata pelajaran yang diteliti juga berbeda.&nbsp;</span></p><p><br></p>',	4,	'2021-06-13 23:38:07',	'2021-06-13 23:38:08'),
(390,	66,	'F. METODE PENELITIAN',	'<p class=\"ql-align-justify\">	<span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">1. Setting Penelitian</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Setting dalam penelitian ini meliputi tiga hal, yakni: tempat penelitian, waktu penelitian, dan siklus. Adapun penjabarannya sebagai berikut:</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;Tempat penelitian</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Penelitian tindakan kelas&nbsp;(PTK) ini dilaksanakan di SMP Negeri 7 Semarang untuk mata pelajaran Pendidikan Agama Islam. Sedangkan subyek penelitian ini adalah kelas VIIA dengan jumlah peserta didik &nbsp;terdiri dari 36 dengan rincian 18 laki-laki dan 18 perempuan.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Waktu penelitian</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Penelitian ini dilaksanakan pada semester II tahun ajaran 2011/2012, yakni bulan Februari-Mei 2011.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Siklus PTK </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">PTK ini dilaksanakan melalui tiga siklus untuk melihat peningkatan hasil belajar dan aktivitas siswa dalam mengikuti mata pelajaran PAI menggunakan multimedia interaktif dan webblog.</span></p><p><strong style=\"color: black;\">2. Persiapan PTK</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Sebelum melakukan PTK perlu membuat berbagai instrumen yang akan digunakan dalam penelitian. Adapun persiapan yaitu menentukan materi yang akan diambil kemudian menyiapkan rencana pelaksanaan pembelajarannya. Selain itu juga akan dibuat perangkat pembelajaran yang berupa: lembar pengamatan; dan lembar evaluasi. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subjek Penelitian</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Dalam PTK ini yang menjadi subjek penelitian adalah siswa kelas VIIA yang terdiri dari 36 siswa dengan komposisi perempuan 18 dan laki-laki 18 siswa.</span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sumber Data</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Sumber data dalam penelitian ini terdiri dari beberapa sumber, yakni siswa, guru atau teman sejawat.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">untuk mendapatkan data tentang hasil belajar dan aktivitas siswa dalam pembelajaran PAI.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;guru atau teman sejawat</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">untuk melihat tingkat keberhasilan pelaksanaan penggunaan powerpoint dan webblog</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">5. Teknik dan Alat Pengumpulan Data</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teknik </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Teknik pengumpulan data dalam penelitian ini adalah tes, observasi, wawancara, dan diskusi.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tes : digunakan untuk mendapatkan data tentang hasil belajar siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Observasi : digunakan untuk mengumpulkan data tentang keaktifan siswa dalam pembelajaran dengan menggunakan multimedia interaktif dan webblog</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wawancara : untuk mendapatkan data tentang tingkat keberhasilan pelaksanaan pembelajaran PAI dengan menggunakan multimedia interaktif dan webblog </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diskusi antarguru dan teman sejawat untuk merefleksikan hasil siklus PTK.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alat Pengumpulan Data</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Alat pengumpulan data dalan PTK ini meliputi tes, observasi, wawancara, kuisioner dan diskusi sebagaimana berikut ini.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tes : menggunakan butir soal/instrument soal untuk mengukur hasil belajar siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Observasi : menggunakan lembar observasi untuk mengukur tingkat partisipasi siswa dalam pembelajaran Pendidikan Agama Islam (PAI).</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wawancara : menggunakan panduan wawancara untuk mengetahui pendapat atau sikap siswa dan teman sejawat tentang penggunaan multimedia interaktif dan webblog dalam pembelajaran PAI</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diskusi : menggunakan lembar pengamatan.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">6. </span><strong style=\"color: black;\">Indikator Kinerja</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Dalam PTK ini yang akan dilihat indikator kinerjanya selain siswa adalah guru, karena guru merupakan fasilitator yang sangat berpengaruh terhadap kinerja siswa.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;Tes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: rata-rata nilai ulangan harian</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;Observasi  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: keaktifan siswa dalam pembelajaran PAI di kelas </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;Dokumentasi &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: kehadiran siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;Observasi  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: hasil observasi</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">&nbsp;</strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">&nbsp;</strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">7.Analisis Data</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Data yang dikumpulkan pada setiap kegiatan observasi dari pelaksanaan siklus penelitian dianalisis secara deskriptif dengan menggunakan teknik persentase untuk melihat kecenderungan yang terjadi dalam pembelajaran.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hasil belajar, yaitu dengan menganalisis nilai rata-rata ulangan harian. Kemudian dikategorikan dalam klasifikasi tinggi, sedang, dan rendah. Catatan: apabila mendapatkan nilai 80-100 termasuk klasifikasi tinggi. Sedangkan 69-80 adalah sedang, dan di bawah 68 adalah rendah.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Minat siswa dalam pembelajaran PAI, yakni dengan menganalisis tingkat ketertarikan siswa dalam proses pembelajaran PAI. Untuk mengetahuinya digunakan cara wawancara. Kemudian dikategorikan dalam klasifikasi tinggi, sedang, dan rendah. Dinyatakan tinggi, jika lebih dari 80% siswa menyatakan sangat berminat. Dinyatakan sedang, apabila ketertarikan siswa antara 69-80%. Dan dinyatakan rendah, apabila ketertarikan siswa berada pada posisi di bawah 68%.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Implementasi pembelajaran PAI menggunakan multimedia interaktif dan webblog, yakni: dengan menanalisis tingkat keberhasilannya kemudian dikategorikan dalam klasifikasi tinggi, sedang, dan rendah. </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">8.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Prosedur Penelitian</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Prosedur penelitian ini melalui dua siklus, yakni: </span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>Siklus 1</u></strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Siklus pertama dalam PTK ini terdiri dari perencanaan, pelaksanaan, pengamatan dan refleksi sebagai berikut:</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Perencanaan (</span><em style=\"color: black;\">Planning</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tim peneliti melakukan analisis kurikulum PAI untuk mengetahui kompetensi dasar yang akan disampaikan kepada siswa dengan menggunakan multimedia interaktif dan webblog;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Membuat rencana pembelajaran PAI;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pembuatan jadwal penelitian;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Membuat bahan pembelajaran </span>salat sunah berjama’ah dan munfarid menggunakan multimedia interaktif dan webblog;</p><p class=\"ql-align-justify\"><span style=\"color: black;\">e.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pembuatan lembar tugas siswa yang berisi tugas dan kegiatan siswa. lembar tugas ini diharapkan mampu mengarahkan fokus perhatian siswa;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">f. &nbsp;&nbsp;Pembuatan instrumen penilaian;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">g. &nbsp;&nbsp;Pembuatan lembar pengamatan;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">h. &nbsp;&nbsp;Pembuatan daftar pertanyaan untuk wawancara.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pelaksanaan (</span><em style=\"color: black;\">Acting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru menyajikan materi pelajaran menggunakan multimedia interaktif</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru memberikan kesempatan kepada peserta didik untuk memberikan tangapan.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Peserta didik memberikan respon yang berupa pertanyaan maupun tangapan</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru memberikan jawaban atas pertanyaan maupun tanggapan dari peserta didik</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">e.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru menjelaskan penggunaan webblog dalam pembelajaran dan menampilkannya di kelas;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">f.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Penguatan pada kesimpulan secara bersama-sama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pengamatan (</span><em style=\"color: black;\">Observation</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Situasi kegiatan pembelajaran</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Keaktifan siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kemampuan siswa dalam diskusi kelompok</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Refleksi (</span><em style=\"color: black;\">Reflecting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dalam tahap refleksi ini, peneliti merefleksikan apa yang telah dilakukan pada siklus pertama terhadap penggunaan powerpoint dan webblog dalam pembelajaran PAI. Isi dari tahap ini dapat berupa kelebihan dan kekurangan terhadap apa yang telah dilaksanakan.</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>Siklus 2</u></strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Seperti halnya siklus pertama dalam PTK ini terdiri dari perencanaan, pelaksanaan, pengamatan dan refleksi sebagai berikut. </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Perencanaan (</span><em style=\"color: black;\">planning</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti membuat rencana pembelajaran berdasarkan hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pelaksanaan (</span><em style=\"color: black;\">acting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Guru melaksanaakan pembelajaran PAI menggunakan multimedia interaktif dan webblog rencana pembelajaran hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pengamatan (</span><em style=\"color: black;\">observation</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti (guru dan teman sejawat) melakukan pengamatan terhadap aktivitas pembelajaran PAI menggunakan multimedia interaktif dan webblog. </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Refleksi (</span><em style=\"color: black;\">reflecting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti melakukan refleksi terhadap pelaksanaan siklus kedua dan menganalisis pelaksanaan pembelajaran menggunakan multimedia interaktif dan webbblog dalam peningkatan hasil pembelajaran materi sejarah Nabi Muhammad Saw di SMP 7 Semarang.</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>&nbsp;</u></strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>Siklus 3</u></strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Seperti halnya siklus pertama dalam PTK ini terdiri dari perencanaan, pelaksanaan, pengamatan dan refleksi sebagai berikut. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">1. Perencanaan (</span><em style=\"color: black;\">planning</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti membuat rencana pembelajaran berdasarkan hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">2. Pelaksanaan (</span><em style=\"color: black;\">acting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Guru melaksanaakan pembelajaran PAI menggunakan multimedia interaktif dan webblog rencana pembelajaran hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">3. Pengamatan (</span><em style=\"color: black;\">observation</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti (guru dan teman sejawat) melakukan pengamatan terhadap aktivitas pembelajaran PAI menggunakan multimedia interaktif dan webblog. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">4. Refleksi (</span><em style=\"color: black;\">reflecting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti melakukan refleksi terhadap pelaksanaan siklus ketiga dan menganalisis serta membuat kesimpulan atas pelaksanaan pembelajaran menggunakan multimedia interaktif dan webbblog dalam peningkatan hasil pembelajaran materi sejarah Nabi Muhammad Saw di SMP 7 Semarang.</span></p><p>&nbsp;</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-justify\">A.&nbsp;&nbsp;&nbsp;<strong>Sistematika Penulisan</strong></p><p class=\"ql-align-justify\">	Sistematika penulisan hasil penelitian ini terdiri atas enam bab adalah sebagai berikut :</p><p class=\"ql-align-justify\">	Bab pertama berisi pendahuluan yang terdiri dari latar belakang masalah, identifikasi masalah, rumusan masalah, tujuan penelitian, manfaat penelitian, kajian pustaka, metode penelitian, dan sistematika penulisan.</p><p class=\"ql-align-justify\">	Bab kedua berisi landasan teori yang menjelaskan pembelajaran PAI, media pembelajaran, multimedia interaktif, webblog dan deskripsi tentang SMA Negeri 3 Semarang</p><p class=\"ql-align-justify\">	Bab ketiga berisi penyajian data dan deskripsi perencanaan pembelajaran PAI menggunakan multimedia interaktif dan webblog di SMA Negeri 3 Semarang. </p><p class=\"ql-align-justify\">	Bab keempat berisi penyajian data dan deskripsi pelaksanaan pembelajaran PAI menggunakan multimedia interaktif dan webblog di SMA Negeri 3 Semarang.</p><p class=\"ql-align-justify\">	Bab kelima berisi tentang evaluasi pelaksanaan pembelajaran PAI menggunakan multimedia interaktif dan webblog di SMA Negeri 3 Semarang.</p><p class=\"ql-align-justify\">	Bab keenam penutup, di dalamnya terdiri dari kesimpulan dan saran-saran.</p><p class=\"ql-align-justify\">	<strong style=\"color: rgba(0, 0, 0, 0.87);\">&nbsp;</strong>	<span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">1. Setting Penelitian</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Setting dalam penelitian ini meliputi tiga hal, yakni: tempat penelitian, waktu penelitian, dan siklus. Adapun penjabarannya sebagai berikut:</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;Tempat penelitian</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Penelitian tindakan kelas&nbsp;(PTK) ini dilaksanakan di SMP Negeri 7 Semarang untuk mata pelajaran Pendidikan Agama Islam. Sedangkan subyek penelitian ini adalah kelas VIIA dengan jumlah peserta didik &nbsp;terdiri dari 36 dengan rincian 18 laki-laki dan 18 perempuan.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Waktu penelitian</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Penelitian ini dilaksanakan pada semester II tahun ajaran 2011/2012, yakni bulan Februari-Mei 2011.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Siklus PTK </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">PTK ini dilaksanakan melalui tiga siklus untuk melihat peningkatan hasil belajar dan aktivitas siswa dalam mengikuti mata pelajaran PAI menggunakan multimedia interaktif dan webblog.</span></p><p><strong style=\"color: black;\">2. Persiapan PTK</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Sebelum melakukan PTK perlu membuat berbagai instrumen yang akan digunakan dalam penelitian. Adapun persiapan yaitu menentukan materi yang akan diambil kemudian menyiapkan rencana pelaksanaan pembelajarannya. Selain itu juga akan dibuat perangkat pembelajaran yang berupa: lembar pengamatan; dan lembar evaluasi. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subjek Penelitian</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Dalam PTK ini yang menjadi subjek penelitian adalah siswa kelas VIIA yang terdiri dari 36 siswa dengan komposisi perempuan 18 dan laki-laki 18 siswa.</span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sumber Data</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Sumber data dalam penelitian ini terdiri dari beberapa sumber, yakni siswa, guru atau teman sejawat.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">untuk mendapatkan data tentang hasil belajar dan aktivitas siswa dalam pembelajaran PAI.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;guru atau teman sejawat</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">untuk melihat tingkat keberhasilan pelaksanaan penggunaan powerpoint dan webblog</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">5. Teknik dan Alat Pengumpulan Data</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teknik </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Teknik pengumpulan data dalam penelitian ini adalah tes, observasi, wawancara, dan diskusi.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tes : digunakan untuk mendapatkan data tentang hasil belajar siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Observasi : digunakan untuk mengumpulkan data tentang keaktifan siswa dalam pembelajaran dengan menggunakan multimedia interaktif dan webblog</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wawancara : untuk mendapatkan data tentang tingkat keberhasilan pelaksanaan pembelajaran PAI dengan menggunakan multimedia interaktif dan webblog </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diskusi antarguru dan teman sejawat untuk merefleksikan hasil siklus PTK.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alat Pengumpulan Data</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Alat pengumpulan data dalan PTK ini meliputi tes, observasi, wawancara, kuisioner dan diskusi sebagaimana berikut ini.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tes : menggunakan butir soal/instrument soal untuk mengukur hasil belajar siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Observasi : menggunakan lembar observasi untuk mengukur tingkat partisipasi siswa dalam pembelajaran Pendidikan Agama Islam (PAI).</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wawancara : menggunakan panduan wawancara untuk mengetahui pendapat atau sikap siswa dan teman sejawat tentang penggunaan multimedia interaktif dan webblog dalam pembelajaran PAI</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diskusi : menggunakan lembar pengamatan.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">6. </span><strong style=\"color: black;\">Indikator Kinerja</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Dalam PTK ini yang akan dilihat indikator kinerjanya selain siswa adalah guru, karena guru merupakan fasilitator yang sangat berpengaruh terhadap kinerja siswa.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;Tes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: rata-rata nilai ulangan harian</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;Observasi  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: keaktifan siswa dalam pembelajaran PAI di kelas </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;Dokumentasi &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: kehadiran siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;Observasi  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: hasil observasi</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">&nbsp;</strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">&nbsp;</strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">7.Analisis Data</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Data yang dikumpulkan pada setiap kegiatan observasi dari pelaksanaan siklus penelitian dianalisis secara deskriptif dengan menggunakan teknik persentase untuk melihat kecenderungan yang terjadi dalam pembelajaran.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hasil belajar, yaitu dengan menganalisis nilai rata-rata ulangan harian. Kemudian dikategorikan dalam klasifikasi tinggi, sedang, dan rendah. Catatan: apabila mendapatkan nilai 80-100 termasuk klasifikasi tinggi. Sedangkan 69-80 adalah sedang, dan di bawah 68 adalah rendah.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Minat siswa dalam pembelajaran PAI, yakni dengan menganalisis tingkat ketertarikan siswa dalam proses pembelajaran PAI. Untuk mengetahuinya digunakan cara wawancara. Kemudian dikategorikan dalam klasifikasi tinggi, sedang, dan rendah. Dinyatakan tinggi, jika lebih dari 80% siswa menyatakan sangat berminat. Dinyatakan sedang, apabila ketertarikan siswa antara 69-80%. Dan dinyatakan rendah, apabila ketertarikan siswa berada pada posisi di bawah 68%.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Implementasi pembelajaran PAI menggunakan multimedia interaktif dan webblog, yakni: dengan menanalisis tingkat keberhasilannya kemudian dikategorikan dalam klasifikasi tinggi, sedang, dan rendah. </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">8.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Prosedur Penelitian</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Prosedur penelitian ini melalui dua siklus, yakni: </span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>Siklus 1</u></strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Siklus pertama dalam PTK ini terdiri dari perencanaan, pelaksanaan, pengamatan dan refleksi sebagai berikut:</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Perencanaan (</span><em style=\"color: black;\">Planning</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tim peneliti melakukan analisis kurikulum PAI untuk mengetahui kompetensi dasar yang akan disampaikan kepada siswa dengan menggunakan multimedia interaktif dan webblog;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Membuat rencana pembelajaran PAI;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pembuatan jadwal penelitian;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Membuat bahan pembelajaran </span>salat sunah berjama’ah dan munfarid menggunakan multimedia interaktif dan webblog;</p><p class=\"ql-align-justify\"><span style=\"color: black;\">e.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pembuatan lembar tugas siswa yang berisi tugas dan kegiatan siswa. lembar tugas ini diharapkan mampu mengarahkan fokus perhatian siswa;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">f. &nbsp;&nbsp;Pembuatan instrumen penilaian;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">g. &nbsp;&nbsp;Pembuatan lembar pengamatan;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">h. &nbsp;&nbsp;Pembuatan daftar pertanyaan untuk wawancara.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pelaksanaan (</span><em style=\"color: black;\">Acting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru menyajikan materi pelajaran menggunakan multimedia interaktif</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru memberikan kesempatan kepada peserta didik untuk memberikan tangapan.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Peserta didik memberikan respon yang berupa pertanyaan maupun tangapan</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru memberikan jawaban atas pertanyaan maupun tanggapan dari peserta didik</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">e.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru menjelaskan penggunaan webblog dalam pembelajaran dan menampilkannya di kelas;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">f.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Penguatan pada kesimpulan secara bersama-sama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pengamatan (</span><em style=\"color: black;\">Observation</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Situasi kegiatan pembelajaran</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Keaktifan siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kemampuan siswa dalam diskusi kelompok</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Refleksi (</span><em style=\"color: black;\">Reflecting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dalam tahap refleksi ini, peneliti merefleksikan apa yang telah dilakukan pada siklus pertama terhadap penggunaan powerpoint dan webblog dalam pembelajaran PAI. Isi dari tahap ini dapat berupa kelebihan dan kekurangan terhadap apa yang telah dilaksanakan.</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>Siklus 2</u></strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Seperti halnya siklus pertama dalam PTK ini terdiri dari perencanaan, pelaksanaan, pengamatan dan refleksi sebagai berikut. </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Perencanaan (</span><em style=\"color: black;\">planning</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti membuat rencana pembelajaran berdasarkan hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pelaksanaan (</span><em style=\"color: black;\">acting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Guru melaksanaakan pembelajaran PAI menggunakan multimedia interaktif dan webblog rencana pembelajaran hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pengamatan (</span><em style=\"color: black;\">observation</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti (guru dan teman sejawat) melakukan pengamatan terhadap aktivitas pembelajaran PAI menggunakan multimedia interaktif dan webblog. </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Refleksi (</span><em style=\"color: black;\">reflecting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti melakukan refleksi terhadap pelaksanaan siklus kedua dan menganalisis pelaksanaan pembelajaran menggunakan multimedia interaktif dan webbblog dalam peningkatan hasil pembelajaran materi sejarah Nabi Muhammad Saw di SMP 7 Semarang.</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>&nbsp;</u></strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>Siklus 3</u></strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Seperti halnya siklus pertama dalam PTK ini terdiri dari perencanaan, pelaksanaan, pengamatan dan refleksi sebagai berikut. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">1. Perencanaan (</span><em style=\"color: black;\">planning</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti membuat rencana pembelajaran berdasarkan hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">2. Pelaksanaan (</span><em style=\"color: black;\">acting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Guru melaksanaakan pembelajaran PAI menggunakan multimedia interaktif dan webblog rencana pembelajaran hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">3. Pengamatan (</span><em style=\"color: black;\">observation</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti (guru dan teman sejawat) melakukan pengamatan terhadap aktivitas pembelajaran PAI menggunakan multimedia interaktif dan webblog. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">4. Refleksi (</span><em style=\"color: black;\">reflecting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti melakukan refleksi terhadap pelaksanaan siklus ketiga dan menganalisis serta membuat kesimpulan atas pelaksanaan pembelajaran menggunakan multimedia interaktif dan webbblog dalam peningkatan hasil pembelajaran materi sejarah Nabi Muhammad Saw di SMP 7 Semarang.</span></p><p>&nbsp;</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-justify\">A.&nbsp;&nbsp;&nbsp;<strong>Sistematika Penulisan</strong></p><p class=\"ql-align-justify\">	Sistematika penulisan hasil penelitian ini terdiri atas enam bab adalah sebagai berikut :</p><p class=\"ql-align-justify\">	Bab pertama berisi pendahuluan yang terdiri dari latar belakang masalah, identifikasi masalah, rumusan masalah, tujuan penelitian, manfaat penelitian, kajian pustaka, metode penelitian, dan sistematika penulisan.</p><p class=\"ql-align-justify\">	Bab kedua berisi landasan teori yang menjelaskan pembelajaran PAI, media pembelajaran, multimedia interaktif, webblog dan deskripsi tentang SMA Negeri 3 Semarang</p><p class=\"ql-align-justify\">	Bab ketiga berisi penyajian data dan deskripsi perencanaan pembelajaran PAI menggunakan multimedia interaktif dan webblog di SMA Negeri 3 Semarang. </p><p class=\"ql-align-justify\">	Bab keempat berisi penyajian data dan deskripsi pelaksanaan pembelajaran PAI menggunakan multimedia interaktif dan webblog di SMA Negeri 3 Semarang.</p><p class=\"ql-align-justify\">	Bab kelima berisi tentang evaluasi pelaksanaan pembelajaran PAI menggunakan multimedia interaktif dan webblog di SMA Negeri 3 Semarang.</p><p class=\"ql-align-justify\">	Bab keenam penutup, di dalamnya terdiri dari kesimpulan dan saran-saran.</p><p class=\"ql-align-justify\">	<strong style=\"color: rgba(0, 0, 0, 0.87);\">&nbsp;</strong><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">1. Setting Penelitian</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Setting dalam penelitian ini meliputi tiga hal, yakni: tempat penelitian, waktu penelitian, dan siklus. Adapun penjabarannya sebagai berikut:</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;Tempat penelitian</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Penelitian tindakan kelas&nbsp;(PTK) ini dilaksanakan di SMP Negeri 7 Semarang untuk mata pelajaran Pendidikan Agama Islam. Sedangkan subyek penelitian ini adalah kelas VIIA dengan jumlah peserta didik &nbsp;terdiri dari 36 dengan rincian 18 laki-laki dan 18 perempuan.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Waktu penelitian</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Penelitian ini dilaksanakan pada semester II tahun ajaran 2011/2012, yakni bulan Februari-Mei 2011.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Siklus PTK </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">PTK ini dilaksanakan melalui tiga siklus untuk melihat peningkatan hasil belajar dan aktivitas siswa dalam mengikuti mata pelajaran PAI menggunakan multimedia interaktif dan webblog.</span></p><p><strong style=\"color: black;\">2. Persiapan PTK</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Sebelum melakukan PTK perlu membuat berbagai instrumen yang akan digunakan dalam penelitian. Adapun persiapan yaitu menentukan materi yang akan diambil kemudian menyiapkan rencana pelaksanaan pembelajarannya. Selain itu juga akan dibuat perangkat pembelajaran yang berupa: lembar pengamatan; dan lembar evaluasi. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subjek Penelitian</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Dalam PTK ini yang menjadi subjek penelitian adalah siswa kelas VIIA yang terdiri dari 36 siswa dengan komposisi perempuan 18 dan laki-laki 18 siswa.</span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sumber Data</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Sumber data dalam penelitian ini terdiri dari beberapa sumber, yakni siswa, guru atau teman sejawat.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">untuk mendapatkan data tentang hasil belajar dan aktivitas siswa dalam pembelajaran PAI.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;guru atau teman sejawat</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">untuk melihat tingkat keberhasilan pelaksanaan penggunaan powerpoint dan webblog</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">5. Teknik dan Alat Pengumpulan Data</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teknik </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Teknik pengumpulan data dalam penelitian ini adalah tes, observasi, wawancara, dan diskusi.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tes : digunakan untuk mendapatkan data tentang hasil belajar siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Observasi : digunakan untuk mengumpulkan data tentang keaktifan siswa dalam pembelajaran dengan menggunakan multimedia interaktif dan webblog</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wawancara : untuk mendapatkan data tentang tingkat keberhasilan pelaksanaan pembelajaran PAI dengan menggunakan multimedia interaktif dan webblog </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diskusi antarguru dan teman sejawat untuk merefleksikan hasil siklus PTK.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alat Pengumpulan Data</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Alat pengumpulan data dalan PTK ini meliputi tes, observasi, wawancara, kuisioner dan diskusi sebagaimana berikut ini.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tes : menggunakan butir soal/instrument soal untuk mengukur hasil belajar siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Observasi : menggunakan lembar observasi untuk mengukur tingkat partisipasi siswa dalam pembelajaran Pendidikan Agama Islam (PAI).</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wawancara : menggunakan panduan wawancara untuk mengetahui pendapat atau sikap siswa dan teman sejawat tentang penggunaan multimedia interaktif dan webblog dalam pembelajaran PAI</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diskusi : menggunakan lembar pengamatan.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">6. </span><strong style=\"color: black;\">Indikator Kinerja</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Dalam PTK ini yang akan dilihat indikator kinerjanya selain siswa adalah guru, karena guru merupakan fasilitator yang sangat berpengaruh terhadap kinerja siswa.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;Tes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: rata-rata nilai ulangan harian</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;Observasi  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: keaktifan siswa dalam pembelajaran PAI di kelas </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;Dokumentasi &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: kehadiran siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;Observasi  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: hasil observasi</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">&nbsp;</strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">&nbsp;</strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">7.Analisis Data</strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Data yang dikumpulkan pada setiap kegiatan observasi dari pelaksanaan siklus penelitian dianalisis secara deskriptif dengan menggunakan teknik persentase untuk melihat kecenderungan yang terjadi dalam pembelajaran.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hasil belajar, yaitu dengan menganalisis nilai rata-rata ulangan harian. Kemudian dikategorikan dalam klasifikasi tinggi, sedang, dan rendah. Catatan: apabila mendapatkan nilai 80-100 termasuk klasifikasi tinggi. Sedangkan 69-80 adalah sedang, dan di bawah 68 adalah rendah.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Minat siswa dalam pembelajaran PAI, yakni dengan menganalisis tingkat ketertarikan siswa dalam proses pembelajaran PAI. Untuk mengetahuinya digunakan cara wawancara. Kemudian dikategorikan dalam klasifikasi tinggi, sedang, dan rendah. Dinyatakan tinggi, jika lebih dari 80% siswa menyatakan sangat berminat. Dinyatakan sedang, apabila ketertarikan siswa antara 69-80%. Dan dinyatakan rendah, apabila ketertarikan siswa berada pada posisi di bawah 68%.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Implementasi pembelajaran PAI menggunakan multimedia interaktif dan webblog, yakni: dengan menanalisis tingkat keberhasilannya kemudian dikategorikan dalam klasifikasi tinggi, sedang, dan rendah. </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\">8.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Prosedur Penelitian</strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Prosedur penelitian ini melalui dua siklus, yakni: </span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>Siklus 1</u></strong></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Siklus pertama dalam PTK ini terdiri dari perencanaan, pelaksanaan, pengamatan dan refleksi sebagai berikut:</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Perencanaan (</span><em style=\"color: black;\">Planning</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tim peneliti melakukan analisis kurikulum PAI untuk mengetahui kompetensi dasar yang akan disampaikan kepada siswa dengan menggunakan multimedia interaktif dan webblog;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Membuat rencana pembelajaran PAI;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pembuatan jadwal penelitian;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Membuat bahan pembelajaran </span>salat sunah berjama’ah dan munfarid menggunakan multimedia interaktif dan webblog;</p><p class=\"ql-align-justify\"><span style=\"color: black;\">e.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pembuatan lembar tugas siswa yang berisi tugas dan kegiatan siswa. lembar tugas ini diharapkan mampu mengarahkan fokus perhatian siswa;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">f. &nbsp;&nbsp;Pembuatan instrumen penilaian;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">g. &nbsp;&nbsp;Pembuatan lembar pengamatan;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">h. &nbsp;&nbsp;Pembuatan daftar pertanyaan untuk wawancara.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pelaksanaan (</span><em style=\"color: black;\">Acting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru menyajikan materi pelajaran menggunakan multimedia interaktif</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru memberikan kesempatan kepada peserta didik untuk memberikan tangapan.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Peserta didik memberikan respon yang berupa pertanyaan maupun tangapan</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru memberikan jawaban atas pertanyaan maupun tanggapan dari peserta didik</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">e.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guru menjelaskan penggunaan webblog dalam pembelajaran dan menampilkannya di kelas;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">f.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Penguatan pada kesimpulan secara bersama-sama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pengamatan (</span><em style=\"color: black;\">Observation</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Situasi kegiatan pembelajaran</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Keaktifan siswa</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kemampuan siswa dalam diskusi kelompok</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Refleksi (</span><em style=\"color: black;\">Reflecting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dalam tahap refleksi ini, peneliti merefleksikan apa yang telah dilakukan pada siklus pertama terhadap penggunaan powerpoint dan webblog dalam pembelajaran PAI. Isi dari tahap ini dapat berupa kelebihan dan kekurangan terhadap apa yang telah dilaksanakan.</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>Siklus 2</u></strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Seperti halnya siklus pertama dalam PTK ini terdiri dari perencanaan, pelaksanaan, pengamatan dan refleksi sebagai berikut. </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Perencanaan (</span><em style=\"color: black;\">planning</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti membuat rencana pembelajaran berdasarkan hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pelaksanaan (</span><em style=\"color: black;\">acting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Guru melaksanaakan pembelajaran PAI menggunakan multimedia interaktif dan webblog rencana pembelajaran hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pengamatan (</span><em style=\"color: black;\">observation</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti (guru dan teman sejawat) melakukan pengamatan terhadap aktivitas pembelajaran PAI menggunakan multimedia interaktif dan webblog. </span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Refleksi (</span><em style=\"color: black;\">reflecting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti melakukan refleksi terhadap pelaksanaan siklus kedua dan menganalisis pelaksanaan pembelajaran menggunakan multimedia interaktif dan webbblog dalam peningkatan hasil pembelajaran materi sejarah Nabi Muhammad Saw di SMP 7 Semarang.</span></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>&nbsp;</u></strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"><u>Siklus 3</u></strong></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">Seperti halnya siklus pertama dalam PTK ini terdiri dari perencanaan, pelaksanaan, pengamatan dan refleksi sebagai berikut. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">1. Perencanaan (</span><em style=\"color: black;\">planning</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti membuat rencana pembelajaran berdasarkan hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">&nbsp;</span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">2. Pelaksanaan (</span><em style=\"color: black;\">acting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Guru melaksanaakan pembelajaran PAI menggunakan multimedia interaktif dan webblog rencana pembelajaran hasil refleksi pada siklus pertama.</span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">3. Pengamatan (</span><em style=\"color: black;\">observation</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti (guru dan teman sejawat) melakukan pengamatan terhadap aktivitas pembelajaran PAI menggunakan multimedia interaktif dan webblog. </span></p><p class=\"ql-align-justify\">	<span style=\"color: black;\">4. Refleksi (</span><em style=\"color: black;\">reflecting</em><span style=\"color: black;\">)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Tim peneliti melakukan refleksi terhadap pelaksanaan siklus ketiga dan menganalisis serta membuat kesimpulan atas pelaksanaan pembelajaran menggunakan multimedia interaktif dan webbblog dalam peningkatan hasil pembelajaran materi sejarah Nabi Muhammad Saw di SMP 7 Semarang.</span></p><p>&nbsp;</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-justify\">A.&nbsp;&nbsp;&nbsp;<strong>Sistematika Penulisan</strong></p><p class=\"ql-align-justify\">	Sistematika penulisan hasil penelitian ini terdiri atas enam bab adalah sebagai berikut :</p><p class=\"ql-align-justify\">	Bab pertama berisi pendahuluan yang terdiri dari latar belakang masalah, identifikasi masalah, rumusan masalah, tujuan penelitian, manfaat penelitian, kajian pustaka, metode penelitian, dan sistematika penulisan.</p><p class=\"ql-align-justify\">	Bab kedua berisi landasan teori yang menjelaskan pembelajaran PAI, media pembelajaran, multimedia interaktif, webblog dan deskripsi tentang SMA Negeri 3 Semarang</p><p class=\"ql-align-justify\">	Bab ketiga berisi penyajian data dan deskripsi perencanaan pembelajaran PAI menggunakan multimedia interaktif dan webblog di SMA Negeri 3 Semarang. </p><p class=\"ql-align-justify\">	Bab keempat berisi penyajian data dan deskripsi pelaksanaan pembelajaran PAI menggunakan multimedia interaktif dan webblog di SMA Negeri 3 Semarang.</p><p class=\"ql-align-justify\">	Bab kelima berisi tentang evaluasi pelaksanaan pembelajaran PAI menggunakan multimedia interaktif dan webblog di SMA Negeri 3 Semarang.</p><p class=\"ql-align-justify\">	Bab keenam penutup, di dalamnya terdiri dari kesimpulan dan saran-saran.</p><p class=\"ql-align-center\"><strong>&nbsp;</strong></p><p>gggg</p>',	1,	'2021-06-13 23:38:07',	'2021-06-13 23:38:10');

DROP TABLE IF EXISTS `classroom_research_formats`;
CREATE TABLE `classroom_research_formats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `educational_level_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classroom_research_formats_educational_level_id_foreign` (`educational_level_id`),
  CONSTRAINT `classroom_research_formats_educational_level_id_foreign` FOREIGN KEY (`educational_level_id`) REFERENCES `educational_levels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `classroom_research_formats` (`id`, `educational_level_id`, `name`, `created_at`, `updated_at`) VALUES
(1,	1,	'A. Pendahuluan',	'2020-09-29 00:20:00',	'2020-09-29 00:23:38'),
(2,	1,	'B. Rumusan Masalah',	'2020-09-29 00:20:00',	'2020-09-29 00:23:42'),
(3,	1,	'C. Tujuan Penelitian',	'2020-09-29 00:20:00',	'2020-09-29 00:23:47'),
(4,	1,	'D. Kemanfaatan Hasil Penelitian',	'2020-09-29 00:21:00',	'2020-09-29 00:23:52'),
(5,	1,	'E. KAJIAN PUSTAKA',	'2020-09-29 00:21:00',	'2020-09-29 00:23:56'),
(6,	1,	'F. METODE PENELITIAN',	'2020-09-29 00:21:00',	'2020-09-29 00:24:00'),
(7,	2,	'A. Pendahuluan',	'2020-09-29 00:21:00',	NULL),
(8,	2,	'B. Rumusan Masalah',	'2020-09-29 00:21:00',	NULL),
(9,	2,	'C. Tujuan Penelitian',	'2020-09-29 00:21:00',	NULL),
(10,	2,	'D. Kemanfaatan Hasil Penelitian',	'2020-09-29 00:21:00',	NULL),
(11,	2,	'E. KAJIAN PUSTAKA',	NULL,	NULL),
(12,	2,	'F. METODE PENELITIAN',	NULL,	NULL),
(13,	3,	'A. Pendahuluan',	NULL,	NULL),
(14,	3,	'B. Rumusan Masalah',	NULL,	NULL),
(15,	3,	'C. Tujuan Penelitian',	NULL,	NULL),
(16,	3,	'D. Kemanfaatan Hasil Penelitian',	NULL,	NULL),
(17,	3,	'E. KAJIAN PUSTAKA',	NULL,	NULL),
(18,	3,	'F. METODE PENELITIAN',	NULL,	NULL),
(19,	4,	'A. Pendahuluan',	NULL,	NULL),
(20,	4,	'B. Rumusan Masalah',	NULL,	NULL),
(21,	4,	'C. Tujuan Penelitian',	NULL,	NULL),
(22,	4,	'D. Kemanfaatan Hasil Penelitian',	NULL,	NULL),
(23,	4,	'E. KAJIAN PUSTAKA',	NULL,	NULL),
(24,	4,	'F. METODE PENELITIAN',	NULL,	NULL),
(25,	5,	'A. Pendahuluan',	NULL,	NULL),
(26,	5,	'B. Rumusan Masalah',	NULL,	NULL),
(27,	5,	'C. Tujuan Penelitian',	NULL,	NULL),
(28,	5,	'D. Kemanfaatan Hasil Penelitian',	NULL,	NULL),
(29,	5,	'E. KAJIAN PUSTAKA',	NULL,	NULL),
(30,	5,	'F. METODE PENELITIAN',	NULL,	NULL),
(31,	6,	'A. Pendahuluan',	NULL,	NULL),
(32,	6,	'B. Rumusan Masalah',	NULL,	NULL),
(33,	6,	'C. Tujuan Penelitian',	NULL,	NULL),
(34,	6,	'D. Kemanfaatan Hasil Penelitian',	NULL,	NULL),
(35,	6,	'E. KAJIAN PUSTAKA',	NULL,	NULL),
(36,	5,	'F. METODE PENELITIAN',	NULL,	NULL);

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_comment_type_comment_id_index` (`comment_type`,`comment_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `comments` (`id`, `user_id`, `value`, `comment_type`, `comment_id`, `created_at`, `updated_at`) VALUES
(1,	1,	'asdasd',	'App\\Models\\Post',	26,	'2020-10-01 19:06:32',	'2020-10-01 19:06:32'),
(2,	1,	'anjay',	'App\\Models\\Post',	26,	'2020-10-01 19:06:42',	'2020-10-01 19:06:42'),
(3,	1,	'asdad',	'App\\Models\\Post',	26,	'2020-10-01 19:21:26',	'2020-10-01 19:21:26'),
(4,	1,	'asdasd',	'App\\Models\\Post',	26,	'2020-10-01 19:22:26',	'2020-10-01 19:22:26'),
(5,	1,	'cok',	'App\\Models\\Post',	26,	'2020-10-01 19:22:33',	'2020-10-01 19:22:33'),
(6,	1,	'hmmm',	'App\\Models\\Post',	25,	'2020-10-01 19:23:24',	'2020-10-01 19:23:24'),
(7,	1,	'jadi gini gan',	'App\\Models\\Post',	25,	'2020-10-01 19:23:43',	'2020-10-01 19:23:43'),
(8,	1,	'hmmmmmm',	'App\\Models\\Post',	26,	'2020-10-01 19:24:11',	'2020-10-01 19:24:11'),
(9,	1,	'oh',	'App\\Models\\Post',	28,	'2020-10-01 19:25:28',	'2020-10-01 19:25:28'),
(10,	1,	'mana saya tau',	'App\\Models\\Post',	28,	'2020-10-01 19:26:41',	'2020-10-01 19:26:41'),
(11,	1,	'hmmm',	'App\\Models\\Post',	28,	'2020-10-01 19:50:28',	'2020-10-01 19:50:28'),
(12,	1,	'mana saya tau',	'App\\Models\\Post',	28,	'2020-10-01 19:51:07',	'2020-10-01 19:51:07'),
(13,	1,	'oi babi',	'App\\Models\\Post',	8,	'2020-10-01 19:52:00',	'2020-10-01 19:52:00'),
(14,	1,	'jadi gini',	'App\\Models\\Post',	22,	'2020-10-01 19:52:41',	'2020-10-01 19:52:41'),
(15,	1,	'hhh',	'App\\Models\\Post',	28,	'2020-10-01 19:57:19',	'2020-10-01 19:57:19'),
(16,	1,	'oi pinjem duit jinx',	'App\\Models\\Post',	27,	'2020-10-01 20:06:42',	'2020-10-01 20:06:42'),
(17,	3,	'mana saya tau',	'App\\Models\\Post',	30,	'2020-10-12 00:35:38',	'2020-10-12 00:35:38'),
(18,	1,	'oh ya sudah',	'App\\Models\\Post',	30,	'2020-10-12 12:57:42',	'2020-10-12 12:57:42'),
(19,	1,	'asjdkljaskld',	'App\\Models\\Post',	33,	'2021-06-14 07:24:39',	'2021-06-14 07:24:39');

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1,	1,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	NULL,	1),
(2,	1,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	NULL,	2),
(3,	1,	'email',	'text',	'Email',	1,	1,	1,	1,	1,	1,	NULL,	3),
(4,	1,	'password',	'password',	'Password',	1,	0,	0,	1,	1,	0,	NULL,	4),
(5,	1,	'remember_token',	'text',	'Remember Token',	0,	0,	0,	0,	0,	0,	NULL,	5),
(6,	1,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	0,	0,	0,	NULL,	6),
(7,	1,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	NULL,	7),
(8,	1,	'avatar',	'image',	'Avatar',	0,	1,	1,	1,	1,	1,	NULL,	8),
(9,	1,	'user_belongsto_role_relationship',	'relationship',	'Role',	0,	1,	1,	1,	1,	0,	'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',	10),
(10,	1,	'user_belongstomany_role_relationship',	'relationship',	'Roles',	0,	1,	1,	1,	1,	0,	'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',	11),
(11,	1,	'settings',	'hidden',	'Settings',	0,	0,	0,	0,	0,	0,	NULL,	12),
(12,	2,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	NULL,	1),
(13,	2,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	NULL,	2),
(14,	2,	'created_at',	'timestamp',	'Created At',	0,	0,	0,	0,	0,	0,	NULL,	3),
(15,	2,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	NULL,	4),
(16,	3,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	NULL,	1),
(17,	3,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	NULL,	2),
(18,	3,	'created_at',	'timestamp',	'Created At',	0,	0,	0,	0,	0,	0,	NULL,	3),
(19,	3,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	NULL,	4),
(20,	3,	'display_name',	'text',	'Display Name',	1,	1,	1,	1,	1,	1,	NULL,	5),
(21,	1,	'role_id',	'text',	'Role',	1,	1,	1,	1,	1,	1,	NULL,	9),
(22,	4,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	NULL,	1),
(23,	4,	'parent_id',	'select_dropdown',	'Parent',	0,	0,	1,	1,	1,	1,	'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',	2),
(24,	4,	'order',	'text',	'Order',	1,	1,	1,	1,	1,	1,	'{\"default\":1}',	3),
(25,	4,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	NULL,	4),
(26,	4,	'slug',	'text',	'Slug',	1,	1,	1,	1,	1,	1,	'{\"slugify\":{\"origin\":\"name\"}}',	5),
(27,	4,	'created_at',	'timestamp',	'Created At',	0,	0,	1,	0,	0,	0,	NULL,	6),
(28,	4,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	NULL,	7),
(29,	5,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	NULL,	1),
(30,	5,	'author_id',	'text',	'Author',	1,	0,	1,	1,	0,	1,	NULL,	2),
(31,	5,	'category_id',	'text',	'Category',	1,	0,	1,	1,	1,	0,	NULL,	3),
(32,	5,	'title',	'text',	'Title',	1,	1,	1,	1,	1,	1,	NULL,	4),
(33,	5,	'excerpt',	'text_area',	'Excerpt',	1,	0,	1,	1,	1,	1,	NULL,	5),
(34,	5,	'body',	'rich_text_box',	'Body',	1,	0,	1,	1,	1,	1,	NULL,	6),
(35,	5,	'image',	'image',	'Post Image',	0,	1,	1,	1,	1,	1,	'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',	7),
(36,	5,	'slug',	'text',	'Slug',	1,	0,	1,	1,	1,	1,	'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',	8),
(37,	5,	'meta_description',	'text_area',	'Meta Description',	1,	0,	1,	1,	1,	1,	NULL,	9),
(38,	5,	'meta_keywords',	'text_area',	'Meta Keywords',	1,	0,	1,	1,	1,	1,	NULL,	10),
(39,	5,	'status',	'select_dropdown',	'Status',	1,	1,	1,	1,	1,	1,	'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',	11),
(40,	5,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	0,	0,	0,	NULL,	12),
(41,	5,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	NULL,	13),
(42,	5,	'seo_title',	'text',	'SEO Title',	0,	1,	1,	1,	1,	1,	NULL,	14),
(43,	5,	'featured',	'checkbox',	'Featured',	1,	1,	1,	1,	1,	1,	NULL,	15),
(44,	6,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	NULL,	1),
(45,	6,	'author_id',	'text',	'Author',	1,	0,	0,	0,	0,	0,	NULL,	2),
(46,	6,	'title',	'text',	'Title',	1,	1,	1,	1,	1,	1,	NULL,	3),
(47,	6,	'excerpt',	'text_area',	'Excerpt',	1,	0,	1,	1,	1,	1,	NULL,	4),
(48,	6,	'body',	'rich_text_box',	'Body',	1,	0,	1,	1,	1,	1,	NULL,	5),
(49,	6,	'slug',	'text',	'Slug',	1,	0,	1,	1,	1,	1,	'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',	6),
(50,	6,	'meta_description',	'text',	'Meta Description',	1,	0,	1,	1,	1,	1,	NULL,	7),
(51,	6,	'meta_keywords',	'text',	'Meta Keywords',	1,	0,	1,	1,	1,	1,	NULL,	8),
(52,	6,	'status',	'select_dropdown',	'Status',	1,	1,	1,	1,	1,	1,	'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',	9),
(53,	6,	'created_at',	'timestamp',	'Created At',	1,	1,	1,	0,	0,	0,	NULL,	10),
(54,	6,	'updated_at',	'timestamp',	'Updated At',	1,	0,	0,	0,	0,	0,	NULL,	11),
(55,	6,	'image',	'image',	'Page Image',	0,	1,	1,	1,	1,	1,	NULL,	12),
(56,	8,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(57,	8,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'{}',	2),
(58,	8,	'description',	'text',	'Description',	0,	1,	1,	1,	1,	1,	'{}',	3),
(59,	8,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	4),
(60,	8,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	5),
(61,	9,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(62,	9,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'{}',	2),
(63,	9,	'description',	'text',	'Description',	0,	1,	1,	1,	1,	1,	'{}',	3),
(64,	9,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	4),
(65,	9,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	5),
(66,	10,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(67,	10,	'question_list_type_id',	'text',	'Question List Type Id',	0,	1,	1,	1,	1,	1,	'{}',	2),
(68,	10,	'value',	'text',	'Value',	1,	1,	1,	1,	1,	1,	'{}',	3),
(69,	10,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	4),
(70,	10,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	5),
(79,	10,	'question_list_belongsto_question_list_type_relationship',	'relationship',	'question_list_types',	0,	1,	1,	1,	1,	1,	'{\"model\":\"App\\\\Models\\\\QuestionListType\",\"table\":\"question_list_types\",\"type\":\"belongsTo\",\"column\":\"question_list_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"answer_lists\",\"pivot\":\"0\",\"taggable\":\"0\"}',	6),
(80,	12,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(81,	12,	'question_list_id',	'text',	'Question List Id',	1,	1,	1,	1,	1,	1,	'{}',	2),
(82,	12,	'value',	'text',	'Value',	1,	1,	1,	1,	1,	1,	'{}',	3),
(83,	12,	'score',	'text',	'Score',	0,	1,	1,	1,	1,	1,	'{}',	4),
(84,	12,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	5),
(85,	12,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	6),
(86,	12,	'answer_list_belongsto_question_list_relationship',	'relationship',	'question_lists',	0,	1,	1,	1,	1,	1,	'{\"model\":\"App\\\\Models\\\\QuestionList\",\"table\":\"question_lists\",\"type\":\"belongsTo\",\"column\":\"question_list_id\",\"key\":\"id\",\"label\":\"value\",\"pivot_table\":\"answer_lists\",\"pivot\":\"0\",\"taggable\":null}',	7),
(87,	10,	'question_list_belongstomany_pretest_relationship',	'relationship',	'pretests',	0,	1,	1,	1,	1,	1,	'{\"model\":\"App\\\\Models\\\\Pretest\",\"table\":\"pretests\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"pretest_question_lists\",\"pivot\":\"1\",\"taggable\":null}',	7),
(88,	8,	'pretest_belongstomany_question_list_relationship',	'relationship',	'question_lists',	0,	1,	1,	1,	1,	1,	'{\"model\":\"App\\\\Models\\\\QuestionList\",\"table\":\"question_lists\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"value\",\"pivot_table\":\"pretest_question_lists\",\"pivot\":\"1\",\"taggable\":null}',	6),
(89,	14,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(90,	14,	'educational_level_id',	'text',	'Educational Level Id',	0,	1,	1,	1,	1,	1,	'{}',	2),
(91,	14,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'{}',	3),
(92,	14,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	4),
(93,	14,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	5),
(95,	15,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(96,	15,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'{}',	2),
(97,	15,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	3),
(98,	15,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	4),
(99,	14,	'classroom_research_format_belongsto_educational_level_relationship',	'relationship',	'educational_levels',	0,	1,	1,	1,	1,	1,	'{\"model\":\"App\\\\Models\\\\EducationalLevel\",\"table\":\"educational_levels\",\"type\":\"belongsTo\",\"column\":\"educational_level_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"answer_lists\",\"pivot\":\"0\",\"taggable\":null}',	6),
(100,	16,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(101,	16,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'{}',	2),
(102,	16,	'description',	'text',	'Description',	0,	1,	1,	1,	1,	1,	'{}',	3),
(103,	16,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	4),
(104,	16,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	5),
(105,	18,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(106,	18,	'training_material_id',	'text',	'Training Material Id',	1,	1,	1,	1,	1,	1,	'{}',	2),
(107,	18,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'{}',	3),
(108,	18,	'value',	'text',	'Value',	1,	1,	1,	1,	1,	1,	'{}',	4),
(109,	18,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	5),
(110,	18,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	6),
(111,	18,	'training_material_content_belongsto_training_material_relationship',	'relationship',	'training_materials',	0,	1,	1,	1,	1,	1,	'{\"model\":\"App\\\\Models\\\\TrainingMaterial\",\"table\":\"training_materials\",\"type\":\"belongsTo\",\"column\":\"training_material_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"answer_lists\",\"pivot\":\"0\",\"taggable\":\"0\"}',	7),
(113,	19,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(114,	19,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'{}',	2),
(115,	19,	'description',	'text',	'Description',	0,	1,	1,	1,	1,	1,	'{}',	3),
(116,	19,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	4),
(117,	19,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	5);

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1,	'users',	'users',	'User',	'Users',	'voyager-person',	'TCG\\Voyager\\Models\\User',	'TCG\\Voyager\\Policies\\UserPolicy',	'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController',	'',	1,	0,	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(2,	'menus',	'menus',	'Menu',	'Menus',	'voyager-list',	'TCG\\Voyager\\Models\\Menu',	NULL,	'',	'',	1,	0,	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(3,	'roles',	'roles',	'Role',	'Roles',	'voyager-lock',	'TCG\\Voyager\\Models\\Role',	NULL,	'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController',	'',	1,	0,	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(4,	'categories',	'categories',	'Category',	'Categories',	'voyager-categories',	'TCG\\Voyager\\Models\\Category',	NULL,	'',	'',	1,	0,	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(5,	'posts',	'posts',	'Post',	'Posts',	'voyager-news',	'TCG\\Voyager\\Models\\Post',	'TCG\\Voyager\\Policies\\PostPolicy',	'',	'',	1,	0,	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(6,	'pages',	'pages',	'Page',	'Pages',	'voyager-file-text',	'TCG\\Voyager\\Models\\Page',	NULL,	'',	'',	1,	0,	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(8,	'pretests',	'pretests',	'Pretest',	'Pretests',	NULL,	'App\\Models\\Pretest',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}',	'2020-09-28 00:35:02',	'2020-09-28 00:35:02'),
(9,	'question_list_types',	'question-list-types',	'Question List Type',	'Question List Types',	NULL,	'App\\Models\\QuestionListType',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}',	'2020-09-28 18:32:22',	'2020-09-28 18:32:22'),
(10,	'question_lists',	'question-lists',	'Question List',	'Question Lists',	NULL,	'App\\Models\\QuestionList',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":\"id\",\"order_display_column\":\"value\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}',	'2020-09-28 18:33:03',	'2020-09-28 18:46:37'),
(12,	'answer_lists',	'answer-lists',	'Answer List',	'Answer Lists',	NULL,	'App\\Models\\AnswerList',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":\"id\",\"order_display_column\":\"value\",\"order_direction\":\"asc\",\"default_search_key\":null}',	'2020-09-28 18:54:12',	'2020-09-28 18:54:12'),
(14,	'classroom_research_formats',	'classroom-research-formats',	'Classroom Research Format',	'Classroom Research Formats',	NULL,	'App\\Models\\ClassroomResearchFormat',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}',	'2020-09-29 00:12:46',	'2020-09-29 00:12:46'),
(15,	'educational_levels',	'educational-levels',	'Educational Level',	'Educational Levels',	NULL,	'App\\Models\\EducationalLevel',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}',	'2020-09-29 00:14:28',	'2020-09-29 00:14:28'),
(16,	'training_materials',	'training-materials',	'Training Material',	'Training Materials',	NULL,	'App\\Models\\TrainingMaterial',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}',	'2020-09-30 18:46:04',	'2020-10-06 00:04:53'),
(18,	'training_material_contents',	'training-material-contents',	'Training Material Content',	'Training Material Contents',	NULL,	'App\\Models\\TrainingMaterialContent',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}',	'2020-09-30 18:46:33',	'2020-10-05 21:17:10'),
(19,	'posttests',	'posttests',	'Posttest',	'Posttests',	NULL,	'App\\Models\\Posttest',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}',	'2020-10-05 18:31:49',	'2020-10-05 18:31:49');

DROP TABLE IF EXISTS `educational_levels`;
CREATE TABLE `educational_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `educational_levels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1,	'SD',	'2020-09-29 00:14:44',	'2020-09-29 00:14:44'),
(2,	'SMP',	'2020-09-29 00:14:52',	'2020-09-29 00:14:52'),
(3,	'SMK',	'2020-09-29 00:14:55',	'2020-09-29 00:14:55'),
(4,	'SMA',	'2020-09-29 00:15:03',	'2020-09-29 00:15:03'),
(5,	'TK',	'2020-09-29 00:15:00',	'2020-09-29 00:15:14'),
(6,	'SLB',	'2020-09-29 00:15:19',	'2020-09-29 00:15:19');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1,	'default',	'{\"uuid\":\"4eb2ae6b-2b75-4b1c-bcd6-3d83b9461f81\",\"displayName\":\"App\\\\Jobs\\\\ProcessClassRoomResearch\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessClassRoomResearch\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\ProcessClassRoomResearch\\\":10:{s:20:\\\"\\u0000*\\u0000classroomResearch\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:28:\\\"App\\\\Models\\\\ClassroomResearch\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',	0,	NULL,	1601885427,	1601885427);

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56');

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1,	1,	'Dashboard',	'',	'_self',	'voyager-boat',	NULL,	NULL,	1,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56',	'voyager.dashboard',	NULL),
(2,	1,	'Media',	'',	'_self',	'voyager-images',	NULL,	NULL,	4,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.media.index',	NULL),
(3,	1,	'Users',	'',	'_self',	'voyager-person',	NULL,	NULL,	3,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56',	'voyager.users.index',	NULL),
(4,	1,	'Roles',	'',	'_self',	'voyager-lock',	NULL,	NULL,	2,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56',	'voyager.roles.index',	NULL),
(5,	1,	'Tools',	'',	'_self',	'voyager-tools',	NULL,	NULL,	8,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	NULL,	NULL),
(6,	1,	'Menu Builder',	'',	'_self',	'voyager-list',	NULL,	5,	1,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.menus.index',	NULL),
(7,	1,	'Database',	'',	'_self',	'voyager-data',	NULL,	5,	2,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.database.index',	NULL),
(8,	1,	'Compass',	'',	'_self',	'voyager-compass',	NULL,	5,	3,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.compass.index',	NULL),
(9,	1,	'BREAD',	'',	'_self',	'voyager-bread',	NULL,	5,	4,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.bread.index',	NULL),
(10,	1,	'Settings',	'',	'_self',	'voyager-settings',	NULL,	NULL,	9,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.settings.index',	NULL),
(11,	1,	'Categories',	'',	'_self',	'voyager-categories',	NULL,	NULL,	7,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.categories.index',	NULL),
(12,	1,	'Posts',	'',	'_self',	'voyager-news',	NULL,	NULL,	5,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.posts.index',	NULL),
(13,	1,	'Pages',	'',	'_self',	'voyager-file-text',	NULL,	NULL,	6,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.pages.index',	NULL),
(14,	1,	'Hooks',	'',	'_self',	'voyager-hook',	NULL,	5,	5,	'2020-09-27 20:54:56',	'2020-10-01 20:15:23',	'voyager.hooks',	NULL),
(15,	1,	'Pretests',	'',	'_self',	NULL,	NULL,	26,	1,	'2020-09-28 00:35:03',	'2020-10-12 13:03:04',	'voyager.pretests.index',	NULL),
(16,	1,	'Question List Types',	'',	'_self',	NULL,	'#000000',	NULL,	12,	'2020-09-28 18:32:22',	'2020-10-12 13:02:58',	'voyager.anjay.index',	'null'),
(17,	1,	'Question Lists',	'',	'_self',	NULL,	NULL,	NULL,	14,	'2020-09-28 18:33:03',	'2020-10-12 13:02:58',	'voyager.question-lists.index',	NULL),
(19,	1,	'Answer Lists',	'',	'_self',	NULL,	NULL,	NULL,	15,	'2020-09-28 18:54:12',	'2020-10-12 13:02:58',	'voyager.answer-lists.index',	NULL),
(20,	1,	'Classroom Research Formats',	'',	'_self',	NULL,	NULL,	NULL,	17,	'2020-09-29 00:12:47',	'2020-10-12 13:02:58',	'voyager.classroom-research-formats.index',	NULL),
(21,	1,	'Educational Levels',	'',	'_self',	NULL,	NULL,	NULL,	18,	'2020-09-29 00:14:28',	'2020-10-12 13:02:58',	'voyager.educational-levels.index',	NULL),
(22,	1,	'Nama Materi Pelatihan',	'',	'_self',	NULL,	'#000000',	NULL,	19,	'2020-09-30 18:46:04',	'2020-10-12 13:02:58',	'voyager.training-materials.index',	'null'),
(23,	1,	'Training Material Contents',	'',	'_self',	NULL,	NULL,	NULL,	20,	'2020-09-30 18:46:34',	'2020-10-12 13:02:58',	'voyager.training-material-contents.index',	NULL),
(25,	1,	'Soal Pre Tes',	'',	'_self',	NULL,	'#000000',	26,	2,	'2020-10-01 20:34:47',	'2020-10-12 13:03:04',	'custom_pretest_question_lists.index',	'null'),
(26,	1,	'Paket Soal Pre Tes',	'',	'_self',	'voyager-tools',	'#000000',	NULL,	10,	'2020-10-05 18:26:42',	'2020-10-05 18:29:56',	NULL,	''),
(27,	1,	'Posttests',	'',	'_self',	NULL,	NULL,	28,	1,	'2020-10-05 18:31:49',	'2020-10-05 18:32:48',	'voyager.posttests.index',	NULL),
(28,	1,	'Paket Soal Post Tes',	'',	'_self',	NULL,	'#000000',	NULL,	11,	'2020-10-05 18:32:26',	'2020-10-05 18:32:36',	NULL,	''),
(29,	1,	'Soal Post Tes',	'',	'_self',	NULL,	'#000000',	28,	2,	'2020-10-05 18:34:15',	'2020-10-05 18:34:22',	'custom_posttest_question_lists.index',	NULL),
(30,	1,	'Materi Pelatihan',	'',	'_self',	NULL,	'#000000',	NULL,	13,	'2020-10-05 18:47:47',	'2020-10-12 13:02:58',	NULL,	''),
(31,	1,	'Konten Materi Pelatihan',	'',	'_self',	NULL,	'#000000',	30,	1,	'2020-10-05 18:49:57',	'2020-10-12 13:02:58',	'custom_training_material_contents.index',	'null'),
(32,	1,	'User Reports',	'',	'_self',	NULL,	'#000000',	NULL,	16,	'2020-10-07 19:51:12',	'2020-10-12 13:02:58',	'userreports.index',	NULL),
(33,	1,	'Koreksi Soal Pre Tes',	'',	'_self',	NULL,	'#000000',	26,	3,	'2020-10-08 02:01:35',	'2020-10-12 13:03:04',	'pretest_assessment.index',	'null'),
(34,	1,	'Koreksi Soal Post Tes',	'',	'_self',	NULL,	'#000000',	28,	3,	'2020-10-08 02:02:11',	'2020-10-08 09:57:39',	'posttest_assessment.index',	'null');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2014_10_12_200000_add_two_factor_columns_to_users_table',	1),
(4,	'2016_01_01_000000_add_voyager_user_fields',	1),
(5,	'2016_01_01_000000_create_data_types_table',	1),
(6,	'2016_01_01_000000_create_pages_table',	1),
(7,	'2016_01_01_000000_create_posts_table',	1),
(8,	'2016_02_15_204651_create_categories_table',	1),
(9,	'2016_05_19_173453_create_menu_table',	1),
(10,	'2016_10_21_190000_create_roles_table',	1),
(11,	'2016_10_21_190000_create_settings_table',	1),
(12,	'2016_11_30_135954_create_permission_table',	1),
(13,	'2016_11_30_141208_create_permission_role_table',	1),
(14,	'2016_12_26_201236_data_types__add__server_side',	1),
(15,	'2017_01_13_000000_add_route_to_menu_items_table',	1),
(16,	'2017_01_14_005015_create_translations_table',	1),
(17,	'2017_01_15_000000_make_table_name_nullable_in_permissions_table',	1),
(18,	'2017_03_06_000000_add_controller_to_data_types_table',	1),
(19,	'2017_04_11_000000_alter_post_nullable_fields_table',	1),
(20,	'2017_04_21_000000_add_order_to_data_rows_table',	1),
(21,	'2017_07_05_210000_add_policyname_to_data_types_table',	1),
(22,	'2017_08_05_000000_add_group_to_settings_table',	1),
(23,	'2017_11_26_013050_add_user_role_relationship',	1),
(24,	'2017_11_26_015000_create_user_roles_table',	1),
(25,	'2018_03_11_000000_add_user_settings',	1),
(26,	'2018_03_14_000000_add_details_to_data_types_table',	1),
(27,	'2018_03_16_000000_make_settings_value_nullable',	1),
(28,	'2019_08_19_000000_create_failed_jobs_table',	1),
(29,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(30,	'2020_09_28_034849_create_sessions_table',	1),
(31,	'2020_09_28_041111_create_educational_levels_table',	1),
(32,	'2020_09_28_041112_create_profiles_table',	1),
(33,	'2020_09_28_042026_create_classroom_research_table',	1),
(34,	'2020_09_28_042027_create_classroom_research_contents_table',	1),
(35,	'2020_09_28_042044_create_classroom_research_formats_table',	1),
(36,	'2020_09_28_061638_create_question_list_types_table',	1),
(37,	'2020_09_28_061639_create_question_lists_table',	1),
(38,	'2020_09_28_062336_create_answer_lists_table',	1),
(39,	'2020_09_28_062810_create_pretests_table',	1),
(40,	'2020_09_28_063235_create_posttests_table',	1),
(41,	'2020_09_28_063307_create_pretest_question_lists_table',	1),
(42,	'2020_09_28_063317_create_posttest_question_lists_table',	1),
(43,	'2020_09_28_065033_create_campaigns_table',	1),
(44,	'2020_09_28_065221_create_questions_table',	1),
(45,	'2020_09_28_065534_create_answers_table',	1),
(46,	'2020_09_29_015015_add_score_to_answer_lists_table',	1),
(47,	'2020_09_29_075359_create_reads_table',	1),
(48,	'2020_09_30_025749_add_educational_level_id_to_classroom_researches_table',	1),
(49,	'2020_09_30_071955_add_user_id_to_classroom_researches_tables',	1),
(50,	'2020_09_30_073209_add_content_to_classroom_research_contents_tables',	1),
(51,	'2020_10_01_012341_create_comments_table',	1),
(52,	'2020_10_01_012403_create_training_materials_table',	1),
(53,	'2020_10_01_012521_create_training_material_contents_table',	1),
(54,	'2020_10_05_060623_create_jobs_table',	1),
(55,	'2020_10_05_063412_add_plagiarism_score_to_classroom_research_contents_table',	1),
(56,	'2020_10_05_071238_create_plagiarisms_table',	1),
(57,	'2020_10_08_060905_change_gender_from_profiles_table',	1),
(58,	'2020_10_09_060010_add_morph_to_campaigns_table',	1),
(59,	'2020_10_10_034409_change_value_from_campaigns_table',	1);

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1,	0,	'Hello World',	'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.',	'<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>',	'pages/page1.jpg',	'hello-world',	'Yar Meta Description',	'Keyword1, Keyword2',	'ACTIVE',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56');

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1,	'browse_admin',	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(2,	'browse_bread',	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(3,	'browse_database',	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(4,	'browse_media',	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(5,	'browse_compass',	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(6,	'browse_menus',	'menus',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(7,	'read_menus',	'menus',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(8,	'edit_menus',	'menus',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(9,	'add_menus',	'menus',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(10,	'delete_menus',	'menus',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(11,	'browse_roles',	'roles',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(12,	'read_roles',	'roles',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(13,	'edit_roles',	'roles',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(14,	'add_roles',	'roles',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(15,	'delete_roles',	'roles',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(16,	'browse_users',	'users',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(17,	'read_users',	'users',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(18,	'edit_users',	'users',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(19,	'add_users',	'users',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(20,	'delete_users',	'users',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(21,	'browse_settings',	'settings',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(22,	'read_settings',	'settings',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(23,	'edit_settings',	'settings',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(24,	'add_settings',	'settings',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(25,	'delete_settings',	'settings',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(26,	'browse_categories',	'categories',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(27,	'read_categories',	'categories',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(28,	'edit_categories',	'categories',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(29,	'add_categories',	'categories',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(30,	'delete_categories',	'categories',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(31,	'browse_posts',	'posts',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(32,	'read_posts',	'posts',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(33,	'edit_posts',	'posts',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(34,	'add_posts',	'posts',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(35,	'delete_posts',	'posts',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(36,	'browse_pages',	'pages',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(37,	'read_pages',	'pages',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(38,	'edit_pages',	'pages',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(39,	'add_pages',	'pages',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(40,	'delete_pages',	'pages',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(41,	'browse_hooks',	NULL,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(42,	'browse_pretests',	'pretests',	'2020-09-28 00:35:03',	'2020-09-28 00:35:03'),
(43,	'read_pretests',	'pretests',	'2020-09-28 00:35:03',	'2020-09-28 00:35:03'),
(44,	'edit_pretests',	'pretests',	'2020-09-28 00:35:03',	'2020-09-28 00:35:03'),
(45,	'add_pretests',	'pretests',	'2020-09-28 00:35:03',	'2020-09-28 00:35:03'),
(46,	'delete_pretests',	'pretests',	'2020-09-28 00:35:03',	'2020-09-28 00:35:03'),
(47,	'browse_question_list_types',	'question_list_types',	'2020-09-28 18:32:22',	'2020-09-28 18:32:22'),
(48,	'read_question_list_types',	'question_list_types',	'2020-09-28 18:32:22',	'2020-09-28 18:32:22'),
(49,	'edit_question_list_types',	'question_list_types',	'2020-09-28 18:32:22',	'2020-09-28 18:32:22'),
(50,	'add_question_list_types',	'question_list_types',	'2020-09-28 18:32:22',	'2020-09-28 18:32:22'),
(51,	'delete_question_list_types',	'question_list_types',	'2020-09-28 18:32:22',	'2020-09-28 18:32:22'),
(52,	'browse_question_lists',	'question_lists',	'2020-09-28 18:33:03',	'2020-09-28 18:33:03'),
(53,	'read_question_lists',	'question_lists',	'2020-09-28 18:33:03',	'2020-09-28 18:33:03'),
(54,	'edit_question_lists',	'question_lists',	'2020-09-28 18:33:03',	'2020-09-28 18:33:03'),
(55,	'add_question_lists',	'question_lists',	'2020-09-28 18:33:03',	'2020-09-28 18:33:03'),
(56,	'delete_question_lists',	'question_lists',	'2020-09-28 18:33:03',	'2020-09-28 18:33:03'),
(62,	'browse_answer_lists',	'answer_lists',	'2020-09-28 18:54:12',	'2020-09-28 18:54:12'),
(63,	'read_answer_lists',	'answer_lists',	'2020-09-28 18:54:12',	'2020-09-28 18:54:12'),
(64,	'edit_answer_lists',	'answer_lists',	'2020-09-28 18:54:12',	'2020-09-28 18:54:12'),
(65,	'add_answer_lists',	'answer_lists',	'2020-09-28 18:54:12',	'2020-09-28 18:54:12'),
(66,	'delete_answer_lists',	'answer_lists',	'2020-09-28 18:54:12',	'2020-09-28 18:54:12'),
(67,	'browse_classroom_research_formats',	'classroom_research_formats',	'2020-09-29 00:12:46',	'2020-09-29 00:12:46'),
(68,	'read_classroom_research_formats',	'classroom_research_formats',	'2020-09-29 00:12:46',	'2020-09-29 00:12:46'),
(69,	'edit_classroom_research_formats',	'classroom_research_formats',	'2020-09-29 00:12:46',	'2020-09-29 00:12:46'),
(70,	'add_classroom_research_formats',	'classroom_research_formats',	'2020-09-29 00:12:46',	'2020-09-29 00:12:46'),
(71,	'delete_classroom_research_formats',	'classroom_research_formats',	'2020-09-29 00:12:46',	'2020-09-29 00:12:46'),
(72,	'browse_educational_levels',	'educational_levels',	'2020-09-29 00:14:28',	'2020-09-29 00:14:28'),
(73,	'read_educational_levels',	'educational_levels',	'2020-09-29 00:14:28',	'2020-09-29 00:14:28'),
(74,	'edit_educational_levels',	'educational_levels',	'2020-09-29 00:14:28',	'2020-09-29 00:14:28'),
(75,	'add_educational_levels',	'educational_levels',	'2020-09-29 00:14:28',	'2020-09-29 00:14:28'),
(76,	'delete_educational_levels',	'educational_levels',	'2020-09-29 00:14:28',	'2020-09-29 00:14:28'),
(77,	'browse_training_materials',	'training_materials',	'2020-09-30 18:46:04',	'2020-09-30 18:46:04'),
(78,	'read_training_materials',	'training_materials',	'2020-09-30 18:46:04',	'2020-09-30 18:46:04'),
(79,	'edit_training_materials',	'training_materials',	'2020-09-30 18:46:04',	'2020-09-30 18:46:04'),
(80,	'add_training_materials',	'training_materials',	'2020-09-30 18:46:04',	'2020-09-30 18:46:04'),
(81,	'delete_training_materials',	'training_materials',	'2020-09-30 18:46:04',	'2020-09-30 18:46:04'),
(82,	'browse_training_material_contents',	'training_material_contents',	'2020-09-30 18:46:34',	'2020-09-30 18:46:34'),
(83,	'read_training_material_contents',	'training_material_contents',	'2020-09-30 18:46:34',	'2020-09-30 18:46:34'),
(84,	'edit_training_material_contents',	'training_material_contents',	'2020-09-30 18:46:34',	'2020-09-30 18:46:34'),
(85,	'add_training_material_contents',	'training_material_contents',	'2020-09-30 18:46:34',	'2020-09-30 18:46:34'),
(86,	'delete_training_material_contents',	'training_material_contents',	'2020-09-30 18:46:34',	'2020-09-30 18:46:34'),
(87,	'browse_posttests',	'posttests',	'2020-10-05 18:31:49',	'2020-10-05 18:31:49'),
(88,	'read_posttests',	'posttests',	'2020-10-05 18:31:49',	'2020-10-05 18:31:49'),
(89,	'edit_posttests',	'posttests',	'2020-10-05 18:31:49',	'2020-10-05 18:31:49'),
(90,	'add_posttests',	'posttests',	'2020-10-05 18:31:49',	'2020-10-05 18:31:49'),
(91,	'delete_posttests',	'posttests',	'2020-10-05 18:31:49',	'2020-10-05 18:31:49');

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1,	1),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	1),
(8,	1),
(9,	1),
(10,	1),
(11,	1),
(12,	1),
(13,	1),
(14,	1),
(15,	1),
(16,	1),
(17,	1),
(18,	1),
(19,	1),
(20,	1),
(21,	1),
(22,	1),
(23,	1),
(24,	1),
(25,	1),
(26,	1),
(27,	1),
(28,	1),
(29,	1),
(30,	1),
(31,	1),
(32,	1),
(33,	1),
(34,	1),
(35,	1),
(36,	1),
(37,	1),
(38,	1),
(39,	1),
(40,	1),
(42,	1),
(43,	1),
(44,	1),
(45,	1),
(46,	1),
(47,	1),
(48,	1),
(49,	1),
(50,	1),
(51,	1),
(52,	1),
(53,	1),
(54,	1),
(55,	1),
(56,	1),
(62,	1),
(63,	1),
(64,	1),
(65,	1),
(66,	1),
(67,	1),
(68,	1),
(69,	1),
(70,	1),
(71,	1),
(72,	1),
(73,	1),
(74,	1),
(75,	1),
(76,	1),
(77,	1),
(78,	1),
(79,	1),
(80,	1),
(81,	1),
(82,	1),
(83,	1),
(84,	1),
(85,	1),
(86,	1),
(87,	1),
(88,	1),
(89,	1),
(90,	1),
(91,	1);

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `plagiarisms`;
CREATE TABLE `plagiarisms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_values` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `score_values` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `plagiarism_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plagiarism_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plagiarisms_plagiarism_type_plagiarism_id_index` (`plagiarism_type`,`plagiarism_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `plagiarisms` (`id`, `id_values`, `score_values`, `plagiarism_type`, `plagiarism_id`, `created_at`, `updated_at`) VALUES
(98,	'[]',	'[]',	'App\\Models\\ClassroomResearchContent',	331,	'2020-10-06 20:49:23',	'2020-10-06 20:49:23'),
(99,	'[]',	'[]',	'App\\Models\\ClassroomResearchContent',	332,	'2020-10-06 20:49:23',	'2020-10-06 20:49:23'),
(100,	'[]',	'[]',	'App\\Models\\ClassroomResearchContent',	333,	'2020-10-06 20:49:23',	'2020-10-06 20:49:23'),
(101,	'[]',	'[]',	'App\\Models\\ClassroomResearchContent',	334,	'2020-10-06 20:49:23',	'2020-10-06 20:49:23'),
(102,	'[]',	'[]',	'App\\Models\\ClassroomResearchContent',	335,	'2020-10-06 20:49:23',	'2020-10-06 20:49:23'),
(103,	'[]',	'[]',	'App\\Models\\ClassroomResearchContent',	336,	'2020-10-06 20:49:23',	'2020-10-06 20:49:23'),
(104,	'[331,332,333,334,335,336]',	'[57.142857142857146,57.142857142857146,57.142857142857146,57.142857142857146,57.142857142857146,57.142857142857146]',	'App\\Models\\ClassroomResearchContent',	337,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(105,	'[331,332,333,334,335,336]',	'[66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667]',	'App\\Models\\ClassroomResearchContent',	338,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(106,	'[331,332,333,334,335,336]',	'[66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667]',	'App\\Models\\ClassroomResearchContent',	339,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(107,	'[331,332,333,334,335,336]',	'[66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667]',	'App\\Models\\ClassroomResearchContent',	340,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(108,	'[331,332,333,334,335,336]',	'[66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667]',	'App\\Models\\ClassroomResearchContent',	341,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(109,	'[331,332,333,334,335,336]',	'[66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667,66.66666666666667]',	'App\\Models\\ClassroomResearchContent',	342,	'2020-10-06 21:22:11',	'2020-10-06 21:22:11'),
(110,	'[331,332,333,334,335,336,337,338,339,340,341,342]',	'[0.9070294784580499,0.9070294784580499,0.9070294784580499,0.9070294784580499,0.9070294784580499,0.9070294784580499,1.3574660633484164,1.3605442176870748,1.3605442176870748,1.3605442176870748,1.3605442176870748,1.3605442176870748]',	'App\\Models\\ClassroomResearchContent',	343,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(111,	'[331,332,333,334,335,336,337,338,339,340,341,342]',	'[1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225,2.0618556701030926,1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225]',	'App\\Models\\ClassroomResearchContent',	344,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(112,	'[331,332,333,334,335,336,337,338,339,340,341,342]',	'[1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1173184357541899,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268]',	'App\\Models\\ClassroomResearchContent',	345,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(113,	'[331,332,333,334,335,336,337,338,339,340,341,342]',	'[1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4218009478672986,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086]',	'App\\Models\\ClassroomResearchContent',	346,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(114,	'[331,332,333,334,335,336,337,338,339,340,341,342]',	'[0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8310249307479224,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574]',	'App\\Models\\ClassroomResearchContent',	347,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(115,	'[331,332,333,334,335,336,337,338,339,340,341,342]',	'[0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241,1.1661807580174928,0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241]',	'App\\Models\\ClassroomResearchContent',	348,	'2020-10-06 21:24:22',	'2020-10-06 21:24:22'),
(116,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348]',	'[0.9070294784580499,0.9070294784580499,0.9070294784580499,0.9070294784580499,0.9070294784580499,0.9070294784580499,1.3574660633484164,1.3605442176870748,1.3605442176870748,1.3605442176870748,1.3605442176870748,1.3605442176870748,100,20.68126520681265,20.597322348094746,20.560747663551403,16.782006920415224,15.178571428571429]',	'App\\Models\\ClassroomResearchContent',	349,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(117,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348]',	'[1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225,2.0618556701030926,1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225,1.550387596899225,30.900243309002434,100,22.246455834242095,25.935162094763093,18.148820326678766,21.20075046904315]',	'App\\Models\\ClassroomResearchContent',	350,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(118,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348]',	'[1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1173184357541899,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268,1.1194029850746268,20.803295571575696,22.900763358778626,100,18.29652996845426,27.018385291766588,20.5761316872428]',	'App\\Models\\ClassroomResearchContent',	351,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(119,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348]',	'[1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4218009478672986,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086,1.4251781472684086,21.962616822429908,17.955112219451372,20.189274447949526,100,19.54225352112676,18.181818181818183]',	'App\\Models\\ClassroomResearchContent',	352,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(120,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348]',	'[0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8310249307479224,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574,0.8321775312066574,9.86159169550173,16.1524500907441,26.85851318944844,18.838028169014084,100,30.285714285714285]',	'App\\Models\\ClassroomResearchContent',	353,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(121,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348]',	'[0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241,1.1661807580174928,0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241,0.8759124087591241,19.642857142857142,10.318949343339588,23.53909465020576,14.545454545454545,24.428571428571427,100]',	'App\\Models\\ClassroomResearchContent',	354,	'2020-10-06 21:24:28',	'2020-10-06 21:24:28'),
(122,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354]',	'[3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,4.25531914893617,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,27.65273311897106,19.718309859154928,24.546722454672246,18.6046511627907,13.968957871396896,11.316397228637413,27.65273311897106,19.718309859154928,24.546722454672246,18.6046511627907,13.968957871396896,11.316397228637413]',	'App\\Models\\ClassroomResearchContent',	355,	'2020-10-06 21:31:35',	'2020-10-06 21:31:35'),
(123,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354]',	'[4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,5.673758865248227,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,14.608695652173912,22.264875239923224,14.626865671641792,11.891891891891891,10.994152046783626,15.873015873015873,14.608695652173912,22.264875239923224,14.626865671641792,11.891891891891891,10.994152046783626,15.873015873015873]',	'App\\Models\\ClassroomResearchContent',	356,	'2020-10-06 21:31:36',	'2020-10-06 21:31:36'),
(124,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354]',	'[3.896103896103896,3.896103896103896,3.896103896103896,3.896103896103896,3.896103896103896,3.896103896103896,3.870967741935484,2.5974025974025974,2.5974025974025974,2.5974025974025974,2.5974025974025974,2.5974025974025974,14.261460101867572,26.16822429906542,11.403508771929825,11.24780316344464,13.578826237054086,10.804321728691477,14.261460101867572,26.16822429906542,11.403508771929825,11.24780316344464,13.578826237054086,10.804321728691477]',	'App\\Models\\ClassroomResearchContent',	357,	'2020-10-06 21:31:36',	'2020-10-06 21:31:36'),
(125,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354]',	'[4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,5.797101449275362,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,28.321678321678323,17.76061776061776,23.68815592203898,14.855072463768115,14.084507042253522,10.784313725490197,28.321678321678323,17.76061776061776,23.68815592203898,14.855072463768115,14.084507042253522,10.784313725490197]',	'App\\Models\\ClassroomResearchContent',	358,	'2020-10-06 21:31:36',	'2020-10-06 21:31:36'),
(126,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354]',	'[1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,2.4096385542168677,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,18.798955613577025,21.910112359550563,22.067363530778167,8.579088471849866,10.707456978967496,4.356435643564357,18.798955613577025,21.910112359550563,22.067363530778167,8.579088471849866,10.707456978967496,4.356435643564357]',	'App\\Models\\ClassroomResearchContent',	359,	'2020-10-06 21:31:36',	'2020-10-06 21:31:36'),
(127,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354]',	'[2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,3.088803088803089,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,18.75901875901876,23.78716744913928,27.411167512690355,13.37295690936107,15.827338129496402,17.716115261472787,18.75901875901876,23.78716744913928,27.411167512690355,13.37295690936107,15.827338129496402,17.716115261472787]',	'App\\Models\\ClassroomResearchContent',	360,	'2020-10-06 21:31:36',	'2020-10-06 21:31:36'),
(128,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360]',	'[3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,4.25531914893617,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,27.65273311897106,19.718309859154928,24.546722454672246,18.6046511627907,13.968957871396896,11.316397228637413,27.65273311897106,19.718309859154928,24.546722454672246,18.6046511627907,13.968957871396896,11.316397228637413,100,38.62928348909657,28.65671641791045,42.138364779874216,24.21875,24.145785876993166]',	'App\\Models\\ClassroomResearchContent',	361,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(129,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360]',	'[4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,5.673758865248227,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,14.608695652173912,22.264875239923224,14.626865671641792,11.891891891891891,10.994152046783626,15.873015873015873,14.608695652173912,22.264875239923224,14.626865671641792,11.891891891891891,10.994152046783626,15.873015873015873,37.38317757009346,100,34.72222222222222,48.708487084870846,27.096774193548388,29.591836734693878]',	'App\\Models\\ClassroomResearchContent',	362,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(130,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360]',	'[3.896103896103896,3.896103896103896,3.896103896103896,3.896103896103896,3.896103896103896,3.896103896103896,3.870967741935484,2.5974025974025974,2.5974025974025974,2.5974025974025974,2.5974025974025974,2.5974025974025974,14.261460101867572,26.16822429906542,11.403508771929825,11.24780316344464,13.578826237054086,10.804321728691477,14.261460101867572,26.16822429906542,11.403508771929825,11.24780316344464,13.578826237054086,10.804321728691477,28.65671641791045,34.72222222222222,100,14.736842105263158,15.448851774530272,8.374384236453203]',	'App\\Models\\ClassroomResearchContent',	363,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(131,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360]',	'[4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,5.797101449275362,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,28.321678321678323,17.76061776061776,23.68815592203898,14.855072463768115,14.084507042253522,10.784313725490197,28.321678321678323,17.76061776061776,23.68815592203898,14.855072463768115,14.084507042253522,10.784313725490197,44.0251572327044,48.708487084870846,14.736842105263158,100,25.974025974025974,32.390745501285345]',	'App\\Models\\ClassroomResearchContent',	364,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(132,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360]',	'[1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,2.4096385542168677,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,18.798955613577025,21.910112359550563,22.067363530778167,8.579088471849866,10.707456978967496,4.356435643564357,18.798955613577025,21.910112359550563,22.067363530778167,8.579088471849866,10.707456978967496,4.356435643564357,22.265625,25.376344086021504,14.19624217118998,24.242424242424242,100,19.21097770154374]',	'App\\Models\\ClassroomResearchContent',	365,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(133,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360]',	'[2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,3.088803088803089,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,18.75901875901876,23.78716744913928,27.411167512690355,13.37295690936107,15.827338129496402,17.716115261472787,18.75901875901876,23.78716744913928,27.411167512690355,13.37295690936107,15.827338129496402,17.716115261472787,25.5125284738041,30.612244897959183,8.374384236453203,30.848329048843187,17.495711835334475,100]',	'App\\Models\\ClassroomResearchContent',	366,	'2020-10-06 21:31:41',	'2020-10-06 21:31:41'),
(134,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366]',	'[3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,4.25531914893617,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,3.2085561497326203,27.65273311897106,19.718309859154928,24.546722454672246,18.6046511627907,13.968957871396896,11.316397228637413,27.65273311897106,19.718309859154928,24.546722454672246,18.6046511627907,13.968957871396896,11.316397228637413,100,38.62928348909657,28.65671641791045,42.138364779874216,24.21875,24.145785876993166,100,38.62928348909657,28.65671641791045,42.138364779874216,24.21875,24.145785876993166]',	'App\\Models\\ClassroomResearchContent',	367,	'2020-10-06 21:31:56',	'2020-10-06 21:31:56'),
(135,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366]',	'[4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,5.673758865248227,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,4.285714285714286,14.608695652173912,22.264875239923224,14.626865671641792,11.891891891891891,10.994152046783626,15.873015873015873,14.608695652173912,22.264875239923224,14.626865671641792,11.891891891891891,10.994152046783626,15.873015873015873,37.38317757009346,100,34.72222222222222,48.708487084870846,27.096774193548388,29.591836734693878,37.38317757009346,100,34.72222222222222,48.708487084870846,27.096774193548388,29.591836734693878]',	'App\\Models\\ClassroomResearchContent',	368,	'2020-10-06 21:31:57',	'2020-10-06 21:31:57'),
(136,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366]',	'[3.896103896103896,3.896103896103896,3.896103896103896,3.896103896103896,3.896103896103896,3.896103896103896,3.870967741935484,2.5974025974025974,2.5974025974025974,2.5974025974025974,2.5974025974025974,2.5974025974025974,14.261460101867572,26.16822429906542,11.403508771929825,11.24780316344464,13.578826237054086,10.804321728691477,14.261460101867572,26.16822429906542,11.403508771929825,11.24780316344464,13.578826237054086,10.804321728691477,28.65671641791045,34.72222222222222,100,14.736842105263158,15.448851774530272,8.374384236453203,28.65671641791045,34.72222222222222,100,14.736842105263158,15.448851774530272,8.374384236453203]',	'App\\Models\\ClassroomResearchContent',	369,	'2020-10-06 21:31:57',	'2020-10-06 21:31:57'),
(137,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366]',	'[4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,5.797101449275362,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,4.37956204379562,28.321678321678323,17.76061776061776,23.68815592203898,14.855072463768115,14.084507042253522,10.784313725490197,28.321678321678323,17.76061776061776,23.68815592203898,14.855072463768115,14.084507042253522,10.784313725490197,44.0251572327044,48.708487084870846,14.736842105263158,100,25.974025974025974,32.390745501285345,44.0251572327044,48.708487084870846,14.736842105263158,100,25.974025974025974,32.390745501285345]',	'App\\Models\\ClassroomResearchContent',	370,	'2020-10-06 21:31:57',	'2020-10-06 21:31:57'),
(138,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366]',	'[1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,2.4096385542168677,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,1.8126888217522659,18.798955613577025,21.910112359550563,22.067363530778167,8.579088471849866,10.707456978967496,4.356435643564357,18.798955613577025,21.910112359550563,22.067363530778167,8.579088471849866,10.707456978967496,4.356435643564357,22.265625,25.376344086021504,14.19624217118998,24.242424242424242,100,19.21097770154374,22.265625,25.376344086021504,14.19624217118998,24.242424242424242,100,19.21097770154374]',	'App\\Models\\ClassroomResearchContent',	371,	'2020-10-06 21:31:57',	'2020-10-06 21:31:57'),
(139,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366]',	'[2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,3.088803088803089,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,2.3255813953488373,18.75901875901876,23.78716744913928,27.411167512690355,13.37295690936107,15.827338129496402,17.716115261472787,18.75901875901876,23.78716744913928,27.411167512690355,13.37295690936107,15.827338129496402,17.716115261472787,25.5125284738041,30.612244897959183,8.374384236453203,30.848329048843187,17.495711835334475,100,25.5125284738041,30.612244897959183,8.374384236453203,30.848329048843187,17.495711835334475,100]',	'App\\Models\\ClassroomResearchContent',	372,	'2020-10-06 21:31:57',	'2020-10-06 21:31:57'),
(140,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372]',	'[36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,33.333333333333336,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,3.1390134529147984,3.5714285714285716,2.957486136783734,3.755868544600939,1.9283746556473829,2.318840579710145,3.1390134529147984,3.5714285714285716,2.957486136783734,3.755868544600939,1.9283746556473829,2.318840579710145,8.333333333333334,11.03448275862069,8.80503144654088,8.450704225352112,4.761904761904762,5.32319391634981,8.333333333333334,11.03448275862069,8.80503144654088,8.450704225352112,4.761904761904762,5.32319391634981,8.333333333333334,11.03448275862069,8.80503144654088,8.450704225352112,4.761904761904762,5.32319391634981]',	'App\\Models\\ClassroomResearchContent',	373,	'2020-10-12 00:05:20',	'2020-10-12 00:05:20'),
(141,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372]',	'[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]',	'App\\Models\\ClassroomResearchContent',	374,	'2020-10-12 00:05:20',	'2020-10-12 00:05:20'),
(142,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372]',	'[36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,33.333333333333336,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,3.1390134529147984,3.5714285714285716,2.957486136783734,3.755868544600939,1.9283746556473829,2.318840579710145,3.1390134529147984,3.5714285714285716,2.957486136783734,3.755868544600939,1.9283746556473829,2.318840579710145,8.333333333333334,11.03448275862069,8.80503144654088,8.450704225352112,4.761904761904762,5.32319391634981,8.333333333333334,11.03448275862069,8.80503144654088,8.450704225352112,4.761904761904762,5.32319391634981,8.333333333333334,11.03448275862069,8.80503144654088,8.450704225352112,4.761904761904762,5.32319391634981]',	'App\\Models\\ClassroomResearchContent',	375,	'2020-10-12 00:05:20',	'2020-10-12 00:05:20'),
(143,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372]',	'[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]',	'App\\Models\\ClassroomResearchContent',	376,	'2020-10-12 00:05:20',	'2020-10-12 00:05:20'),
(144,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372]',	'[33.333333333333336,33.333333333333336,33.333333333333336,33.333333333333336,33.333333333333336,33.333333333333336,28.571428571428573,33.333333333333336,33.333333333333336,33.333333333333336,33.333333333333336,33.333333333333336,1.3605442176870748,1.550387596899225,1.1194029850746268,1.4251781472684086,0.8321775312066574,0.8759124087591241,1.3605442176870748,1.550387596899225,1.1194029850746268,1.4251781472684086,0.8321775312066574,0.8759124087591241,3.2085561497326203,4.285714285714286,3.896103896103896,4.37956204379562,1.8126888217522659,2.3255813953488373,3.2085561497326203,4.285714285714286,3.896103896103896,4.37956204379562,1.8126888217522659,2.3255813953488373,3.2085561497326203,4.285714285714286,3.896103896103896,4.37956204379562,1.8126888217522659,2.3255813953488373]',	'App\\Models\\ClassroomResearchContent',	377,	'2020-10-12 00:05:20',	'2020-10-12 00:05:20'),
(145,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372]',	'[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]',	'App\\Models\\ClassroomResearchContent',	378,	'2020-10-12 00:05:20',	'2020-10-12 00:05:20'),
(146,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378]',	'[28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,25,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,16.666666666666668,0,16.666666666666668,0,28.571428571428573,0]',	'App\\Models\\ClassroomResearchContent',	379,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(147,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378]',	'[28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,25,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,16.666666666666668,0,16.666666666666668,0,28.571428571428573,0]',	'App\\Models\\ClassroomResearchContent',	380,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(148,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378]',	'[28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,25,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,16.666666666666668,0,16.666666666666668,0,28.571428571428573,0]',	'App\\Models\\ClassroomResearchContent',	381,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(149,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378]',	'[28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,25,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,16.666666666666668,0,16.666666666666668,0,28.571428571428573,0]',	'App\\Models\\ClassroomResearchContent',	382,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(150,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378]',	'[28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,25,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,28.571428571428573,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,1.8099547511312217,2.0618556701030926,1.48975791433892,1.8957345971563981,1.10803324099723,1.1661807580174928,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,4.25531914893617,5.673758865248227,5.161290322580645,2.898550724637681,2.4096385542168677,3.088803088803089,16.666666666666668,0,16.666666666666668,0,28.571428571428573,0]',	'App\\Models\\ClassroomResearchContent',	383,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(151,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378]',	'[36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,36.36363636363637,16.666666666666668,18.181818181818183,18.181818181818183,18.181818181818183,18.181818181818183,18.181818181818183,3.1390134529147984,3.5714285714285716,2.957486136783734,3.755868544600939,1.9283746556473829,1.7391304347826086,3.1390134529147984,3.5714285714285716,2.957486136783734,3.755868544600939,1.9283746556473829,1.7391304347826086,8.333333333333334,9.655172413793103,8.80503144654088,8.450704225352112,4.761904761904762,5.32319391634981,8.333333333333334,9.655172413793103,8.80503144654088,8.450704225352112,4.761904761904762,5.32319391634981,8.333333333333334,9.655172413793103,8.80503144654088,8.450704225352112,4.761904761904762,5.32319391634981,75,0,75,0,36.36363636363637,0]',	'App\\Models\\ClassroomResearchContent',	384,	'2020-10-13 01:18:50',	'2020-10-13 01:18:50'),
(152,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384]',	'[0.39551746868820037,0.39551746868820037,0.39551746868820037,0.39551746868820037,0.39551746868820037,0.39551746868820037,0.5270092226613966,0.39551746868820037,0.39551746868820037,0.39551746868820037,0.39551746868820037,0.39551746868820037,17.725409836065573,7.376185458377239,13.38544211040547,11.490683229813664,4.480286738351254,7.468123861566484,17.725409836065573,7.376185458377239,13.38544211040547,11.490683229813664,4.480286738351254,7.468123861566484,12.720848056537102,9.206541490006057,6.966966966966967,9.101941747572816,12.37785016286645,13.90616167326173,12.720848056537102,9.206541490006057,6.966966966966967,9.101941747572816,12.37785016286645,13.90616167326173,12.720848056537102,9.206541490006057,6.966966966966967,9.101941747572816,12.37785016286645,13.90616167326173,1.0512483574244416,0,1.0512483574244416,0,0.39551746868820037,0,0.5270092226613966,0.5270092226613966,0.5270092226613966,0.5270092226613966,0.5270092226613966,0.9198423127463863]',	'App\\Models\\ClassroomResearchContent',	385,	'2021-06-13 23:38:08',	'2021-06-13 23:38:08'),
(153,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384]',	'[1.6901408450704225,1.6901408450704225,1.6901408450704225,1.6901408450704225,1.6901408450704225,1.6901408450704225,1.1235955056179776,1.6901408450704225,1.6901408450704225,1.6901408450704225,1.6901408450704225,1.6901408450704225,11.89873417721519,26.08695652173913,11.299435028248588,15.064935064935066,7.102803738317757,9.864603481624759,11.89873417721519,26.08695652173913,11.299435028248588,15.064935064935066,7.102803738317757,9.864603481624759,26.865671641791046,15.950920245398773,21.47117296222664,17.28395061728395,17.352941176470587,20.42833607907743,26.865671641791046,15.950920245398773,21.47117296222664,17.28395061728395,17.352941176470587,20.42833607907743,26.865671641791046,15.950920245398773,21.47117296222664,17.28395061728395,17.352941176470587,20.42833607907743,3.888888888888889,0,3.888888888888889,0,1.6901408450704225,0,2.247191011235955,2.247191011235955,2.247191011235955,2.247191011235955,2.247191011235955,2.2222222222222223]',	'App\\Models\\ClassroomResearchContent',	386,	'2021-06-13 23:38:08',	'2021-06-13 23:38:08'),
(154,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384]',	'[1.9292604501607717,1.9292604501607717,1.9292604501607717,1.9292604501607717,1.9292604501607717,1.9292604501607717,1.2820512820512822,1.9292604501607717,1.9292604501607717,1.9292604501607717,1.9292604501607717,1.9292604501607717,18.766756032171582,22.54335260115607,16.171224732461354,15.426997245179063,9.551656920077972,9.494949494949495,18.766756032171582,22.54335260115607,16.171224732461354,15.426997245179063,9.551656920077972,9.494949494949495,30.48780487804878,16.629213483146067,23.529411764705884,23.529411764705884,22.0125786163522,16.69626998223801,30.48780487804878,16.629213483146067,23.529411764705884,23.529411764705884,22.0125786163522,16.69626998223801,30.48780487804878,16.629213483146067,23.529411764705884,23.529411764705884,22.0125786163522,16.69626998223801,5.063291139240507,0,5.063291139240507,0,1.9292604501607717,0,2.5641025641025643,2.5641025641025643,2.5641025641025643,2.5641025641025643,2.5641025641025643,4.430379746835443]',	'App\\Models\\ClassroomResearchContent',	387,	'2021-06-13 23:38:08',	'2021-06-13 23:38:08'),
(155,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384]',	'[0.9852216748768473,0.9852216748768473,0.9852216748768473,0.9852216748768473,0.9852216748768473,0.9852216748768473,0.9836065573770492,0.9852216748768473,0.9852216748768473,0.9852216748768473,0.9852216748768473,0.9852216748768473,21.839080459770116,21.616161616161616,18.261633011413522,7.421875,9.818731117824774,10.093167701863354,21.839080459770116,21.616161616161616,18.261633011413522,7.421875,9.818731117824774,10.093167701863354,19.240506329113924,10.228802153432031,16.380449141347423,8.91891891891892,25.053533190578158,18.118466898954704,19.240506329113924,10.228802153432031,16.380449141347423,8.91891891891892,25.053533190578158,18.118466898954704,19.240506329113924,10.228802153432031,16.380449141347423,8.91891891891892,25.053533190578158,18.118466898954704,1.9543973941368078,0,1.9543973941368078,0,0.9852216748768473,0,0.9836065573770492,0.9836065573770492,0.9836065573770492,0.9836065573770492,0.9836065573770492,2.2801302931596092]',	'App\\Models\\ClassroomResearchContent',	388,	'2021-06-13 23:38:08',	'2021-06-13 23:38:08'),
(156,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384]',	'[0.19274012206874397,0.19274012206874397,0.19274012206874397,0.19274012206874397,0.19274012206874397,0.19274012206874397,0.25690430314707774,0.19274012206874397,0.19274012206874397,0.19274012206874397,0.19274012206874397,0.19274012206874397,7.609921082299887,10.188895248998282,11.96815811144661,6.292517006802721,8.307210031347962,7.805907172995781,7.609921082299887,10.188895248998282,11.96815811144661,6.292517006802721,8.307210031347962,7.805907172995781,4.918032786885246,4.742839544194641,4.415823367065317,2.9593094944512948,6.340895869691681,8.439821693907875,4.918032786885246,4.742839544194641,4.415823367065317,2.9593094944512948,6.340895869691681,8.439821693907875,4.918032786885246,4.742839544194641,4.415823367065317,2.9593094944512948,6.340895869691681,8.439821693907875,0.4490057729313663,0,0.4490057729313663,0,0.19274012206874397,0,0.25690430314707774,0.25690430314707774,0.25690430314707774,0.25690430314707774,0.25690430314707774,0.4490057729313663]',	'App\\Models\\ClassroomResearchContent',	389,	'2021-06-13 23:38:08',	'2021-06-13 23:38:08'),
(157,	'[331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384]',	'[0.027949876554711883,0.027949876554711883,0.027949876554711883,0.027949876554711883,0.027949876554711883,0.027949876554711883,0.027948574622694244,0.027949876554711883,0.027949876554711883,0.027949876554711883,0.027949876554711883,0.027949876554711883,1.3149484065382158,1.748443793482241,1.900259126244488,1.654327757974591,1.6049048778288701,1.1920888648062855,1.3149484065382158,1.748443793482241,1.900259126244488,1.654327757974591,1.6049048778288701,1.1920888648062855,1.3026607538802661,0.8981065691403176,0.8049965301873698,0.8611908510047227,1.5877386196769456,1.362862010221465,1.3026607538802661,0.8981065691403176,0.8049965301873698,0.8611908510047227,1.5877386196769456,1.362862010221465,1.3026607538802661,0.8981065691403176,0.8049965301873698,0.8611908510047227,1.5877386196769456,1.362862010221465,0.06520119225037257,0,0.06520119225037257,0,0.027949876554711883,0,0.037264766163592325,0.037264766163592325,0.037264766163592325,0.037264766163592325,0.037264766163592325,0.06520119225037257]',	'App\\Models\\ClassroomResearchContent',	390,	'2021-06-13 23:38:09',	'2021-06-13 23:38:09');

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1,	0,	NULL,	'Lorem Ipsum Post',	NULL,	'This is the excerpt for the Lorem Ipsum Post',	'<p>This is the body of the lorem ipsum post</p>',	'posts/post1.jpg',	'lorem-ipsum-post',	'This is the meta description',	'keyword1, keyword2, keyword3',	'DRAFT',	0,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(2,	0,	NULL,	'My Sample Post',	NULL,	'This is the excerpt for the sample Post',	'<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>',	'posts/post2.jpg',	'my-sample-post',	'Meta Description for sample post',	'keyword1, keyword2, keyword3',	'DRAFT',	0,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(3,	0,	NULL,	'Latest Post',	NULL,	'This is the excerpt for the latest post',	'<p>This is the body for the latest post</p>',	'posts/post3.jpg',	'latest-post',	'This is the meta description',	'keyword1, keyword2, keyword3',	'DRAFT',	0,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(4,	0,	NULL,	'Yarr Post',	NULL,	'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.',	'<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>',	'posts/post4.jpg',	'yarr-post',	'this be a meta descript',	'keyword1, keyword2, keyword3',	'DRAFT',	0,	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(5,	1,	NULL,	'asd',	NULL,	NULL,	'asd',	NULL,	'asd',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 00:54:21',	'2020-10-01 00:54:21'),
(7,	1,	NULL,	'asd',	NULL,	NULL,	'asd babi',	NULL,	'asd1601538905',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 00:55:05',	'2020-10-01 00:55:05'),
(8,	1,	NULL,	'asd',	NULL,	NULL,	'asd babi',	NULL,	'asd1601538906',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 00:55:06',	'2020-10-01 00:55:06'),
(9,	1,	NULL,	'asdasd',	NULL,	NULL,	'asdasdasd',	NULL,	'asdasd1601539354',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:02:34',	'2020-10-01 01:02:34'),
(10,	1,	NULL,	'asdasd',	NULL,	NULL,	'asdasdasdsssssssssss',	NULL,	'asdasd1601539357',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:02:37',	'2020-10-01 01:02:37'),
(11,	1,	NULL,	'asdasd ada',	NULL,	NULL,	'anja',	NULL,	'asdasd-ada1601539363',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:02:43',	'2020-10-01 01:02:43'),
(12,	1,	NULL,	'oi anjay',	NULL,	NULL,	'oi',	NULL,	'oi-anjay1601540126',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:15:26',	'2020-10-01 01:15:26'),
(13,	1,	NULL,	'asd',	NULL,	NULL,	'asdasdasd',	NULL,	'asd1601540160',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:16:00',	'2020-10-01 01:16:00'),
(14,	1,	NULL,	'Mau tanya',	NULL,	NULL,	'Jadi gini, Bapak tau ****?',	NULL,	'mau-tanya1601541184',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:33:04',	'2020-10-01 01:33:04'),
(15,	1,	NULL,	'asd',	NULL,	NULL,	'asdasd',	NULL,	'asd1601541243',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:34:03',	'2020-10-01 01:34:03'),
(16,	1,	NULL,	'asdasdad',	NULL,	NULL,	'asdasd',	NULL,	'asdasdad1601541248',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:34:08',	'2020-10-01 01:34:08'),
(17,	1,	NULL,	'ads',	NULL,	NULL,	'asd',	NULL,	'ads1601541300',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:35:00',	'2020-10-01 01:35:00'),
(18,	1,	NULL,	'asd',	NULL,	NULL,	'adsasd',	NULL,	'asd1601541313',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:35:13',	'2020-10-01 01:35:13'),
(19,	1,	NULL,	'asdad',	NULL,	NULL,	'asdasssssssssssss',	NULL,	'asdad1601541338',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:35:38',	'2020-10-01 01:35:38'),
(20,	1,	NULL,	'list can contain',	NULL,	NULL,	'list can contain a group of items which will display on click utilizing v-item-group\'s activator slot. Expansion lists are also used within the v-navigation-drawer component.',	NULL,	'list-can-contain1601541620',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:40:20',	'2020-10-01 01:40:20'),
(21,	1,	NULL,	'list can contain',	NULL,	NULL,	'list can contain a group of items which will display on click utilizing v-item-group\'s activator slot. Expansion lists are also used within the v-navigation-drawer component.list can contain a group of items which will display on click utilizing v-item-group\'s activator slot. Expansion lists are also used within the v-navigation-drawer component.',	NULL,	'list-can-contain1601541628',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:40:28',	'2020-10-01 01:40:28'),
(22,	1,	NULL,	'list can contain a group of items which will display on click utilizing v-item-group\'s activator slot. Expansion lists are also used within the v-navigation-drawer component.',	NULL,	NULL,	'list can contain a group of items which will display on click utilizing v-item-group\'s activator slot. Expansion lists are also used within the v-navigation-drawer component.list can contain a group of items which will display on click utilizing v-item-group\'s activator slot. Expansion lists are also used within the v-navigation-drawer component.',	NULL,	'list-can-contain-a-group-of-items-which-will-display-on-click-utilizing-v-item-groups-activator-slot-expansion-lists-are-also-used-within-the-v-navigation-drawer-component1601541657',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:40:57',	'2020-10-01 01:40:57'),
(23,	1,	NULL,	'hmmm',	NULL,	NULL,	'whereメソッドは、アイテム値をチェックするときに「緩い」比較を使用します。つまり、整数値を持つ文字列は、同じ値の整数と等しいと見なされます。',	NULL,	'hmmm1601542590',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 01:56:30',	'2020-10-01 01:56:30'),
(24,	1,	NULL,	'zdsad',	NULL,	NULL,	'adsasdasdasd',	NULL,	'zdsad1601543031',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 02:03:51',	'2020-10-01 02:03:51'),
(25,	1,	NULL,	'asd',	NULL,	NULL,	'asdasdad',	NULL,	'asd1601543049',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 02:04:09',	'2020-10-01 02:04:09'),
(26,	1,	NULL,	'Saya Mau tanya',	NULL,	NULL,	'Jadi gini',	NULL,	'saya-mau-tanya1601600974',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 18:09:34',	'2020-10-01 18:09:34'),
(27,	1,	NULL,	'test gan',	NULL,	NULL,	'jadi gini mas',	NULL,	'test-gan1601605462',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 19:24:22',	'2020-10-01 19:24:22'),
(28,	1,	NULL,	'Nested Resources',	NULL,	NULL,	'Sometimes you may need to define routes to a nested resource. For example, a photo resource may have multiple comments that may be attached to the photo. To nest the resource controllers, use \"dot\" notation in your route declaration:',	NULL,	'nested-resources1601605524',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 19:25:24',	'2020-10-01 19:25:24'),
(29,	1,	NULL,	'asd',	NULL,	NULL,	'asdasd',	NULL,	'asd1601607427',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-01 19:57:07',	'2020-10-01 19:57:07'),
(30,	1,	NULL,	'aa',	NULL,	NULL,	'aa',	NULL,	'aa1602207967',	NULL,	NULL,	'PUBLISHED',	0,	'2020-10-08 18:46:07',	'2020-10-08 18:46:07'),
(31,	1,	NULL,	'Bagaimana cara membuat judul',	NULL,	NULL,	'Bagaimana cara membuat judul yang baik',	NULL,	'bagaimana-cara-membuat-judul1623628774',	NULL,	NULL,	'PUBLISHED',	0,	'2021-06-13 23:59:34',	'2021-06-13 23:59:34'),
(32,	1,	NULL,	'Membuat judul',	NULL,	NULL,	'Bagaimana membuat judul yang baik',	NULL,	'membuat-judul1623634345',	NULL,	NULL,	'PUBLISHED',	0,	'2021-06-14 01:32:25',	'2021-06-14 01:32:25'),
(33,	1,	NULL,	'jalksdjkl',	NULL,	NULL,	'asljdklasd',	NULL,	'jalksdjkl1623655467',	NULL,	NULL,	'PUBLISHED',	0,	'2021-06-14 07:24:27',	'2021-06-14 07:24:27'),
(34,	4,	NULL,	'test',	NULL,	NULL,	'test',	NULL,	'test1623655540',	NULL,	NULL,	'PUBLISHED',	0,	'2021-06-14 07:25:40',	'2021-06-14 07:25:40');

DROP TABLE IF EXISTS `posttests`;
CREATE TABLE `posttests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posttests` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'Paket Post Tes 1',	NULL,	'2020-10-05 18:34:52',	'2020-10-05 18:34:52');

DROP TABLE IF EXISTS `posttest_question_lists`;
CREATE TABLE `posttest_question_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `posttest_id` bigint(20) unsigned NOT NULL,
  `question_list_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posttest_question_lists_posttest_id_foreign` (`posttest_id`),
  KEY `posttest_question_lists_question_list_id_foreign` (`question_list_id`),
  CONSTRAINT `posttest_question_lists_posttest_id_foreign` FOREIGN KEY (`posttest_id`) REFERENCES `posttests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posttest_question_lists_question_list_id_foreign` FOREIGN KEY (`question_list_id`) REFERENCES `question_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posttest_question_lists` (`id`, `posttest_id`, `question_list_id`, `created_at`, `updated_at`) VALUES
(1,	1,	12,	NULL,	NULL),
(2,	1,	13,	NULL,	NULL);

DROP TABLE IF EXISTS `pretests`;
CREATE TABLE `pretests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pretests` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'Soal Pre Test 1',	'Soal Pre Test Soal Penelitian Tindakan',	'2020-09-28 00:36:54',	'2020-09-28 00:36:54'),
(2,	'Soal Pre Test 2',	'Soal Pre Test Soal Penelitian Tindakan gelombang 2',	'2020-09-28 00:37:00',	'2020-09-28 19:03:24'),
(3,	'Pretest 3',	NULL,	'2020-10-08 20:29:45',	'2020-10-08 20:29:45');

DROP TABLE IF EXISTS `pretest_question_lists`;
CREATE TABLE `pretest_question_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pretest_id` bigint(20) unsigned NOT NULL,
  `question_list_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pretest_question_lists_pretest_id_foreign` (`pretest_id`),
  KEY `pretest_question_lists_question_list_id_foreign` (`question_list_id`),
  CONSTRAINT `pretest_question_lists_pretest_id_foreign` FOREIGN KEY (`pretest_id`) REFERENCES `pretests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pretest_question_lists_question_list_id_foreign` FOREIGN KEY (`question_list_id`) REFERENCES `question_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pretest_question_lists` (`id`, `pretest_id`, `question_list_id`, `created_at`, `updated_at`) VALUES
(1,	1,	2,	NULL,	NULL),
(2,	1,	1,	NULL,	NULL),
(3,	1,	4,	NULL,	NULL),
(4,	2,	2,	NULL,	NULL),
(5,	2,	4,	NULL,	NULL),
(6,	1,	5,	NULL,	NULL),
(15,	1,	9,	NULL,	NULL),
(16,	1,	10,	NULL,	NULL),
(17,	1,	11,	NULL,	NULL),
(18,	3,	15,	NULL,	NULL),
(19,	3,	16,	NULL,	NULL);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `school_place` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `educational_level_id` bigint(20) unsigned DEFAULT NULL,
  `unit_kerja` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_kepala_satuan_pendidikan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_kepala_satuan_pendidikan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  KEY `profiles_educational_level_id_foreign` (`educational_level_id`),
  CONSTRAINT `profiles_educational_level_id_foreign` FOREIGN KEY (`educational_level_id`) REFERENCES `educational_levels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `profiles` (`id`, `user_id`, `school_place`, `home_address`, `nip`, `nik`, `contact`, `educational_level_id`, `unit_kerja`, `nama_kepala_satuan_pendidikan`, `nip_kepala_satuan_pendidikan`, `gender`, `birthdate`, `created_at`, `updated_at`) VALUES
(1,	1,	'1',	'1',	'111',	'1',	'1111',	3,	'111',	'111',	'11',	'',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `question_list_id` bigint(20) unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_campaign_id_foreign` (`campaign_id`),
  KEY `questions_question_list_id_foreign` (`question_list_id`),
  CONSTRAINT `questions_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questions_question_list_id_foreign` FOREIGN KEY (`question_list_id`) REFERENCES `question_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `questions` (`id`, `campaign_id`, `question_list_id`, `value`, `score`, `created_at`, `updated_at`) VALUES
(76,	26,	2,	'Langkah awal dalam Penelitian Tindakan Kelas adalah melakukan …..',	NULL,	'2020-10-08 23:23:49',	'2020-10-08 23:23:49'),
(77,	26,	4,	'PTK adalah suatu bentuk inkuiri yang didahului dengan refleksi. Pendapat ini dikemukakan oleh',	NULL,	'2020-10-08 23:23:49',	'2020-10-08 23:23:49'),
(78,	27,	2,	'Langkah awal dalam Penelitian Tindakan Kelas adalah melakukan …..',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(79,	27,	1,	'Penelitian yang dirancang dengan cara menuntun peneliti ke arah suatu tindakan merupakan jenis penelitian',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(80,	27,	4,	'PTK adalah suatu bentuk inkuiri yang didahului dengan refleksi. Pendapat ini dikemukakan oleh',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(81,	27,	5,	'車の発明者は bb',	7,	'2020-10-08 23:30:58',	'2020-10-09 20:30:30'),
(82,	27,	9,	'Hasil analisis data dapat dijadikan bahan untuk ....\n1) Membuat kesimpulan dan tindak lanjut penelitian\n2) Melakukan refleksi untuk membuat perencanaan tindak lanjut\n3) Mengidentifikasi temuan penelitian',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(83,	27,	10,	'Apabila sebagian besar siswa Anda malas mengerjakan tugas-tugas yang Anda berikan, maka PTK yang akan Anda laksanakan dapat dikategorikan ke dalam domein ....',	NULL,	'2020-10-08 23:30:58',	'2020-10-08 23:30:58'),
(84,	27,	11,	'あなたの学生のほとんどがあなたが与える割り当てをするのに怠惰であるならば、あなたが実行するCARはドメインに分類することができます。',	0,	'2020-10-08 23:30:58',	'2020-10-09 20:30:30'),
(87,	29,	15,	'Dibandingkan dengan penelitian formal, sampel yang digunakan dalam PTK adalah ….',	NULL,	'2020-10-09 21:22:21',	'2020-10-09 21:22:21'),
(88,	29,	16,	'Manfaat PTK bagi sekolah adalah untuk meningkatkan ….',	NULL,	'2020-10-09 21:22:21',	'2020-10-09 21:22:21'),
(91,	31,	12,	'Jadi gini',	NULL,	'2020-10-11 19:08:48',	'2020-10-11 19:08:48'),
(92,	31,	13,	'asd',	NULL,	'2020-10-11 19:08:48',	'2020-10-11 19:08:48'),
(93,	32,	15,	'Dibandingkan dengan penelitian formal, sampel yang digunakan dalam PTK adalah ….',	NULL,	'2020-10-11 23:16:40',	'2020-10-11 23:16:40'),
(94,	32,	16,	'Manfaat PTK bagi sekolah adalah untuk meningkatkan ….',	NULL,	'2020-10-11 23:16:40',	'2020-10-11 23:16:40'),
(95,	33,	2,	'Langkah awal dalam Penelitian Tindakan Kelas adalah melakukan …..',	NULL,	'2020-10-12 00:33:03',	'2020-10-12 00:33:03'),
(96,	33,	1,	'Penelitian yang dirancang dengan cara menuntun peneliti ke arah suatu tindakan merupakan jenis penelitian',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(97,	33,	4,	'PTK adalah suatu bentuk inkuiri yang didahului dengan refleksi. Pendapat ini dikemukakan oleh',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(98,	33,	5,	'車の発明者は bb',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(99,	33,	9,	'Hasil analisis data dapat dijadikan bahan untuk ....\n1) Membuat kesimpulan dan tindak lanjut penelitian\n2) Melakukan refleksi untuk membuat perencanaan tindak lanjut\n3) Mengidentifikasi temuan penelitian',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(100,	33,	10,	'Apabila sebagian besar siswa Anda malas mengerjakan tugas-tugas yang Anda berikan, maka PTK yang akan Anda laksanakan dapat dikategorikan ke dalam domein ....',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(101,	33,	11,	'あなたの学生のほとんどがあなたが与える割り当てをするのに怠惰であるならば、あなたが実行するCARはドメインに分類することができます。',	NULL,	'2020-10-12 00:33:04',	'2020-10-12 00:33:04'),
(102,	34,	12,	'Jadi gini',	NULL,	'2020-10-12 00:37:27',	'2020-10-12 00:37:27'),
(103,	34,	13,	'asd',	NULL,	'2020-10-12 00:37:27',	'2020-10-12 00:37:27');

DROP TABLE IF EXISTS `question_lists`;
CREATE TABLE `question_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question_list_type_id` bigint(20) unsigned DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_lists_question_list_type_id_foreign` (`question_list_type_id`),
  CONSTRAINT `question_lists_question_list_type_id_foreign` FOREIGN KEY (`question_list_type_id`) REFERENCES `question_list_types` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `question_lists` (`id`, `question_list_type_id`, `value`, `created_at`, `updated_at`) VALUES
(1,	1,	'Penelitian yang dirancang dengan cara menuntun peneliti ke arah suatu tindakan merupakan jenis penelitian',	'2020-09-28 18:36:00',	'2020-09-28 19:01:37'),
(2,	1,	'Langkah awal dalam Penelitian Tindakan Kelas adalah melakukan …..',	'2020-09-28 18:43:00',	'2020-09-28 19:01:33'),
(4,	1,	'PTK adalah suatu bentuk inkuiri yang didahului dengan refleksi. Pendapat ini dikemukakan oleh',	'2020-09-28 18:47:00',	'2020-09-28 19:01:43'),
(5,	2,	'車の発明者は bb',	'2020-09-30 18:52:37',	'2020-10-04 20:54:41'),
(8,	2,	'Jadi gini ??',	'2020-10-04 20:55:13',	'2020-10-04 20:55:13'),
(9,	1,	'Hasil analisis data dapat dijadikan bahan untuk ....\n1) Membuat kesimpulan dan tindak lanjut penelitian\n2) Melakukan refleksi untuk membuat perencanaan tindak lanjut\n3) Mengidentifikasi temuan penelitian',	'2020-10-04 21:02:04',	'2020-10-04 21:02:04'),
(10,	1,	'Apabila sebagian besar siswa Anda malas mengerjakan tugas-tugas yang Anda berikan, maka PTK yang akan Anda laksanakan dapat dikategorikan ke dalam domein ....',	'2020-10-04 21:02:04',	'2020-10-04 21:02:04'),
(11,	2,	'あなたの学生のほとんどがあなたが与える割り当てをするのに怠惰であるならば、あなたが実行するCARはドメインに分類することができます。',	'2020-10-04 21:06:58',	'2020-10-04 21:06:58'),
(12,	1,	'Jadi gini',	'2020-10-05 18:45:42',	'2020-10-05 18:45:42'),
(13,	1,	'asd',	'2020-10-05 18:45:42',	'2020-10-05 18:45:42'),
(14,	1,	'asdasd',	'2020-10-08 21:07:24',	'2020-10-08 21:07:24'),
(15,	1,	'Dibandingkan dengan penelitian formal, sampel yang digunakan dalam PTK adalah ….',	'2020-10-08 21:07:39',	'2020-10-09 20:52:27'),
(16,	1,	'Manfaat PTK bagi sekolah adalah untuk meningkatkan ….',	'2020-10-09 20:52:27',	'2020-10-09 20:52:27');

DROP TABLE IF EXISTS `question_list_types`;
CREATE TABLE `question_list_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `question_list_types` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'selectoptions',	'Pilihan Ganda',	'2020-09-28 18:36:10',	'2020-09-28 18:36:10'),
(2,	'textfield',	'Uraian',	'2020-09-28 18:36:18',	'2020-09-28 18:36:18');

DROP TABLE IF EXISTS `reads`;
CREATE TABLE `reads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `read_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reads_read_type_read_id_index` (`read_type`,`read_id`),
  KEY `reads_user_id_foreign` (`user_id`),
  CONSTRAINT `reads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'Administrator',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(2,	'user',	'Normal User',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0OC2ZPOkCiKlg4qXGDZHJ5IuPv7aFAcnKoLKCaEL',	1,	'202.80.218.231',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36',	'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiOG9vS2NtVVMxT2N2dENaN0gxQW1JbjQ1bHkzQmU1RTBlbWx4NGZjRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHBzOi8vcGVsYXRpaGFucHRrb25saW5lLmNvbS9hZG1pbi9wcmV0ZXN0L2dldGNhbXBhaWducXVlc3Rpb25saXN0LzI2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRQdTBtL09mRVVpbzJyZ3lkakNiOVUub2pYWm9Sa3hjeVovN3RZZE16Vm1ZTGU1VXB0LmhzbSI7fQ==',	1623729030),
('4ktNL5gtEZNMpdixKmuWjAWT47rK0DGxu2szoq4e',	NULL,	'34.217.122.21',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmRhV2ZHNENLT0VRSkxKaEg3cEQ2QXJOSnB0V2UwZ2NZeDFjVmNJQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vcGVsYXRpaGFucHRrb25saW5lLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',	1623725051),
('9KMkKrj0LD83Fpu8BMJnEyjzLXM4Wfw6P3IvKeD5',	1,	'103.23.103.4',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVTg3WGM5dkNlZmdBYWpJSWhBTFhVNXd2TlJlTnZ5Zk9DRUxpUTkxcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRQdTBtL09mRVVpbzJyZ3lkakNiOVUub2pYWm9Sa3hjeVovN3RZZE16Vm1ZTGU1VXB0LmhzbSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkUHUwbS9PZkVVaW8ycmd5ZGpDYjlVLm9qWFpvUmt4Y3laLzd0WWRNelZtWUxlNVVwdC5oc20iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQwOiJodHRwczovL3BlbGF0aWhhbnB0a29ubGluZS5jb20vZGFzaGJvYXJkIjt9fQ==',	1623729238),
('AQtE5aZ3z8xJDUUPukb6e9i8rY6tpLGWgbnmBabK',	NULL,	'34.217.122.21',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',	'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaUowQlV2MmlBT2ExeFNTQ1B5WDZDZElkVWdaSkFzcHk0V1ZlRnBlNSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9wZWxhdGloYW5wdGtvbmxpbmUuY29tL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQwOiJodHRwczovL3BlbGF0aWhhbnB0a29ubGluZS5jb20vZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1623725051),
('FwyRrM4ukTzWhbAT3kRUIoGDLFNbJIDGi36ZSqf2',	NULL,	'35.164.215.46',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTk00WXV4WHQwcU9NYjlrb0lKZmFJZnRSQW5Vb3VPYVZkRmhYU0tVciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vcGVsYXRpaGFucHRrb25saW5lLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',	1623724767),
('L6tjKUHjIirKQ3MJ85E07wFwn1wjwlT35GBlWZQS',	NULL,	'52.26.230.141',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZldUSlV0YVlNOElrakxPdmZwNmNzYUtFaGFqdXhxaHc4VDFmc3Y4aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vcGVsYXRpaGFucHRrb25saW5lLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',	1623725234),
('qr9OnGDSnH42uRLNB655cPB2ExFxH0Jz5Auw4oEH',	1,	'159.253.145.183',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSlhSdFVpRDdlbUkxcFVkSHFDUXVrYmpkbXdhNnpVS1EzT1JwRFkydiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRQdTBtL09mRVVpbzJyZ3lkakNiOVUub2pYWm9Sa3hjeVovN3RZZE16Vm1ZTGU1VXB0LmhzbSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkUHUwbS9PZkVVaW8ycmd5ZGpDYjlVLm9qWFpvUmt4Y3laLzd0WWRNelZtWUxlNVVwdC5oc20iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjUxOiJodHRwczovL3BlbGF0aWhhbnB0a29ubGluZS5jb20vY2xhc3Nyb29tX3Jlc2VhcmNoZXMiO319',	1623720233),
('TF79wa4uWQow8uCcb1c4RaLB1PjOdgFo8xWOo1vc',	NULL,	'34.217.19.183',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVNFNndYR0MxcVBkTkZObFZ0WVJGaXF4UHE3RDUwNE1wbHFsdTNkQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vcGVsYXRpaGFucHRrb25saW5lLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',	1623724731),
('zI795miPnOFtCDX8EZiqzrj3p3kFFbyk0wNRBW2u',	NULL,	'34.217.122.21',	'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTVVUFQwcTAyY2d2dGJNV1Fwd1cybkExOFM1ZERESGw5eXk4RlVMTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vcGVsYXRpaGFucHRrb25saW5lLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',	1623725052);

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1,	'site.title',	'Site Title',	'Site Title',	'',	'text',	1,	'Site'),
(2,	'site.description',	'Site Description',	'Site Description',	'',	'text',	2,	'Site'),
(3,	'site.logo',	'Site Logo',	'',	'',	'image',	3,	'Site'),
(4,	'site.google_analytics_tracking_id',	'Google Analytics Tracking ID',	'',	'',	'text',	4,	'Site'),
(5,	'admin.bg_image',	'Admin Background Image',	'',	'',	'image',	5,	'Admin'),
(6,	'admin.title',	'Admin Title',	'Voyager',	'',	'text',	1,	'Admin'),
(7,	'admin.description',	'Admin Description',	'Welcome to Voyager. The Missing Admin for Laravel',	'',	'text',	2,	'Admin'),
(8,	'admin.loader',	'Admin Loader',	'',	'',	'image',	3,	'Admin'),
(9,	'admin.icon_image',	'Admin Icon Image',	'',	'',	'image',	4,	'Admin'),
(10,	'admin.google_analytics_client_id',	'Google Analytics Client ID (used for admin dashboard)',	'',	'',	'text',	1,	'Admin');

DROP TABLE IF EXISTS `training_materials`;
CREATE TABLE `training_materials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `training_materials` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'Materi 1',	'Kontrak Belajar dan Pre Tes',	'2020-09-30 18:50:00',	'2020-09-30 23:21:04'),
(2,	'Materi 2',	'Mengapa Perlu Menyusun PTK bagi Guru PAI dan BP',	'2020-09-30 18:50:00',	'2020-09-30 23:21:24'),
(3,	'Materi 3',	'Inventaris Masalah dan Judul PTK dan Praktik',	'2020-09-30 23:21:00',	'2020-09-30 23:21:59'),
(4,	'Materi 4',	'Menyusun Bab I Pendahuluan dan Praktik',	'2020-09-30 23:22:12',	'2020-09-30 23:22:12'),
(5,	'Materi 5',	'Menyusun Bab II Kajian Teori dan Praktik',	'2020-09-30 23:22:22',	'2020-09-30 23:22:22'),
(6,	'Materi 6',	'Menyusun Bab III Metode Penelitian dan Praktik',	'2020-09-30 23:22:30',	'2020-09-30 23:22:30'),
(7,	'Materi 7',	'Menyusun Instrumen dan RP',	'2020-09-30 23:22:37',	'2020-09-30 23:22:37'),
(8,	'Materi 8',	'Presentasi dan Finalisasi Proposal PTK',	'2020-09-30 23:22:47',	'2020-09-30 23:22:47'),
(9,	'Materi 8',	'Penguatan dan Post Tes',	'2020-09-30 23:22:59',	'2020-09-30 23:22:59');

DROP TABLE IF EXISTS `training_material_contents`;
CREATE TABLE `training_material_contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `training_material_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_material_contents_training_material_id_foreign` (`training_material_id`),
  CONSTRAINT `training_material_contents_training_material_id_foreign` FOREIGN KEY (`training_material_id`) REFERENCES `training_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `training_material_contents` (`id`, `training_material_id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1,	1,	'Lorem ipsum',	'<p>Lorem <strong>bangsad </strong>ipsum dolor sit amet, consectetur adipisicing elit. Harum maiores modi quidem veniam, expedita quis laboriosam, ullam facere adipisci, iusto, voluptate sapiente corrupti asperiores rem nemo numquam fuga ab at.asdasdasd</p>',	'2020-09-30 18:50:44',	'2020-10-07 18:32:07'),
(2,	2,	'as',	'<p><strong>ads</strong></p>',	'2020-09-30 18:50:53',	'2020-10-07 18:40:16'),
(4,	2,	'asd',	'<p>asdasd</p>',	'2020-10-07 18:40:16',	'2020-10-07 18:40:16');

DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1,	'data_types',	'display_name_singular',	5,	'pt',	'Post',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(2,	'data_types',	'display_name_singular',	6,	'pt',	'Página',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(3,	'data_types',	'display_name_singular',	1,	'pt',	'Utilizador',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(4,	'data_types',	'display_name_singular',	4,	'pt',	'Categoria',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(5,	'data_types',	'display_name_singular',	2,	'pt',	'Menu',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(6,	'data_types',	'display_name_singular',	3,	'pt',	'Função',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(7,	'data_types',	'display_name_plural',	5,	'pt',	'Posts',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(8,	'data_types',	'display_name_plural',	6,	'pt',	'Páginas',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(9,	'data_types',	'display_name_plural',	1,	'pt',	'Utilizadores',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(10,	'data_types',	'display_name_plural',	4,	'pt',	'Categorias',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(11,	'data_types',	'display_name_plural',	2,	'pt',	'Menus',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(12,	'data_types',	'display_name_plural',	3,	'pt',	'Funções',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(13,	'categories',	'slug',	1,	'pt',	'categoria-1',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(14,	'categories',	'name',	1,	'pt',	'Categoria 1',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(15,	'categories',	'slug',	2,	'pt',	'categoria-2',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(16,	'categories',	'name',	2,	'pt',	'Categoria 2',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(17,	'pages',	'title',	1,	'pt',	'Olá Mundo',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(18,	'pages',	'slug',	1,	'pt',	'ola-mundo',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(19,	'pages',	'body',	1,	'pt',	'<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(20,	'menu_items',	'title',	1,	'pt',	'Painel de Controle',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(21,	'menu_items',	'title',	2,	'pt',	'Media',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(22,	'menu_items',	'title',	12,	'pt',	'Publicações',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(23,	'menu_items',	'title',	3,	'pt',	'Utilizadores',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(24,	'menu_items',	'title',	11,	'pt',	'Categorias',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(25,	'menu_items',	'title',	13,	'pt',	'Páginas',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(26,	'menu_items',	'title',	4,	'pt',	'Funções',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(27,	'menu_items',	'title',	5,	'pt',	'Ferramentas',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(28,	'menu_items',	'title',	6,	'pt',	'Menus',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(29,	'menu_items',	'title',	7,	'pt',	'Base de dados',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56'),
(30,	'menu_items',	'title',	10,	'pt',	'Configurações',	'2020-09-27 20:54:56',	'2020-09-27 20:54:56');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `settings`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1,	1,	'Rieqy Muwachid Erysya',	'admin@admin.com',	'users/June2021/gl3J0jaIZkMmnCe9jfOo.jpg',	'2020-10-01 02:37:11',	'$2y$10$Pu0m/OfEUio2rgydjCb9U.ojXZoRkxcyZ/7tYdMzVmYLe5Upt.hsm',	NULL,	NULL,	'hU4oRQwsoS6DkicVd4okzsEeZlD4cDYfck9U14ufHq8Bxcp5AT4oZrllbJav',	'{\"locale\":\"en\"}',	NULL,	NULL,	'2020-09-27 20:54:56',	'2021-06-14 06:13:52'),
(2,	2,	'A. Test',	'test@test.com',	'users/default.png',	NULL,	'$2y$10$7VtazROHT2u58xppmIDJCO2A95uwEssip0Fcgkf6Hp1cwv7bJYPdm',	'asd',	'as',	NULL,	'{\"locale\":\"en\"}',	NULL,	NULL,	NULL,	'2020-10-11 20:46:29'),
(3,	2,	'Ahmad Steven',	'admin2@admin2.com',	'users/default.png',	NULL,	'$2y$10$SIde9kHmkIjo/VRcIHMdGOv7j1evzrX0IIsycOTOT8pzbef91xlyW',	NULL,	NULL,	NULL,	'{\"locale\":\"en\"}',	NULL,	NULL,	'2020-10-11 20:47:13',	'2020-10-11 20:47:13'),
(4,	2,	'azwar',	'azwar@azwar.com',	'users/default.png',	NULL,	'$2y$10$UyqhqISi2oEuWtViQYDmwe/nvVz7JDE7j5Sg2B5cagQGtr8HHqhNO',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2021-06-14 06:18:31',	'2021-06-14 06:18:31');

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2021-06-15 03:58:05