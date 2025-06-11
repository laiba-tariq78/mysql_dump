-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2025 at 06:58 PM
-- Server version: 8.0.36
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spms`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `warehouse_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Riyadh', 1, 1, '2025-06-02 05:17:55', '2025-06-02 05:17:55');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Evelyn Pruitt', 1, '2025-06-02 05:19:05', '2025-06-02 05:19:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `credit_limit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_due_date` date DEFAULT NULL,
  `total_outstanding_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_type` enum('cash','card','bank_transfer','credit','cheque') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `company_name`, `vat_number`, `phone_number`, `email`, `address`, `credit_limit`, `payment_due_date`, `total_outstanding_balance`, `payment_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Piper Parks', 'Vargas and Fitzgerald Traders', '723', '+1 (503) 945-8781', 'nodin@mailinator.com', 'Do mollit ea maxime', 100.00, '2020-11-23', 100.00, 'card', 'active', '2025-06-02 05:30:32', '2025-06-02 05:30:32');

-- --------------------------------------------------------

--
-- Table structure for table `customer_discount`
--

CREATE TABLE `customer_discount` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `discount_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_discount`
--

INSERT INTO `customer_discount` (`id`, `customer_id`, `discount_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sales', '2025-06-02 05:27:44', '2025-06-02 05:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint UNSIGNED NOT NULL,
  `discount_type` enum('percentage','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `validity` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `discount_type`, `value`, `validity`, `created_at`, `updated_at`) VALUES
(1, 'percentage', 10.00, '2027-06-02', '2025-06-02 05:29:08', '2025-06-02 05:29:08'),
(2, 'fixed', 100.00, '2025-06-02', '2025-06-02 05:29:33', '2025-06-02 05:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `expense_type_id` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` enum('cash','card','bank_transfer','credit','cheque') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `expense_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `vat_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_type_id`, `amount`, `payment_type`, `expense_date`, `description`, `vat_applicable`, `created_at`, `updated_at`) VALUES
(1, 1, 1000.00, 'cash', '2025-06-02', 'Testing', 1, '2025-06-02 12:41:21', '2025-06-02 12:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_types`
--

INSERT INTO `expense_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Taxes', '2025-06-02 12:40:29', '2025-06-02 12:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_07_094715_create_permission_tables', 1),
(5, '2025_05_07_102047_create_categories_table', 1),
(6, '2025_05_07_102222_create_suppliers_table', 1),
(7, '2025_05_07_102603_create_branches_table', 1),
(8, '2025_05_07_102604_create_products_table', 1),
(9, '2025_05_07_110258_create_ware_houses_table', 1),
(10, '2025_05_07_110433_create_stock_transfers_table', 1),
(11, '2025_05_07_113004_create_discounts_table', 1),
(12, '2025_05_09_050436_create_customers_table', 1),
(13, '2025_05_09_051040_add_fields_to_users_table', 1),
(14, '2025_05_11_062255_create_expenses_table', 1),
(15, '2025_05_11_161652_create_expense_types_table', 1),
(16, '2025_05_11_165408_create_departments_table', 1),
(17, '2025_05_11_193324_create_product_discount_table', 1),
(18, '2025_05_11_193328_create_customer_discount_table', 1),
(19, '2025_05_11_210103_create_stock_purchases_table', 1),
(20, '2025_05_11_210217_create_stock_purchase_products_table', 1),
(21, '2025_05_14_150539_create_sales_table', 1),
(22, '2025_05_14_150732_create_sales_returns_table', 1),
(23, '2025_05_26_111929_create_sales_product_table', 1),
(24, '2025_05_26_111944_create_sales_return_product_table', 1),
(25, '2025_06_02_065512_create_sales_discounts_table', 1),
(26, '2025_06_04_070234_add_selling_price_column_to_products_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `purchased_date` date NOT NULL,
  `quantity_received` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `vat_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_files` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `status`, `category_id`, `supplier_id`, `branch_id`, `purchased_date`, `quantity_received`, `unit_price`, `selling_price`, `vat_number`, `barcode`, `total_cost`, `featured_image`, `other_files`, `created_at`, `updated_at`) VALUES
(1, 'Washing Machine', 1, 1, 1, 1, '1994-09-04', 946, 854.00, 860.00, '288', 'Quod nemo voluptatib', 4039431.00, 'featured_image_1749488825.jpeg', '[]', '2025-06-02 05:19:41', '2025-06-09 12:07:05'),
(2, 'Compressor', 1, 1, 1, 1, '1979-04-01', 992, 255.00, 299.00, '41', 'Consequatur saepe m', 1264880.00, 'featured_image_1749488783.webp', '[]', '2025-06-02 05:20:02', '2025-06-09 12:06:23'),
(3, 'Refrigerator', 1, 1, 1, 1, '1973-08-01', 877, 681.00, 1000.00, '673', 'Reprehenderit ut cor', 4777952.00, 'featured_image_1749485470.png', '[]', '2025-06-02 05:20:18', '2025-06-09 11:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `product_discount`
--

CREATE TABLE `product_discount` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `discount_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_discount`
--

INSERT INTO `product_discount` (`id`, `product_id`, `discount_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(2, 3, 1, NULL, NULL),
(3, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-06-02 05:17:55', '2025-06-02 05:17:55'),
(2, 'accountant', 'web', '2025-06-02 05:17:56', '2025-06-02 05:17:56'),
(3, 'sales_manager', 'web', '2025-06-02 05:17:56', '2025-06-02 05:17:56'),
(4, 'sales_representative', 'web', '2025-06-02 05:17:56', '2025-06-02 05:17:56'),
(5, 'warehouse_personal', 'web', '2025-06-02 05:17:57', '2025-06-02 05:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_discount_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_discount_value` int DEFAULT NULL,
  `shipping_cost` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_json` json DEFAULT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `order_id`, `total_amount`, `paid`, `discount`, `custom_discount_type`, `custom_discount_value`, `shipping_cost`, `vat`, `branch_id`, `payment_type`, `products_json`, `invoice_no`, `quotation_no`, `reference`, `is_online`, `status`, `created_at`, `updated_at`) VALUES
(6, 1, 'ORD68472e157eee5', 807.52, NULL, '174.38', '%', 10, 100.00, 10.00, 1, 'Cash', '[{\"id\": 2, \"price\": 129.5, \"quantity\": 2}, {\"id\": 3, \"price\": 612.9, \"quantity\": 1}]', NULL, 'QUO-000006', 'REF-000006', 1, 0, '2024-06-09 13:55:53', '2025-06-09 13:55:53'),
(7, 1, 'ORD68472e157eee5', 807.52, NULL, '174.38', '%', 10, 100.00, 10.00, 1, 'Cash', '[{\"id\": 2, \"price\": 129.5, \"quantity\": 2}, {\"id\": 3, \"price\": 612.9, \"quantity\": 1}]', NULL, 'QUO-000007', 'REF-000007', 1, 0, '2025-05-09 13:58:46', '2025-06-09 13:58:46'),
(8, 1, 'ORD68472e157eee5', 807.52, NULL, '174.38', '%', 10, 100.00, 10.00, 1, 'Cash', '[{\"id\": 2, \"price\": 129.5, \"quantity\": 2}, {\"id\": 3, \"price\": 612.9, \"quantity\": 1}]', NULL, 'QUO-000008', 'REF-000008', 1, 0, '2025-06-02 14:04:28', '2025-06-09 14:04:28'),
(9, 1, 'ORD6847309d1bee2', 2079.10, NULL, '0.00', '%', 0, 100.00, 10.00, 1, 'Cash', '[{\"id\": 2, \"price\": 169.1, \"quantity\": 1}, {\"id\": 3, \"price\": 900, \"quantity\": 2}]', NULL, 'QUO-000009', 'REF-000009', 1, 0, '2025-06-09 14:06:29', '2025-06-09 14:06:29'),
(10, 1, 'ORD6847309d1bee2', 2079.10, NULL, '0.00', '%', 0, 100.00, 10.00, 1, 'Cash', '[{\"id\": 2, \"price\": 169.1, \"quantity\": 1}, {\"id\": 3, \"price\": 900, \"quantity\": 2}]', NULL, 'QUO-000010', 'REF-000010', 1, 0, '2025-06-09 14:07:29', '2025-06-09 14:07:29'),
(11, 1, 'ORD684731c8e664c', 1685.28, NULL, '393.82', '%', 10, 100.00, 10.00, 1, 'Cash', '[{\"id\": 2, \"price\": 169.1, \"quantity\": 1}, {\"id\": 3, \"price\": 900, \"quantity\": 2}]', NULL, 'QUO-000011', 'REF-000011', 0, 0, '2025-06-02 14:11:38', '2025-06-09 14:11:38'),
(12, 1, 'ORD6847321a968ce', 1685.28, NULL, '393.82', '%', 10, 100.00, 10.00, 1, 'Cash', '[{\"id\": 2, \"price\": 169.1, \"quantity\": 1}, {\"id\": 3, \"price\": 900, \"quantity\": 2}]', NULL, 'QUO-000012', 'REF-000012', 0, 0, '2025-06-05 14:13:54', '2025-06-09 14:13:54'),
(13, 1, 'ORD6847321a968ce', 1685.28, NULL, '393.82', '%', 10, 100.00, 10.00, 1, 'Cash', '[{\"id\": 2, \"price\": 169.1, \"quantity\": 1}, {\"id\": 3, \"price\": 900, \"quantity\": 2}]', NULL, 'QUO-000013', 'REF-000013', 0, 0, '2025-03-09 14:14:26', '2025-06-09 14:14:26'),
(14, 1, 'ORD6847321a968ce', 1685.28, NULL, '393.82', '%', 10, 100.00, 10.00, 1, 'Cash', '[{\"id\": 2, \"price\": 169.1, \"quantity\": 1}, {\"id\": 3, \"price\": 900, \"quantity\": 2}]', NULL, 'QUO-000014', 'REF-000014', 0, 0, '2025-06-01 14:16:04', '2025-06-09 14:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `sales_discounts`
--

CREATE TABLE `sales_discounts` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` bigint UNSIGNED NOT NULL,
  `discount_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_discounts`
--

INSERT INTO `sales_discounts` (`id`, `sale_id`, `discount_id`, `created_at`, `updated_at`) VALUES
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(14, 6, 1, NULL, NULL),
(15, 7, 1, NULL, NULL),
(16, 8, 1, NULL, NULL),
(17, 9, 1, NULL, NULL),
(18, 10, 1, NULL, NULL),
(19, 11, 1, NULL, NULL),
(20, 12, 1, NULL, NULL),
(21, 13, 1, NULL, NULL),
(22, 14, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_product`
--

CREATE TABLE `sales_product` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_product`
--

INSERT INTO `sales_product` (`id`, `sale_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(11, 6, 2, 1, 129.50, NULL, NULL),
(12, 6, 3, 2, 612.90, NULL, NULL),
(13, 7, 2, 2, 129.50, NULL, NULL),
(14, 7, 1, 1, 854.00, NULL, NULL),
(15, 8, 1, 1, 854.00, NULL, NULL),
(16, 8, 2, 1, 129.50, NULL, NULL),
(27, 6, 2, 2, 129.50, NULL, NULL),
(28, 6, 3, 1, 612.90, NULL, NULL),
(29, 7, 2, 2, 129.50, NULL, NULL),
(30, 7, 3, 1, 612.90, NULL, NULL),
(31, 8, 2, 2, 129.50, NULL, NULL),
(32, 8, 3, 1, 612.90, NULL, NULL),
(33, 9, 2, 1, 169.10, NULL, NULL),
(34, 9, 3, 2, 900.00, NULL, NULL),
(35, 10, 2, 1, 169.10, NULL, NULL),
(36, 10, 3, 2, 900.00, NULL, NULL),
(37, 11, 2, 1, 169.10, NULL, NULL),
(38, 11, 3, 2, 900.00, NULL, NULL),
(39, 12, 2, 1, 169.10, NULL, NULL),
(40, 12, 3, 2, 900.00, NULL, NULL),
(41, 13, 2, 1, 169.10, NULL, NULL),
(42, 13, 3, 2, 900.00, NULL, NULL),
(43, 14, 2, 1, 169.10, NULL, NULL),
(44, 14, 3, 2, 900.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_returns`
--

CREATE TABLE `sales_returns` (
  `id` bigint UNSIGNED NOT NULL,
  `refundable` bigint UNSIGNED DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `sale_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_returns`
--

INSERT INTO `sales_returns` (`id`, `refundable`, `payment_method`, `is_online`, `sale_id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 984, 'Cash', 0, 3, 'ORD683d802681c21', '2025-06-02 05:42:46', '2025-06-02 05:42:46'),
(2, 984, 'Cash', 0, 3, 'ORD683d8060126f1', '2025-06-02 05:43:44', '2025-06-02 05:43:44'),
(3, 984, 'Cash', 0, 7, 'ORD683ddfc5b4ff2', '2025-06-02 12:30:45', '2025-06-02 12:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_product`
--

CREATE TABLE `sales_return_product` (
  `id` bigint UNSIGNED NOT NULL,
  `sales_return_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_return_product`
--

INSERT INTO `sales_return_product` (`id`, `sales_return_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 854.00, NULL, NULL),
(2, 1, 2, 1, 129.50, NULL, NULL),
(3, 2, 1, 1, 854.00, NULL, NULL),
(4, 2, 2, 1, 129.50, NULL, NULL),
(5, 3, 2, 1, 129.50, NULL, NULL),
(6, 3, 1, 1, 854.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_purchases`
--

CREATE TABLE `stock_purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `purchased_date` date NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','received','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_purchase_products`
--

CREATE TABLE `stock_purchase_products` (
  `id` bigint UNSIGNED NOT NULL,
  `stock_purchase_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfers`
--

CREATE TABLE `stock_transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `from_warehouse_id` bigint UNSIGNED NOT NULL,
  `to_warehouse_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity_transferred` int NOT NULL,
  `transfer_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `vat_number`, `phone`, `email`, `address`, `contact_person`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fay Mcfarland', '947', '+1 (323) 226-9059', 'bujin@mailinator.com', 'Mollit quis dolore e', 'Ipsum debitis dolor', 0, '2025-06-02 05:18:34', '2025-06-02 05:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `discount_limit_percent` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_limit_fixed` int DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `employee_id`, `department_id`, `joining_date`, `discount_limit_percent`, `discount_limit_fixed`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 'Admin', 'admin@example.com', NULL, 'EMP001', NULL, '2025-06-02', 0.00, 0, '2025-06-02 05:17:56', '$2y$12$fWlGmaxD/kcCDcB60Wj8/e49xyW/3Y6aDtBhT1apDlmZL6D4x57je', 'qARqTC18UJOCAq2DPtMiS0YMFISQHrnSZvUMQlFvbMKGxYnCnCsQ4LeVK7Re', '2025-06-02 05:17:56', '2025-06-02 05:17:56', 1),
(2, 'Accountant', 'accountant@example.com', NULL, 'EMP002', NULL, '2025-06-02', 10.00, 100, '2025-06-02 05:17:56', '$2y$12$7CyYYZjRGdYpZxSSC.S/NOsffzz4Dy7fDrfVaZWcgjGkUOwxiG3cq', NULL, '2025-06-02 05:17:56', '2025-06-02 05:27:19', 1),
(3, 'Sales manager', 'sales_manager@example.com', NULL, 'EMP003', NULL, '2025-06-02', 0.00, 0, '2025-06-02 05:17:56', '$2y$12$3pcWCYZVEnhzKrfRa.k0qejBbq/h6xypriFCABsGpg1ZFH/2N8wV2', NULL, '2025-06-02 05:17:56', '2025-06-02 05:17:56', 1),
(4, 'Sales representative', 'sales_representative@example.com', NULL, 'EMP004', NULL, '2025-06-02', 0.00, 0, '2025-06-02 05:17:57', '$2y$12$tP06Bm7z495aGRoJOnsV6.FfP.T6eg.rYvjdDPYNum4PBNaf1jxVa', NULL, '2025-06-02 05:17:57', '2025-06-02 05:17:57', 1),
(5, 'Warehouse personal', 'warehouse_personal@example.com', NULL, 'EMP005', NULL, '2025-06-02', 0.00, 0, '2025-06-02 05:17:57', '$2y$12$LPI4SilqO3r.N4PzdRPWMO9LX5g4NefgG6mTkou430il1gsjqa.fa', NULL, '2025-06-02 05:17:57', '2025-06-02 05:17:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Warehouse 1', 1, '2025-06-02 05:17:55', '2025-06-02 05:17:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_discount`
--
ALTER TABLE `customer_discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_discount_customer_id_foreign` (`customer_id`),
  ADD KEY `customer_discount_discount_id_foreign` (`discount_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_supplier_id_foreign` (`supplier_id`),
  ADD KEY `products_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `product_discount`
--
ALTER TABLE `product_discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_discount_product_id_foreign` (`product_id`),
  ADD KEY `product_discount_discount_id_foreign` (`discount_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `sales_discounts`
--
ALTER TABLE `sales_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_discounts_sale_id_foreign` (`sale_id`),
  ADD KEY `sales_discounts_discount_id_foreign` (`discount_id`);

--
-- Indexes for table `sales_product`
--
ALTER TABLE `sales_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_product_sale_id_foreign` (`sale_id`),
  ADD KEY `sales_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_return_product`
--
ALTER TABLE `sales_return_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_return_product_sales_return_id_foreign` (`sales_return_id`),
  ADD KEY `sales_return_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stock_purchases`
--
ALTER TABLE `stock_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `stock_purchase_products`
--
ALTER TABLE `stock_purchase_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_purchase_products_stock_purchase_id_foreign` (`stock_purchase_id`),
  ADD KEY `stock_purchase_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_transfers_from_warehouse_id_foreign` (`from_warehouse_id`),
  ADD KEY `stock_transfers_to_warehouse_id_foreign` (`to_warehouse_id`),
  ADD KEY `stock_transfers_product_id_foreign` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_employee_id_unique` (`employee_id`),
  ADD KEY `users_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_discount`
--
ALTER TABLE `customer_discount`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_discount`
--
ALTER TABLE `product_discount`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sales_discounts`
--
ALTER TABLE `sales_discounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sales_product`
--
ALTER TABLE `sales_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `sales_returns`
--
ALTER TABLE `sales_returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_return_product`
--
ALTER TABLE `sales_return_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock_purchases`
--
ALTER TABLE `stock_purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_purchase_products`
--
ALTER TABLE `stock_purchase_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_discount`
--
ALTER TABLE `customer_discount`
  ADD CONSTRAINT `customer_discount_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_discount_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_discount`
--
ALTER TABLE `product_discount`
  ADD CONSTRAINT `product_discount_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_discount_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_discounts`
--
ALTER TABLE `sales_discounts`
  ADD CONSTRAINT `sales_discounts_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_discounts_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_product`
--
ALTER TABLE `sales_product`
  ADD CONSTRAINT `sales_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_product_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_return_product`
--
ALTER TABLE `sales_return_product`
  ADD CONSTRAINT `sales_return_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_return_product_sales_return_id_foreign` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_purchases`
--
ALTER TABLE `stock_purchases`
  ADD CONSTRAINT `stock_purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_purchase_products`
--
ALTER TABLE `stock_purchase_products`
  ADD CONSTRAINT `stock_purchase_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_purchase_products_stock_purchase_id_foreign` FOREIGN KEY (`stock_purchase_id`) REFERENCES `stock_purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  ADD CONSTRAINT `stock_transfers_from_warehouse_id_foreign` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_transfers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_transfers_to_warehouse_id_foreign` FOREIGN KEY (`to_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
