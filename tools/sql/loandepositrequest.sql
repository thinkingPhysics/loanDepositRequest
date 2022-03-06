-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 03 2022 г., 07:34
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `loandepositrequest`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `clientID` int NOT NULL COMMENT 'Уникальный ID клиента',
  `clientType` enum('client','organization') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Тип клиента: ФЛ (client) или ЮЛ (organization)',
  `surname` tinytext NOT NULL COMMENT 'Фамилия',
  `name` tinytext NOT NULL COMMENT 'Имя',
  `patronym` tinytext NOT NULL COMMENT 'Отчество',
  `inn` bigint NOT NULL COMMENT 'ИНН',
  `dateOfBirth` date NOT NULL COMMENT 'Дата рождения',
  `passportSeries` smallint NOT NULL COMMENT 'Серия паспорта',
  `passportNumber` mediumint NOT NULL COMMENT 'Номер паспорта',
  `passportDate` date NOT NULL COMMENT 'Дата выдачи паспорта',
  `orgName` text,
  `orgAddress` text,
  `orgOGRN` bigint DEFAULT NULL,
  `orgINN` bigint DEFAULT NULL,
  `orgKPP` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`clientID`, `clientType`, `surname`, `name`, `patronym`, `inn`, `dateOfBirth`, `passportSeries`, `passportNumber`, `passportDate`, `orgName`, `orgAddress`, `orgOGRN`, `orgINN`, `orgKPP`) VALUES
(285, 'client', 'Нагнетающий', 'Лев', 'Семенович', 6390955792, '2000-01-01', 134, 221543, '2001-12-24', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `clientID` int NOT NULL COMMENT 'ID клиента',
  `productID` int NOT NULL COMMENT 'ID продукта',
  `productType` enum('loan','deposit') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Тип продукта (вклад или кредит)',
  `openDate` date NOT NULL COMMENT 'Дата открытия',
  `closeDate` date NOT NULL COMMENT 'Дата закрытия',
  `termInMonths` smallint NOT NULL COMMENT 'Срок действия продукта',
  `depositRate` decimal(10,0) DEFAULT NULL COMMENT 'Годовая ставка по вкладу',
  `depositCapitalization` enum('everyMonth','onClose') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Тип капитализации по вкладу (ежемесячно/только при закрытии)',
  `loanAmount` bigint DEFAULT NULL COMMENT 'Сумма кредита',
  `loanPaymentSchedule` enum('annuitet','diff') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'График платежей по кредиту'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`clientID`, `productID`, `productType`, `openDate`, `closeDate`, `termInMonths`, `depositRate`, `depositCapitalization`, `loanAmount`, `loanPaymentSchedule`) VALUES
(285, 242, 'loan', '2022-01-21', '2024-01-21', 24, NULL, NULL, 5000000, 'annuitet');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `ID` int NOT NULL,
  `clientID` int NOT NULL,
  `ip` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ipForwarded` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `userAgent` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `session` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`ID`, `clientID`, `ip`, `ipForwarded`, `userAgent`, `session`, `timestamp`) VALUES
(9, 285, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'e45u20f16fhqkuiphja9v7lfdmb47iga', '2022-03-03 04:30:45');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`clientID`),
  ADD UNIQUE KEY `clientID` (`clientID`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `productID` (`productID`),
  ADD KEY `clientID` (`clientID`),
  ADD KEY `clientID_2` (`clientID`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `clientID` int NOT NULL AUTO_INCREMENT COMMENT 'Уникальный ID клиента', AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `productID` int NOT NULL AUTO_INCREMENT COMMENT 'ID продукта', AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT для таблицы `sessions`
--
ALTER TABLE `sessions`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
