-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 09, 2023 lúc 04:39 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `btth02_cse485`
--
CREATE DATABASE IF NOT EXISTS `btth02_cse485` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `btth02_cse485`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_category`
--

CREATE TABLE `cms_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cms_category`
--

INSERT INTO `cms_category` (`id`, `name`) VALUES
(1, 'Technology'),
(2, 'Fashion'),
(3, 'Food'),
(4, 'Travel'),
(5, 'Sports'),
(6, 'Health'),
(7, 'Music'),
(8, 'Movies'),
(9, 'Books'),
(10, 'Science');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_posts`
--

CREATE TABLE `cms_posts` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `message` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` enum('published','draft','archived','') NOT NULL DEFAULT 'published',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_user`
--

CREATE TABLE `cms_user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cms_user`
--

INSERT INTO `cms_user` (`id`, `first_name`, `last_name`, `email`, `password`, `type`, `deleted`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'password123', 1, 0),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'password456', 2, 0),
(3, 'Bob', 'Johnson', 'bob.johnson@example.com', 'password789', 1, 0),
(4, 'Alice', 'Williams', 'alice.williams@example.com', 'passwordabc', 2, 0),
(5, 'Charlie', 'Brown', 'charlie.brown@example.com', 'passworddef', 1, 0),
(6, 'Eva', 'Davis', 'eva.davis@example.com', 'passwordeg', 2, 0),
(7, 'Frank', 'Miller', 'frank.miller@example.com', 'passwordhij', 1, 0),
(8, 'Grace', 'Taylor', 'grace.taylor@example.com', 'passwordklm', 2, 0),
(9, 'Henry', 'Anderson', 'henry.anderson@example.com', 'passwordnop', 1, 0),
(10, 'Ivy', 'Jones', 'ivy.jones@example.com', 'passwordqrs', 2, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cms_category`
--
ALTER TABLE `cms_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cms_posts`
--
ALTER TABLE `cms_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `userid` (`userid`);

--
-- Chỉ mục cho bảng `cms_user`
--
ALTER TABLE `cms_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cms_category`
--
ALTER TABLE `cms_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `cms_posts`
--
ALTER TABLE `cms_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cms_user`
--
ALTER TABLE `cms_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cms_posts`
--
ALTER TABLE `cms_posts`
  ADD CONSTRAINT `cms_posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`),
  ADD CONSTRAINT `cms_posts_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `cms_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
