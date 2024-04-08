-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2024 at 07:14 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobtest`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(5) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `nickName` varchar(50) NOT NULL,
  `birth_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender` tinyint(1) NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userName`, `password`, `firstName`, `lastName`, `nickName`, `birth_date`, `gender`, `Active`) VALUES
(1, 'john_doe', '$2b$10$X8ILZO83Ye3V/6ojKn4NxuX8GM.a5CghOVll6MV40Ye', 'John', 'Doe', 'JD', '1989-12-31 17:00:00', 1, 0),
(2, 'john_doe', '$2b$10$DZynvFH9waVSMl0IM.4Vx.r.Mm8aJLtY6EP9fliz9Qy', 'John', 'Doe', 'JD', '1989-12-31 17:00:00', 1, 0),
(3, 'john_doe', '$2b$10$vVz4HPg2YXSRLC7jXe6k.usz6VWqOYHzZciVloEgDDI', 'John', 'Doe', 'JD', '0000-00-00 00:00:00', 0, 1),
(4, 'john_doe', 'password123', 'John', 'Doe', 'JD', '1989-12-31 17:00:00', 1, 0),
(6, 'john_doe', 'password123', 'John', 'Doe', 'JD', '1989-12-31 17:00:00', 1, 0),
(7, 'john_doe', '$2b$10$8qQx1S.Wj.7pwRgE24rUXeqV04OLVD5.y5bt9GeZe.3', 'John', 'Doe', 'JD', '1989-12-31 17:00:00', 1, 0),
(8, 'john_doe', '$2b$10$uUZcRW2ILeOycSV4dMZMBOkW1zLBL4fA96sEF5fYMzP', 'John', 'Doe', 'JD', '1989-12-31 17:00:00', 1, 0),
(12, 'qwerty', '$2b$10$o5TL87hpn9l7t2/U4cGUXOCWkrqQ6SRMHHjYtsfTUTT', 'book', 'book', 'Bookbook', '2024-04-22 17:00:00', 0, 1),
(13, 'qwerty', '$2b$10$7s1YGDJxnKIWHhtAneTi3OjYjUEjA4uJnDm2CsNrX5X', 'book', 'book', 'Bookbook', '2024-04-22 17:00:00', 1, 1),
(14, 'qwerty', '$2b$10$XNO5QBICYucx4zNAo6X.Pe1Hq23.8NYUm1mK5.fX1WZ', 'book', 'book', 'Bookbook', '2024-04-22 17:00:00', 1, 1),
(15, 'qwerty', '$2b$10$GxY8W8ZjoDxSrE0pYvpPAOOijUiMg9e4bQnOFgC1CAR', 'book', 'book', 'Bookbook', '2024-04-22 17:00:00', 1, 1),
(16, 'qwerty', '$2b$10$zwLhcu2TuS8m8K2wFXn07e2aB8xn6dUEwpFppsCvTh2', 'book', 'book', 'Bookbook', '2024-04-22 17:00:00', 1, 1),
(17, 'arut', '$2b$10$bd7BCgUEHT7KlSGddg0SKuemoChHZ3kR5SafVJSLhJr', 'ABC', 'DEF', 'A', '2024-04-10 17:00:00', 1, 1),
(18, 'arut', '$2b$10$91HBs1kQoVcMRjzhVFdIsO1B1sBYH/SA067iYRaCrtG', 'ABC', 'DEF', 'A', '2024-04-10 17:00:00', 1, 1),
(19, 'arut', '$2b$10$OOXBPien2gBKbv8Bn0YXL.VPOYggnqnbf8QYlXcxMXC', 'ABC', 'DEF', 'A', '2024-04-10 17:00:00', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
