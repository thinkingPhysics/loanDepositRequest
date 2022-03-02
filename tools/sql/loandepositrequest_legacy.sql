-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 02 2022 г., 20:35
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
(267, 'client', 'Иванов', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(268, 'client', 'Колдун', 'Олег', 'Львович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(269, 'client', 'Щербакова', 'Дарья', 'Ивановна', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(270, 'client', 'Щербакова', 'Дарья', 'Ивановна', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(271, 'client', 'Щербакова', 'Дарья', 'Ивановна', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(272, 'client', 'Спящий', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(273, 'client', 'Спящий', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(274, 'client', 'Спящий', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(275, 'client', 'Спящий', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(276, 'client', 'Спящий', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(277, 'client', 'Спящий', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(278, 'client', 'Спящий', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(279, 'client', 'Спящий', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', NULL, NULL, NULL, NULL, NULL),
(280, 'organization', 'Спящий', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', 'ООО Лазурные гвозди', '127473, ГОРОД МОСКВА, УЛИЦА СЕЛЕЗНЕВСКАЯ, 11, СТР.3', 1057749631994, 7727563778, 639095579),
(281, 'organization', 'Фывер', 'Дмитрий', 'Иванович', 3664069397, '2000-01-01', 9412, 610321, '2000-01-01', 'ООО Лазурные гвозди', '127473, ГОРОД МОСКВА, УЛИЦА СЕЛЕЗНЕВСКАЯ, 11, СТР.3', 1057749631994, 7727563778, 639095579),
(282, 'client', 'Колобков', 'Тимур', 'Радикович', 1201231455, '2000-01-01', 1423, 135222, '2001-02-21', NULL, NULL, NULL, NULL, NULL),
(283, 'client', 'Темный', 'Артур', 'Иванович', 3142415151, '2000-01-01', 3123, 123124, '2000-03-21', NULL, NULL, NULL, NULL, NULL);

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
(267, 224, 'loan', '2000-01-01', '2001-01-01', 12, NULL, NULL, 100000, 'annuitet'),
(268, 225, 'deposit', '2000-01-01', '2001-01-01', 12, '5', 'everyMonth', NULL, NULL),
(269, 226, 'loan', '2000-01-01', '2001-01-01', 12, NULL, NULL, 1000000, 'annuitet'),
(270, 227, 'loan', '2000-01-01', '2001-01-01', 12, NULL, NULL, 1000000, 'annuitet'),
(271, 228, 'loan', '2000-01-01', '2001-01-01', 12, NULL, NULL, 1000000, 'annuitet'),
(272, 229, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(273, 230, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(274, 231, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(275, 232, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(276, 233, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(277, 234, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(278, 235, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(279, 236, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(280, 237, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(281, 238, 'loan', '2000-01-01', '2000-06-01', 5, NULL, NULL, 100000, 'annuitet'),
(282, 239, 'loan', '2001-01-21', '2002-01-21', 12, NULL, NULL, 5000, 'annuitet'),
(283, 240, 'loan', '2022-03-21', '2022-08-21', 5, NULL, NULL, 10000, 'annuitet');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `ID` int NOT NULL,
  `ip` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ipForwarded` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `userAgent` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `session` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`ID`, `ip`, `ipForwarded`, `userAgent`, `session`, `timestamp`) VALUES
(1, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'roglisljg43lo4gpf1c1d5lj3iqhgje8', '2022-03-02 17:26:06'),
(2, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'roglisljg43lo4gpf1c1d5lj3iqhgje8', '2022-03-02 17:26:06'),
(3, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'roglisljg43lo4gpf1c1d5lj3iqhgje8', '2022-03-02 17:26:06'),
(4, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'roglisljg43lo4gpf1c1d5lj3iqhgje8', '2022-03-02 17:26:06'),
(5, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'roglisljg43lo4gpf1c1d5lj3iqhgje8', '2022-03-02 17:26:15'),
(6, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'roglisljg43lo4gpf1c1d5lj3iqhgje8', '2022-03-02 17:28:33'),
(7, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'roglisljg43lo4gpf1c1d5lj3iqhgje8', '2022-03-02 17:35:22');

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
  MODIFY `clientID` int NOT NULL AUTO_INCREMENT COMMENT 'Уникальный ID клиента', AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `productID` int NOT NULL AUTO_INCREMENT COMMENT 'ID продукта', AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT для таблицы `sessions`
--
ALTER TABLE `sessions`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
