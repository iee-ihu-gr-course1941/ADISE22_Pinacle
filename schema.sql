-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table chess.board
DROP TABLE IF EXISTS `deck`;
CREATE TABLE `deck` (
	`number` ENUM('9','10','J','Q','K','A') NOT NULL COLLATE 'utf8mb4_general_ci',
	`shape` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`location` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`number`, `shape`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- Dumping data for table chess.board: ~64 rows (approximately)
INSERT INTO `deck` (`number`, `shape`, `location`) VALUES
	('A', 'spades', 'pile'),
	('A', 'hearts', 'player2'),
	('A', 'diamonds', 'player2'),
	('A', 'clubs', 'player1'),
	('K', 'spades', 'pile'),
	('K', 'hearts', 'player2'),
	('K', 'diamonds', 'pile'),
	('K', 'clubs', 'player1'),
	('Q', 'spades', 'player2'),
	('Q', 'hearts', 'player1'),
	('Q', 'diamonds', 'player2'),
	('Q', 'clubs', 'pile'),
	('J', 'spades', 'player2'),
	('J', 'hearts', 'player1'),
	('J', 'diamonds', 'player2'),
	('J', 'clubs', 'player2'),
	('10', 'spades', 'tetrada combination player 1'),
	('10', 'hearts', 'tetrada combination player 1'),
	('10', 'diamonds', 'tetrada combination player 1'),
	('10', 'clubs', 'tetrada combination player 1'),
	('9', 'spades', 'kenta combination player 1'),
	('9', 'hearts', 'pile'),
	('9', 'diamonds', 'player2'),
	('9', 'clubs', 'pile');

-- Dumping structure for table chess.board_empty
DROP TABLE IF EXISTS `deck_empty`;
CREATE TABLE `deck_empty` (
	`number` ENUM('9','10','J','Q','K','A') NOT NULL COLLATE 'utf8mb4_general_ci',
	`shape` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`location` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`number`, `shape`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- Dumping data for table chess.board_empty: ~64 rows (approximately)
INSERT INTO `deck_empty` (`number`, `shape`, `location`) VALUES
	('A', 'spades', NULL),
	('A', 'hearts', NULL),
	('A', 'diamonds', NULL),
	('A', 'clubs', NULL),
	('K', 'spades', NULL),
	('K', 'hearts', NULL),
	('K', 'diamonds', NULL),
	('K', 'clubs', NULL),
	('Q', 'spades', NULL),
	('Q', 'hearts', NULL),
	('Q', 'diamonds', NULL),
	('Q', 'clubs', NULL),
	('J', 'spades', NULL),
	('J', 'hearts', NULL),
	('J', 'diamonds', NULL),
	('J', 'clubs', NULL),
	('10', 'spades', NULL),
	('10', 'hearts', NULL),
	('10', 'diamonds', NULL),
	('10', 'clubs', NULL),
	('9', 'spades', NULL),
	('9', 'hearts', NULL),
	('9', 'diamonds', NULL),
	('9', 'clubs', NULL);

-- Dumping structure for procedure chess.clean_deck
DROP PROCEDURE IF EXISTS `clean_deck`;
DELIMITER //
CREATE PROCEDURE `clean_deck`()
BEGIN
	REPLACE INTO deck SELECT * FROM deck_empty;
END//
DELIMITER ;

-- Dumping structure for table chess.game_status
DROP TABLE IF EXISTS `game_status`;
CREATE TABLE `game_status` (
	`status` ENUM('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active' COLLATE 'utf8mb4_general_ci',
	`p_turn` ENUM('player 1','player 2') NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`result` ENUM('player 1','player 2','draw') NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`last_change` TIMESTAMP NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


DELIMITER;

-- Dumping structure for table chess.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
	`username` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`id` INT(11) NOT NULL,
	`token` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`last action` TIMESTAMP NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


INSERT INTO `players` (`username`, `id`, `token`, `last action`) VALUES
	('player 1', 1, NULL, '2022-12-16 20:43:51'),
	('player 2', 2, NULL, '2022-12-16 20:44:40');
/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
