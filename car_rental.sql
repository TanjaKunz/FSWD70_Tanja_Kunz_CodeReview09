-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2019 at 04:53 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `plate_no` char(15) DEFAULT NULL,
  `current_km_status` mediumint(9) NOT NULL,
  `purchase_date` date NOT NULL,
  `removal_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `model_id`, `plate_no`, `current_km_status`, `purchase_date`, `removal_date`) VALUES
(1, 1, 'W-43245', 742583, '1998-11-02', '2003-05-30'),
(2, 1, 'W-83628', 394728, '1998-11-02', '2001-02-08'),
(3, 2, 'MD-43203', 195372, '2017-06-14', NULL),
(4, 3, 'MD-73526', 273625, '2016-10-03', NULL),
(5, 4, 'BN-39484', 3127658, '2016-05-17', NULL),
(6, 5, 'BN-63628', 654946, '2005-04-28', '2011-10-06'),
(7, 6, 'WN-29534', 248263, '2017-07-22', NULL),
(8, 7, 'WN-12183', 89342, '2018-06-15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `car_model`
--

CREATE TABLE `car_model` (
  `model_id` int(11) NOT NULL,
  `make` char(20) NOT NULL,
  `model` char(50) NOT NULL,
  `year` date NOT NULL,
  `type` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_model`
--

INSERT INTO `car_model` (`model_id`, `make`, `model`, `year`, `type`) VALUES
(1, 'Opel', 'Corsa', '1998-09-29', NULL),
(2, 'BMV', '3er Limousine', '2017-05-18', 'Limousine'),
(3, 'Fiat', 'Freemont', '2016-08-05', 'Off-Road Vehicle'),
(4, 'Ford', 'Glaxy', '2016-01-21', 'SUV'),
(5, 'VW', 'Golf', '2005-04-06', NULL),
(6, 'VW', 'Golf', '2017-06-11', NULL),
(7, 'VW', 'Golf', '2018-03-19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `car_return`
--

CREATE TABLE `car_return` (
  `return_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `km_status` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_return`
--

INSERT INTO `car_return` (`return_id`, `booking_id`, `location_id`, `return_date`, `km_status`) VALUES
(1, 1, 1, '1999-06-15', 517371),
(2, 2, 3, '2011-09-02', 654728),
(3, 3, 2, '2017-10-25', 1097),
(4, 4, 2, '2019-01-09', 189014);

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `charge_id` int(11) NOT NULL,
  `km_charge` smallint(6) DEFAULT NULL,
  `day_charge` smallint(6) DEFAULT NULL,
  `overdue` smallint(6) DEFAULT NULL,
  `gasolin` smallint(6) DEFAULT NULL,
  `damage` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`charge_id`, `km_charge`, `day_charge`, `overdue`, `gasolin`, `damage`) VALUES
(31, 43, 100, 0, 0, 150),
(32, 47, 50, 0, 35, 0),
(33, 45, 50, 0, 0, 0),
(34, 41, 75, 20, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` char(50) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `location_id`, `car_id`) VALUES
(1, 'Rentals R Us', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `cust_address` int(11) NOT NULL,
  `license_no` int(11) NOT NULL,
  `first_name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `email` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `cust_address`, `license_no`, `first_name`, `last_name`, `birth_date`, `phone_number`, `email`) VALUES
(1, 6, 83624395, 'Markus', 'Schmidt', '1976-06-02', 523752, 'markus@gmail.com'),
(2, 6, 36483846, 'Verena', 'Schmidt', '1980-02-17', 476294, 'verena@gmail.com'),
(3, 4, 43287462, 'Tom', 'Smith', '1992-08-29', 937263, 'tom@gmail.com'),
(4, 7, 72384928, 'Marie', 'Huber', '2001-01-16', 293847, 'marie@gmail.com'),
(5, 1, 58372638, 'Paul', 'Baum', '1986-10-07', 738253, 'paul@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `cust_address`
--

CREATE TABLE `cust_address` (
  `cust_address_id` int(11) NOT NULL,
  `cust_street` char(50) NOT NULL,
  `cust_ZIP` smallint(6) NOT NULL,
  `cust_city` char(30) NOT NULL,
  `cust_country` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cust_address`
--

INSERT INTO `cust_address` (`cust_address_id`, `cust_street`, `cust_ZIP`, `cust_city`, `cust_country`) VALUES
(1, 'Lilienweg 3', 1230, 'Vienna', 'Austria'),
(2, 'Rosengasse 25', 1050, 'Vienna', 'Austria'),
(3, 'Leopoldstraße 145', 32767, 'Munich', 'Germany'),
(4, 'Main Street 43', 32767, 'London', 'UK'),
(5, 'Hauptsraße 12', 7140, 'Klagenfurt', 'Austria'),
(6, 'Kellerweg 5', 3412, 'Enzesfeld', 'Austria'),
(7, 'Drosselgasse 34', 8374, 'Innsbruck', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `dispatch_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `dispatch_date` date NOT NULL,
  `km_status` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`dispatch_id`, `booking_id`, `location_id`, `dispatch_date`, `km_status`) VALUES
(1, 1, 1, '1999-06-13', 517328),
(2, 2, 4, '2011-09-02', 654681),
(3, 3, 2, '2017-10-25', 1052),
(4, 4, 2, '2019-01-08', 188973);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `discount` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_no`, `booking_id`, `charge_id`, `invoice_date`, `discount`) VALUES
(158, 1, 31, '1999-06-15', 0),
(159, 2, 32, '2011-09-02', 0),
(160, 3, 33, '2017-10-25', 0),
(161, 4, 34, '2019-01-08', -10);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `loc_street` char(50) NOT NULL,
  `loc_ZIP` smallint(6) NOT NULL,
  `loc_city` char(30) NOT NULL,
  `loc_country` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `loc_street`, `loc_ZIP`, `loc_city`, `loc_country`) VALUES
(1, 'Hauptsraße 134', 32767, 'Munich', 'Germany'),
(2, 'Ketzergasse 53', 1230, 'Vienna', 'Austria'),
(3, 'Waldweg 32', 2404, 'Baden', 'Austria'),
(4, 'Felsgass 16', 2484, 'Wr. Neustadt', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`booking_id`, `customer_id`, `car_id`) VALUES
(1, 1, 1),
(2, 2, 5),
(3, 3, 2),
(4, 4, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`model_id`);

--
-- Indexes for table `car_return`
--
ALTER TABLE `car_return`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`charge_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `cust_address` (`cust_address`);

--
-- Indexes for table `cust_address`
--
ALTER TABLE `cust_address`
  ADD PRIMARY KEY (`cust_address_id`);

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`dispatch_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_no`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `charge_id` (`charge_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `car_id` (`car_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `car_return`
--
ALTER TABLE `car_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `charge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cust_address`
--
ALTER TABLE `cust_address`
  MODIFY `cust_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dispatch`
--
ALTER TABLE `dispatch`
  MODIFY `dispatch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `car_model` (`model_id`);

--
-- Constraints for table `car_return`
--
ALTER TABLE `car_return`
  ADD CONSTRAINT `car_return_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `rental` (`booking_id`),
  ADD CONSTRAINT `car_return_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`cust_address`) REFERENCES `cust_address` (`cust_address_id`);

--
-- Constraints for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD CONSTRAINT `dispatch_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `rental` (`booking_id`),
  ADD CONSTRAINT `dispatch_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `rental` (`booking_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`charge_id`);

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
