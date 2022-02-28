-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 28 2022 г., 10:09
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
  `clientType` enum('client','organization') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Тип клиента: ФЛ (client) или ЮЛ (organization)',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`clientID`, `clientType`, `surname`, `name`, `patronym`, `inn`, `dateOfBirth`, `passportSeries`, `passportNumber`, `passportDate`, `orgName`, `orgAddress`, `orgOGRN`, `orgINN`, `orgKPP`) VALUES
(267, 'client', 'Иванов', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(268, 'client', 'Колдун', 'Олег', 'Львович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(269, 'client', 'Щербакова', 'Дарья', 'Ивановна', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(270, 'client', 'Щербакова', 'Дарья', 'Ивановна', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(271, 'client', 'Щербакова', 'Дарья', 'Ивановна', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `clientID` int NOT NULL COMMENT 'ID клиента',
  `productID` int NOT NULL COMMENT 'ID продукта',
  `productType` enum('loan','deposit') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Тип продукта (вклад или кредит)',
  `openDate` date NOT NULL COMMENT 'Дата открытия',
  `closeDate` date NOT NULL COMMENT 'Дата закрытия',
  `termInMonths` smallint NOT NULL COMMENT 'Срок действия продукта',
  `depositRate` decimal(10,0) DEFAULT NULL COMMENT 'Годовая ставка по вкладу',
  `depositCapitalization` enum('everyMonth','onClose') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Тип капитализации по вкладу (ежемесячно/только при закрытии)',
  `loanAmount` bigint DEFAULT NULL COMMENT 'Сумма кредита',
  `loanPaymentSchedule` enum('annuitet','diff') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'График платежей по кредиту'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`clientID`, `productID`, `productType`, `openDate`, `closeDate`, `termInMonths`, `depositRate`, `depositCapitalization`, `loanAmount`, `loanPaymentSchedule`) VALUES
(267, 224, 'loan', '2000-01-01', '2001-01-01', 12, NULL, NULL, 100000, 'annuitet'),
(268, 225, 'deposit', '2000-01-01', '2001-01-01', 12, '5', 'everyMonth', NULL, NULL),
(269, 226, 'loan', '2000-01-01', '2001-01-01', 12, NULL, NULL, 1000000, 'annuitet'),
(270, 227, 'loan', '2000-01-01', '2001-01-01', 12, NULL, NULL, 1000000, 'annuitet'),
(271, 228, 'loan', '2000-01-01', '2001-01-01', 12, NULL, NULL, 1000000, 'annuitet');

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
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `clientID` int NOT NULL AUTO_INCREMENT COMMENT 'Уникальный ID клиента', AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `productID` int NOT NULL AUTO_INCREMENT COMMENT 'ID продукта', AUTO_INCREMENT=229;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
