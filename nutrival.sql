-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 23 Mars 2018 à 18:11
-- Version du serveur :  10.1.13-MariaDB
-- Version de PHP :  5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nutrival`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `app_logs_add` (IN `_lty_id` INT(255), IN `_description` VARCHAR(255), IN `_usr_id` INT(255), IN `_cli_id` INT(255))  MODIFIES SQL DATA
BEGIN
   INSERT INTO app_logs(log_lty_id,
                     log_description,
                     log_usr_id,
                     log_cli_id)
        VALUES (_lty_id,
                _description,
                _usr_id,
                _cli_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `app_parameters_maj` (IN `_prt_id` INT(255), IN `_prt_value` VARCHAR(255))  MODIFIES SQL DATA
UPDATE `app_parameters`
      SET `prt_value` = _prt_value
    WHERE `prt_id`    = _prt_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recipes_lines_mjad` (IN `_rel_id` INT(11), IN `_rel_rec_id` INT(11), IN `_rel_code` VARCHAR(20), IN `_rel_qte` FLOAT, OUT `_insertedid` INT(11))  MODIFIES SQL DATA
BEGIN
   SELECT 0 into _insertedid;	
   IF _rel_id <= 0
   THEN
      INSERT INTO recipes_lines( 
                        rel_rec_id,
                        rel_code,
                        rel_qte)
           VALUES ( 
                   _rel_rec_id,
                   _rel_code,
                   _rel_qte );

      SELECT LAST_INSERT_ID() INTO _insertedid;
      
   ELSE

      UPDATE recipes_lines
         SET 
             rel_qte = _rel_qte
       WHERE rel_id = _rel_id;
       
       SELECT _rel_id INTO _insertedid;
   END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recipes_mjad` (IN `_rec_id` INT(255), IN `_rec_title` VARCHAR(255), IN `_rec_label` TEXT, IN `_usr_id` INT(11), OUT `_insertedid` INT(11))  MODIFIES SQL DATA
BEGIN
   SELECT 0 into _insertedid;	
   IF _rec_id <= 0
   THEN
      INSERT INTO recipes( 
      					rec_usr_id,
                        rec_title,
                        rec_label )
           VALUES ( 
                   _usr_id,
                   _rec_title,
                   _rec_label );

      SELECT LAST_INSERT_ID() INTO _insertedid;
      
   ELSE

      UPDATE recipes
         SET rec_title = _rec_title,
             rec_label = _rec_label
       WHERE rec_id = _rec_id;
       
       SELECT _rec_id INTO _insertedid;
   END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `users_mjad` (IN `_usr_id` INT(255), IN `_usr_first_name` VARCHAR(255), IN `_usr_last_name` VARCHAR(255), IN `_usr_login` VARCHAR(255), IN `_usr_password` VARCHAR(255), IN `_usr_activekey` VARCHAR(255), IN `_usr_mail` VARCHAR(255), IN `_usr_pro_id` INT(255), IN `_usr_lang` VARCHAR(2), IN `_usr_image_path` VARCHAR(255), IN `_usr_out_date` TIMESTAMP, OUT `_insertedid` INT(11))  MODIFIES SQL DATA
    COMMENT 'Gestion des utilisateurs'
BEGIN
   SELECT 0 into _insertedid;

   IF _usr_id <= 0
   THEN
      INSERT INTO users(usr_first_name,
                        usr_last_name,
                        usr_pro_id,
                        usr_login,
                        usr_password,
                        usr_activekey,
                        usr_mail,
                        usr_lang,
                        usr_image_path)
           VALUES (_usr_first_name,
                   _usr_last_name,
                   _usr_pro_id,
                   _usr_login,
                   _usr_password,
                   _usr_activekey,
                   _usr_mail,
                   _usr_lang,
                   _usr_image_path);

      SELECT LAST_INSERT_ID() INTO _insertedid;
      
      IF _usr_activekey = '0'
      THEN
        UPDATE users SET usr_confirmed = 1 WHERE usr_id = _insertedid;
      END IF;
		

   ELSE

      UPDATE users
         SET usr_first_name = _usr_first_name,
             usr_last_name = _usr_last_name,
             usr_pro_id = _usr_pro_id,
             usr_login = _usr_login,
             usr_password = _usr_password,
             usr_activekey = _usr_activekey,
             usr_mail = _usr_mail,
             usr_lang = _usr_lang,
             usr_image_path = _usr_image_path,
             usr_out_date = _usr_out_date
       WHERE usr_id = _usr_id;
       
       SELECT _usr_id INTO _insertedid;
   END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `app_languages`
--

CREATE TABLE `app_languages` (
  `lng_id` int(255) NOT NULL,
  `lng_code` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `lng_form_code` varchar(15) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Code langue formulaire',
  `lng_lib` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `lng_flag` char(1) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `app_languages`
--

INSERT INTO `app_languages` (`lng_id`, `lng_code`, `lng_form_code`, `lng_lib`, `lng_flag`) VALUES
(2, 'en', 'en_US', 'Anglais', NULL),
(3, 'es', 'es_ES', 'Espagnol', NULL),
(1, 'fr', 'fr_FR', 'Français', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `app_logs`
--

CREATE TABLE `app_logs` (
  `log_id` int(255) NOT NULL COMMENT 'ID de l''enregistrement',
  `log_lty_id` int(255) NOT NULL COMMENT 'ID du type de log',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date',
  `log_description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `log_cli_id` int(255) DEFAULT NULL COMMENT 'ID du client',
  `log_usr_id` int(255) DEFAULT NULL COMMENT 'ID de l''utilisateur'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `app_logs`
--

INSERT INTO `app_logs` (`log_id`, `log_lty_id`, `log_date`, `log_description`, `log_cli_id`, `log_usr_id`) VALUES
(1, 3, '2017-07-18 14:42:54', 'login', 0, 4),
(2, 3, '2017-07-19 13:01:40', 'login', 0, 4),
(3, 4, '2017-07-19 13:33:54', 'création/modification user:BILLONCE', 0, 4),
(4, 4, '2017-07-19 13:43:47', 'création/modification client : ALBERT', 0, 4),
(5, 4, '2017-07-19 13:44:05', 'suppression client : ', 0, 4),
(6, 4, '2017-07-19 13:51:03', 'création/modification client : -AGNESE', 0, 4),
(7, 4, '2017-07-19 13:51:31', 'création/modification client : -AUDIERE', 0, 4),
(8, 4, '2017-07-19 14:05:59', 'création/modification client : 753-ALLAWAY', 0, 4),
(9, 4, '2017-07-19 14:10:13', 'création/modification client : 326-ALLOUCHE', 0, 4),
(10, 4, '2017-07-19 14:22:46', 'création/modification client : 753-ALLAWAY', 0, 4),
(11, 4, '2017-07-19 14:25:56', 'création/modification client : 620-ALBERT', 0, 4),
(12, 4, '2017-07-19 14:40:45', 'création/modification client : 516-AJMI', 0, 4),
(13, 4, '2017-07-19 14:49:17', 'création/modification client : 753-ALLAWAY', 0, 4),
(14, 4, '2017-07-19 14:49:45', 'suppression client : 753', 0, 4),
(15, 4, '2017-07-19 15:08:59', 'création/modification client : 326-ALLOUCHE', 0, 4),
(16, 3, '2017-07-21 14:07:12', '', 0, 1),
(17, 3, '2017-07-22 05:51:23', '', 0, 1),
(18, 3, '2017-07-22 08:06:12', '', 0, 1),
(19, 3, '2017-07-27 07:10:30', '', 0, 1),
(20, 3, '2017-07-27 08:12:26', '', 0, 1),
(21, 3, '2017-08-11 13:50:12', '', 0, 1),
(22, 3, '2017-08-15 13:11:38', '', 0, 4),
(23, 3, '2017-08-15 14:21:34', '', 0, 4),
(24, 3, '2017-08-15 14:58:40', '', 0, 1),
(25, 3, '2017-08-15 15:05:29', '', 0, 1),
(26, 4, '2017-08-15 15:06:07', 'modification paramètres', 0, 1),
(27, 4, '2017-08-15 15:07:13', 'modification paramètres', 0, 1),
(28, 4, '2017-08-15 15:07:28', 'modification paramètres', 0, 1),
(29, 4, '2017-08-15 15:07:49', 'modification paramètres', 0, 1),
(30, 4, '2017-08-15 15:08:47', 'création/modification client : 40-AIMAR', 0, 1),
(31, 3, '2017-08-17 09:02:51', '', 0, 1),
(32, 4, '2017-08-17 09:03:04', 'modification paramètres', 0, 1),
(33, 4, '2017-08-17 09:25:07', 'modification paramètres', 0, 1),
(34, 4, '2017-08-17 09:51:16', 'modification paramètres', 0, 1),
(35, 4, '2017-08-17 09:55:46', 'modification paramètres', 0, 1),
(36, 4, '2017-08-17 09:59:08', 'modification paramètres', 0, 1),
(37, 4, '2017-08-17 09:59:31', 'modification paramètres', 0, 1),
(38, 3, '2017-08-17 11:35:56', '', 0, 1),
(39, 4, '2017-08-17 11:36:10', 'modification paramètres', 0, 1),
(40, 3, '2017-08-28 13:50:41', '', 0, 1),
(41, 3, '2017-08-28 15:00:53', '', 0, 1),
(42, 3, '2017-08-28 17:37:36', '', 0, 1),
(43, 3, '2017-08-28 18:35:07', '', 0, 1),
(44, 3, '2017-08-28 18:47:16', '', 0, 1),
(45, 3, '2017-08-28 18:54:20', '', 0, 1),
(46, 3, '2017-08-29 11:59:51', '', 0, 1),
(47, 3, '2017-08-30 09:17:39', '', 0, 1),
(48, 3, '2017-08-30 12:04:42', '', 0, 1),
(49, 3, '2017-08-30 12:07:48', '', 0, 1),
(50, 3, '2017-08-31 07:27:38', '', 0, 1),
(51, 3, '2017-08-31 13:36:24', '', 0, 22),
(52, 3, '2017-08-31 13:43:38', '', 0, 1),
(53, 3, '2017-08-31 13:44:50', '', 0, 4),
(54, 3, '2017-08-31 13:45:46', '', 0, 5),
(55, 3, '2017-09-01 10:05:42', '', 0, 30),
(56, 3, '2017-09-02 06:34:07', '', 0, 30),
(57, 3, '2017-09-02 06:49:13', '', 0, 30),
(58, 3, '2017-09-02 06:51:04', '', 0, 30),
(59, 3, '2017-09-02 07:23:00', '', 0, 30),
(60, 3, '2017-09-03 14:31:48', '', 0, 4),
(61, 3, '2017-09-03 15:15:09', '', 0, 30),
(62, 3, '2017-09-03 15:16:53', '', 0, 4),
(63, 3, '2017-09-03 15:29:13', '', 0, 4),
(64, 4, '2017-09-03 16:43:01', 'création/modification user : BILLONCE', 0, 4),
(65, 4, '2017-09-03 16:44:11', 'création/modification user : BILLONCE', 0, 4),
(66, 4, '2017-09-03 17:09:33', 'création/modification user : EASTWOOD', 0, 4),
(67, 3, '2017-09-03 17:17:17', '', 0, 31),
(68, 3, '2017-09-04 06:54:20', '', 0, 4),
(69, 4, '2017-09-04 06:56:58', 'création/modification user : PENN', 0, 4),
(70, 4, '2017-09-04 06:57:44', 'création/modification user : PENN', 0, 4),
(71, 3, '2017-09-04 09:30:54', '', 0, 33),
(72, 3, '2017-09-04 09:31:21', '', 0, 4),
(73, 3, '2017-09-04 09:36:56', '', 0, 4),
(74, 4, '2017-09-04 14:45:11', 'création/modification user : ', 0, 4),
(75, 4, '2017-09-04 15:09:30', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 4),
(76, 4, '2017-09-04 15:23:14', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 4),
(77, 4, '2017-09-04 15:26:41', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 4),
(78, 4, '2017-09-04 15:27:43', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 4),
(79, 4, '2017-09-04 15:28:11', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 4),
(80, 4, '2017-09-04 15:33:42', 'création/modification user : BILLONCE', 0, 4),
(81, 4, '2017-09-04 15:36:33', 'création/modification user : BILLONCE', 0, 4),
(82, 3, '2017-09-04 16:11:29', '', 0, 5),
(83, 3, '2017-09-04 16:23:12', '', 0, 33),
(84, 4, '2017-09-04 16:29:53', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 33),
(85, 4, '2017-09-04 16:33:29', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 33),
(86, 4, '2017-09-04 16:36:53', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 33),
(87, 4, '2017-09-04 16:43:21', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 33),
(88, 4, '2017-09-04 16:46:29', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 33),
(89, 4, '2017-09-04 16:54:24', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 33),
(90, 3, '2017-09-04 18:44:36', '', 0, 1),
(91, 4, '2017-09-05 07:05:33', 'création/modification user : FOSTER', 0, 1),
(92, 4, '2017-09-05 14:13:25', 'création/modification user : FOSTER', 0, 1),
(93, 4, '2017-09-05 15:05:18', 'création/modification user : FOSTER', 0, 1),
(94, 4, '2017-09-05 15:05:27', 'création/modification user : FOSTER', 0, 1),
(95, 4, '2017-09-05 15:14:39', 'création/modification user : FOSTER', 0, 1),
(96, 4, '2017-09-05 15:26:47', 'création/modification user : FOSTER', 0, 1),
(97, 3, '2017-09-05 15:34:39', '', 0, 22),
(98, 3, '2017-09-05 15:35:37', '', 0, 22),
(99, 4, '2017-09-05 15:36:22', 'création/modification user : FOSTER', 0, 22),
(100, 3, '2017-09-05 15:37:37', '', 0, 1),
(101, 4, '2017-09-05 15:58:21', 'création/modification user : FOSTER', 0, 1),
(102, 3, '2017-09-05 15:58:34', '', 0, 1),
(103, 3, '2017-09-05 16:00:19', '', 0, 22),
(104, 4, '2017-09-05 16:07:08', 'création/modification user : FOSTER', 0, 22),
(105, 4, '2017-09-05 16:07:20', 'création/modification user : FOSTER', 0, 22),
(106, 4, '2017-09-05 17:19:27', 'création/modification user : BILLONCE', 0, 22),
(107, 3, '2017-09-06 14:32:00', '', 0, 1),
(108, 3, '2017-09-06 14:44:23', '', 0, 22),
(109, 4, '2017-09-06 14:46:10', 'création/modification user : f.mevollon@gmail.com', 0, 22),
(110, 4, '2017-09-06 16:29:28', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(111, 4, '2017-09-06 16:32:52', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(112, 4, '2017-09-06 16:37:45', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(113, 4, '2017-09-06 16:47:29', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(114, 4, '2017-09-07 08:22:53', 'création/modification user : SHARIF', 0, 22),
(115, 4, '2017-09-07 08:29:10', 'création/modification user : SHARIF', 0, 22),
(116, 4, '2017-09-07 08:29:32', 'création/modification user : SHARIF', 0, 22),
(117, 4, '2017-09-07 08:30:03', 'création/modification user : SHARIF', 0, 22),
(118, 4, '2017-09-07 08:35:14', 'création/modification user : SHARIF', 0, 22),
(119, 4, '2017-09-07 08:35:49', 'création/modification user : SHARIF', 0, 22),
(120, 4, '2017-09-07 09:18:11', 'création/modification user : EASTWOOD', 0, 22),
(121, 4, '2017-09-07 09:21:31', 'création/modification user : EASTWOOD', 0, 22),
(122, 4, '2017-09-07 09:35:28', 'création/modification user : EASTWOOD', 0, 22),
(123, 4, '2017-09-07 09:38:27', 'création/modification user : EASTWOOD', 0, 22),
(124, 4, '2017-09-07 09:46:55', 'création/modification user : EASTWOOD', 0, 22),
(125, 4, '2017-09-07 09:48:22', 'création/modification user : EASTWOOD', 0, 22),
(126, 4, '2017-09-07 09:50:13', 'création/modification user : EASTWOOD', 0, 22),
(127, 4, '2017-09-07 10:05:26', 'création/modification user : EASTWOOD', 0, 22),
(128, 4, '2017-09-07 10:08:52', 'création/modification user : EASTWOOD', 0, 22),
(129, 4, '2017-09-07 10:10:15', 'création/modification user : EASTWOOD', 0, 22),
(130, 4, '2017-09-07 10:16:30', 'création/modification user : EASTWOOD', 0, 22),
(131, 4, '2017-09-07 11:40:15', 'création/modification user : EASTWOOD', 0, 22),
(132, 4, '2017-09-07 11:41:31', 'création/modification user : EASTWOOD', 0, 22),
(133, 4, '2017-09-07 11:42:13', 'création/modification user : EASTWOOD', 0, 22),
(134, 4, '2017-09-07 11:43:40', 'création/modification user : EASTWOOD', 0, 22),
(135, 4, '2017-09-07 11:49:42', 'création/modification user : sdrgthdfgh', 0, 22),
(136, 4, '2017-09-07 11:52:48', 'création/modification user : sdrgthdfgh', 0, 22),
(137, 4, '2017-09-07 11:54:52', 'création/modification user : sdrgthdfgh', 0, 22),
(138, 4, '2017-09-07 12:00:02', 'création/modification user : FOSTER', 0, 22),
(139, 4, '2017-09-07 12:00:26', 'modification paramètres', 0, 22),
(140, 4, '2017-09-07 12:00:42', 'création/modification client : 40-AIMAR', 0, 22),
(141, 4, '2017-09-07 12:18:37', 'création/modification user : FOSTER', 0, 22),
(142, 4, '2017-09-07 12:19:30', 'création/modification user : sdrgthdfgh', 0, 22),
(143, 4, '2017-09-07 12:21:13', 'création/modification user : FOSTER', 0, 22),
(144, 4, '2017-09-07 12:22:34', 'création/modification user : FOSTER', 0, 22),
(145, 4, '2017-09-07 12:23:22', 'création/modification user : FOSTER', 0, 22),
(146, 4, '2017-09-07 12:25:04', 'création/modification user : FOSTER', 0, 22),
(147, 4, '2017-09-07 12:30:44', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(148, 4, '2017-09-07 12:48:36', 'création/modification user : FOSTER', 0, 22),
(149, 4, '2017-09-07 12:51:31', 'création/modification user : FOSTER', 0, 22),
(150, 4, '2017-09-07 12:59:42', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(151, 4, '2017-09-07 13:00:32', 'création/modification user : EASTWOOD', 0, 22),
(152, 4, '2017-09-07 13:03:19', 'création/modification user : EASTWOOD', 0, 22),
(153, 4, '2017-09-07 13:05:52', 'création/modification user : EASTWOOD', 0, 22),
(154, 4, '2017-09-07 13:08:05', 'création/modification user : EASTWOOD', 0, 22),
(155, 4, '2017-09-07 13:12:25', 'création/modification user : EASTWOOD', 0, 22),
(156, 4, '2017-09-07 13:27:51', 'création/modification user : EASTWOOD', 0, 22),
(157, 4, '2017-09-07 13:28:10', 'création/modification user : EASTWOOD', 0, 22),
(158, 4, '2017-09-07 13:29:57', 'création/modification user : EASTWOOD', 0, 22),
(159, 4, '2017-09-07 13:30:12', 'création/modification user : EASTWOOD', 0, 22),
(160, 4, '2017-09-07 13:33:01', 'création/modification user : EASTWOOD', 0, 22),
(161, 4, '2017-09-07 14:23:39', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(162, 4, '2017-09-07 14:23:53', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(163, 4, '2017-09-07 14:24:48', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(164, 4, '2017-09-07 14:42:24', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(165, 4, '2017-09-07 14:42:52', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 22),
(166, 4, '2017-09-07 14:56:58', 'création/modification user : FOSTER', 0, 22),
(167, 4, '2017-09-07 15:00:34', 'création/modification user : FOSTER', 0, 22),
(168, 4, '2017-09-07 15:05:06', 'création/modification user : FOSTER', 0, 22),
(169, 4, '2017-09-07 15:05:42', 'création/modification user : FOSTER', 0, 22),
(170, 4, '2017-09-07 15:08:28', 'création/modification user : FOSTER', 0, 22),
(171, 4, '2017-09-07 15:08:58', 'création/modification user : f.mevollon@gmail.com', 0, 22),
(172, 4, '2017-09-07 15:09:58', 'création/modification user : EASTWOOD', 0, 22),
(173, 4, '2017-09-07 15:15:28', 'création/modification user : AnotherTest', 0, 22),
(174, 4, '2017-09-07 15:31:46', 'création/modification user : AgoodTest', 0, 22),
(175, 4, '2017-09-07 15:33:33', 'création/modification user : AgoodTest', 0, 22),
(176, 4, '2017-09-07 15:34:30', 'création/modification user : AgoodTest', 0, 22),
(177, 4, '2017-09-07 15:34:44', 'création/modification user : AgoodTest', 0, 22),
(178, 3, '2017-09-08 13:23:19', '', 0, 1),
(179, 4, '2017-09-08 13:24:51', 'création/modification user : FOSTER', 0, 1),
(180, 4, '2017-09-08 13:33:39', 'création/modification user : FOSTER', 0, 1),
(181, 4, '2017-09-08 13:33:53', 'création/modification user : FOSTER', 0, 1),
(182, 3, '2017-09-08 13:38:35', '', 0, 22),
(183, 3, '2017-09-08 13:38:55', '', 0, 22),
(184, 3, '2017-09-08 13:52:22', '', 0, 39),
(185, 4, '2017-09-08 13:52:43', 'création/modification user : f.mevollon@nautilusweb.fr', 0, 39),
(186, 3, '2017-09-08 15:01:55', '', 0, 1),
(187, 4, '2017-09-08 15:02:23', 'création/modification client : 0-Fred', 0, 1),
(188, 3, '2017-09-08 15:05:42', '', 0, 5),
(189, 3, '2017-09-08 15:06:13', '', 0, 34),
(190, 3, '2017-09-08 15:08:50', '', 0, 22),
(191, 3, '2017-09-09 07:20:07', '', 0, 1),
(192, 3, '2017-09-22 15:31:14', '', 0, 1),
(193, 3, '2017-10-05 08:44:26', '', 0, 1),
(194, 3, '2017-10-05 10:20:14', '', 0, 1),
(195, 3, '2017-10-10 01:48:39', '', 0, 1),
(196, 3, '2017-10-10 02:16:05', '', 0, 1),
(197, 4, '2017-10-14 04:56:54', 'ajout ingrédient, recette 1', 0, NULL),
(198, 4, '2017-10-14 05:02:38', 'ajout ingrédient, recette 1', 0, 1),
(199, 4, '2017-10-14 05:16:46', 'ajout ingrédient 13160, recette 1', 0, 1),
(200, 4, '2017-10-14 05:23:23', 'ajout ingrédient 76079, recette 1', 0, 1),
(201, 4, '2017-10-14 05:23:54', 'ajout ingrédient 25999, recette 1', 0, 1),
(202, 4, '2017-10-14 05:32:13', 'ajout ingrédient 6103, recette 2', 0, 1),
(203, 4, '2017-10-14 05:34:47', 'ajout ingrédient 6103, recette 2', 0, 1),
(204, 4, '2017-10-14 06:04:33', 'ajout ingrédient 21520, recette 2', 0, 1),
(205, 4, '2017-10-14 06:24:20', 'ajout ingrédient 36800, recette 1', 0, 1),
(206, 3, '2017-12-08 14:47:56', '', 0, 1),
(207, 3, '2017-12-08 16:51:17', '', 0, 1),
(208, 3, '2017-12-09 09:18:46', '', 0, 1),
(209, 4, '2017-12-09 09:19:10', 'ajout ingrédient 18030, recette 1', 0, 1),
(210, 3, '2017-12-09 10:36:38', '', 0, 1),
(211, 3, '2017-12-09 15:33:04', '', 0, 1),
(212, 3, '2017-12-09 16:29:37', '', 0, 42),
(213, 4, '2017-12-09 16:29:59', 'ajout ingrédient 24030, recette 1', 0, 42),
(214, 4, '2017-12-09 16:31:34', 'ajout ingrédient 28900, recette 1', 0, 42),
(215, 3, '2017-12-09 16:51:49', '', 0, 42),
(216, 3, '2017-12-09 17:20:22', '', 0, 42),
(217, 3, '2017-12-20 10:09:15', '', 0, 1),
(218, 3, '2017-12-20 10:16:27', '', 0, 1),
(219, 3, '2017-12-21 08:31:51', '', 0, 1),
(220, 4, '2017-12-21 08:32:34', 'ajout ingrédient 38108, recette 1', 0, 1),
(221, 3, '2017-12-21 08:37:39', '', 0, 1),
(222, 3, '2018-01-07 14:46:19', '', 0, 1),
(223, 3, '2018-01-12 09:25:25', '', 0, 4),
(224, 3, '2018-01-12 09:44:14', '', 0, 4),
(225, 3, '2018-01-12 19:01:18', '', 0, 1),
(226, 3, '2018-01-14 11:44:44', '', 0, 1),
(227, 4, '2018-01-14 12:25:16', 'ajout ingrédient , recette 1', 0, 1),
(228, 4, '2018-01-14 12:43:43', 'ajout ingrédient 7815, recette 1', 0, 1),
(229, 4, '2018-01-14 12:44:26', 'ajout ingrédient 1007, recette 1', 0, 1),
(230, 4, '2018-01-14 17:29:50', 'ajout ingrédient 7815, recette ', 0, 1),
(231, 4, '2018-01-14 17:34:59', 'ajout ingrédient 7813, recette 1', 0, 1),
(232, 4, '2018-01-14 17:40:11', 'ajout ingrédient 4014, recette 1', 0, 1),
(233, 3, '2018-01-14 18:26:39', '', 0, 1),
(234, 4, '2018-01-14 18:27:38', 'ajout ingrédient 1000, recette 1', 0, 1),
(235, 4, '2018-01-14 18:28:36', 'ajout ingrédient 1000, recette 1', 0, 1),
(236, 4, '2018-01-14 18:30:52', 'ajout ingrédient 1000, recette 1', 0, 1),
(237, 4, '2018-01-14 18:32:38', 'ajout ingrédient 1000, recette 1', 0, 1),
(238, 4, '2018-01-14 19:15:08', 'modif ingrédient <br /><b>Notice</b>:  Undefined index: rel_id in <b>C:\\xampp\\htdocs\\workdev\\inter_ciqual2\\templates_c\\2d2c131191658144b16ca1b9e2d7f1f97db16db1.file.p_users_recipes.tpl.php</b> on line <b>118</b><br />, recette 1', 0, 1),
(239, 4, '2018-01-14 19:19:56', 'modif ingrédient 8, recette 1', 0, 1),
(240, 4, '2018-01-14 19:20:19', 'modif ingrédient 8, recette 1', 0, 1),
(241, 4, '2018-01-14 19:26:52', 'modif ingrédient 6, recette 1', 0, 1),
(242, 4, '2018-01-14 19:43:06', 'modif ingrédient 6, recette 1', 0, 1),
(243, 4, '2018-01-14 19:43:28', 'modif ingrédient 6, recette 1', 0, 1),
(244, 4, '2018-01-15 08:43:48', 'modif ingrédient 6, recette 1', 0, 1),
(245, 3, '2018-01-15 11:10:03', '', 0, 1),
(246, 4, '2018-01-15 11:56:15', 'ajout ingrédient 1000, recette 1', 0, 1),
(247, 4, '2018-01-15 13:14:23', 'suppression recette 1', 0, 1),
(248, 3, '2018-01-15 15:53:27', '', 0, 1),
(249, 3, '2018-01-15 16:07:53', '', 0, 1),
(250, 3, '2018-01-15 17:15:57', '', 0, 22),
(251, 3, '2018-01-15 17:28:06', '', 0, 22),
(252, 3, '2018-01-15 17:37:36', '', 0, 22),
(253, 4, '2018-01-19 16:37:03', 'nouvelle recette: 17 / Ragout de mouton', 0, 22),
(254, 3, '2018-01-19 16:53:35', '', 0, 4),
(255, 4, '2018-01-19 17:00:04', 'ajout ingrédient code: 1000 / recette: 3', 0, 4),
(256, 4, '2018-01-19 17:54:41', 'Modif. nom recette 3', 0, 4),
(257, 4, '2018-01-20 08:46:27', 'maj ingrédient id: 18 / recette: 3', 0, 4),
(258, 4, '2018-01-20 08:46:49', 'maj ingrédient id: 18 / recette: 3', 0, 4),
(259, 4, '2018-01-20 08:59:29', 'maj ingrédient id: 18 / recette: 3', 0, 4),
(260, 4, '2018-01-20 10:05:46', 'maj ingrédient id: 18 / recette: 3', 0, 4),
(261, 3, '2018-01-20 10:49:09', '', 0, 1),
(262, 3, '2018-01-20 11:17:15', '', 0, 1),
(263, 3, '2018-01-20 14:41:51', '', 0, 1),
(264, 3, '2018-01-26 08:26:59', '', 0, 1),
(265, 3, '2018-01-26 09:38:40', '', 0, 1),
(266, 3, '2018-01-26 16:16:40', '', 0, 1),
(267, 4, '2018-01-26 17:23:42', 'ajout ingrédient code: 26177 / recette: 2', 0, 1),
(268, 4, '2018-01-26 18:19:02', 'ajout ingrédient code: 40056 / recette: 2', 0, 1),
(269, 4, '2018-01-27 17:50:07', 'Modif. nom recette 2', 0, 1),
(270, 4, '2018-01-27 17:56:01', 'Modif. nom recette 2', 0, 1),
(271, 4, '2018-01-27 18:00:02', 'nouvelle recette: 4 / Coq en pâte', 0, 1),
(272, 4, '2018-01-27 18:01:04', 'Modif. nom recette 4', 0, 1),
(273, 4, '2018-01-27 18:04:28', 'Modif. nom recette 4', 0, 1),
(274, 4, '2018-01-27 18:04:45', 'Modif. nom recette 4', 0, 1),
(275, 4, '2018-01-27 18:11:49', 'Modif. nom recette 2', 0, 1),
(276, 4, '2018-01-27 18:14:24', 'Modif. nom recette 4', 0, 1),
(277, 4, '2018-01-27 18:14:36', 'Modif. nom recette 4', 0, 1),
(278, 4, '2018-01-27 18:21:36', 'suppression recette 4', 0, 1),
(279, 4, '2018-01-27 18:29:03', 'suppression recette 4', 0, 1),
(280, 4, '2018-01-27 18:37:50', 'suppression recette 4', 0, 1),
(281, 4, '2018-01-27 18:38:53', 'suppression recette 2', 0, 1),
(282, 4, '2018-01-27 18:46:57', 'suppression recette 2', 0, 1),
(283, 3, '2018-02-03 15:04:24', '', 0, 1),
(284, 3, '2018-02-03 15:39:01', '', 0, 1),
(285, 3, '2018-02-03 16:57:00', '', 0, 39),
(286, 3, '2018-02-03 17:02:52', '', 0, 39),
(287, 4, '2018-02-03 17:04:06', 'nouvelle recette: 11 / Joue de boeuf', 0, 39),
(288, 3, '2018-02-03 17:55:54', '', 0, 39),
(289, 3, '2018-02-03 18:17:42', '', 0, 46),
(290, 3, '2018-02-03 18:17:59', '', 0, 46),
(291, 3, '2018-02-03 18:22:48', '', 0, 46),
(292, 3, '2018-02-06 18:26:40', '', 0, 1),
(293, 3, '2018-02-06 18:33:19', '', 0, 1),
(294, 4, '2018-02-06 18:36:48', 'ajout ingrédient code: 1005 / recette: 1', 0, 1),
(295, 4, '2018-02-06 18:37:17', 'Modif. nom recette 1', 0, 1),
(296, 4, '2018-02-06 19:11:24', 'Modif. nom recette 2', 0, 1),
(297, 4, '2018-02-06 19:11:35', 'ajout ingrédient code: 6212 / recette: 2', 0, 1),
(298, 4, '2018-02-07 18:26:14', 'nouvelle recette: 12 / Poulet aux hormones', 0, 1),
(299, 4, '2018-02-07 18:26:31', 'suppression recette 2', 0, 1),
(300, 3, '2018-02-07 18:26:54', '', 0, 1),
(301, 3, '2018-02-07 18:27:46', '', 0, 1),
(302, 3, '2018-02-07 18:30:42', '', 0, 1),
(303, 4, '2018-02-07 18:31:32', 'Modif. nom recette 1', 0, 1),
(304, 3, '2018-02-16 16:07:17', '', 0, 1),
(305, 3, '2018-02-17 10:24:19', '', 0, 1),
(306, 3, '2018-02-17 10:29:30', '', 0, 1),
(307, 4, '2018-02-18 08:32:09', 'Modif. nom recette 2', 0, 1),
(308, 4, '2018-02-18 08:58:01', 'maj ingrédient id: 25 / recette: 2', 0, 1),
(309, 4, '2018-02-18 08:58:13', 'Modif. nom recette 2', 0, 1),
(310, 4, '2018-02-18 08:58:45', 'ajout ingrédient code: 25949 / recette: 1', 0, 1),
(311, 4, '2018-02-18 08:59:14', 'Modif. nom recette 1', 0, 1),
(312, 4, '2018-02-18 08:59:39', 'suppression recette 2', 0, 1),
(313, 4, '2018-02-18 09:36:06', 'nouvelle recette: 13 / Mique à la viande', 0, 1),
(314, 4, '2018-02-18 09:38:40', 'ajout ingrédient code: 9550 / recette: 13', 0, 1),
(315, 4, '2018-02-18 09:40:58', 'ajout ingrédient code: 16404 / recette: 13', 0, 1),
(316, 4, '2018-02-18 09:41:35', 'nouvelle recette: 14 / Tarte Tatin', 0, 1),
(317, 4, '2018-02-18 09:44:08', 'nouvelle recette: 15 / gdrgdrg', 0, 1),
(318, 4, '2018-02-18 09:44:15', 'suppression recette 14', 0, 1),
(319, 3, '2018-02-18 09:44:41', '', 0, 46),
(320, 4, '2018-02-19 19:19:51', 'nouvelle recette: 16 / Gratin de courges', 0, 46),
(321, 3, '2018-02-19 20:27:28', '', 0, 46),
(322, 3, '2018-02-19 20:32:36', '', 0, 47),
(323, 3, '2018-02-20 19:23:12', '', 0, 1),
(324, 3, '2018-02-20 19:24:32', '', 0, 1),
(325, 3, '2018-02-23 15:29:03', '', 0, 1),
(326, 3, '2018-02-23 15:46:53', '', 0, 1),
(327, 3, '2018-02-23 18:06:00', '', 0, 1),
(328, 3, '2018-02-26 12:04:02', '', 0, 1),
(329, 4, '2018-02-26 12:16:50', 'ajout ingrédient code: 9903 / recette: 14', 0, 1),
(330, 3, '2018-03-16 09:40:48', '', 0, 1),
(331, 3, '2018-03-23 09:05:44', '', 0, 1),
(332, 4, '2018-03-23 10:14:36', 'ajout ingrédient code: 19590 / recette: 14', 0, 1),
(333, 4, '2018-03-23 10:25:29', 'maj ingrédient id: 35 / recette: 14', 0, 1),
(334, 4, '2018-03-23 10:25:38', 'maj ingrédient id: 34 / recette: 14', 0, 1),
(335, 4, '2018-03-23 11:05:17', 'ajout ingrédient code: 26999 / recette: 13', 0, 1),
(336, 3, '2018-03-23 11:29:50', '', 0, 1),
(337, 3, '2018-03-23 11:33:17', '', 0, 1),
(338, 4, '2018-03-23 11:33:37', 'maj ingrédient id: 35 / recette: 14', 0, 1),
(339, 3, '2018-03-23 11:45:21', '', 0, 1),
(340, 3, '2018-03-23 13:33:43', '', 0, 1),
(341, 3, '2018-03-23 14:18:51', '', 0, 1),
(342, 4, '2018-03-23 14:44:26', 'ajout ingrédient code: 19120 / recette: 14', 0, 1),
(343, 4, '2018-03-23 14:44:59', 'ajout ingrédient code: 16413 / recette: 14', 0, 1),
(344, 4, '2018-03-23 14:55:29', 'ajout ingrédient code: 26177 / recette: 13', 0, 1),
(345, 4, '2018-03-23 14:55:48', 'suppr. ingrédient id: 39 / recette: 13', 0, 1),
(346, 4, '2018-03-23 14:56:15', 'ajout ingrédient code: 21520 / recette: 13', 0, 1),
(347, 4, '2018-03-23 15:36:27', 'suppression recette 14', 0, 1),
(348, 4, '2018-03-23 15:36:36', 'suppression recette 2', 0, 1),
(349, 4, '2018-03-23 15:36:43', 'suppression recette ', 0, 1),
(350, 4, '2018-03-23 15:41:59', 'nouvelle recette: 41 / test', 0, 1),
(351, 4, '2018-03-23 15:42:08', 'suppression recette ', 0, 1),
(352, 4, '2018-03-23 15:43:19', 'nouvelle recette: 43 / test', 0, 1),
(353, 4, '2018-03-23 15:43:29', 'suppression recette ', 0, 1),
(354, 4, '2018-03-23 15:44:29', 'nouvelle recette: 44 / test', 0, 1),
(355, 4, '2018-03-23 15:44:36', 'suppression recette ', 0, 1),
(356, 4, '2018-03-23 15:46:31', 'nouvelle recette: 45 / test', 0, 1),
(357, 4, '2018-03-23 15:46:34', 'suppression recette ', 0, 1),
(358, 4, '2018-03-23 15:50:38', 'nouvelle recette: 46 / test', 0, 1),
(359, 4, '2018-03-23 15:50:42', 'suppression recette ', 0, 1),
(360, 4, '2018-03-23 16:00:37', 'nouvelle recette: 47 / test', 0, 1),
(361, 4, '2018-03-23 16:00:41', 'suppression recette ', 0, 1),
(362, 4, '2018-03-23 16:03:43', 'nouvelle recette: 48 / test', 0, 1),
(363, 4, '2018-03-23 16:03:50', 'suppression recette ', 0, 1),
(364, 3, '2018-03-23 16:04:57', '', 0, 1),
(365, 4, '2018-03-23 16:11:25', 'nouvelle recette: 49 / test', 0, 1),
(366, 4, '2018-03-23 16:11:30', 'suppression recette n', 0, 1),
(367, 4, '2018-03-23 16:19:56', 'nouvelle recette: 52 / test', 0, 1),
(368, 3, '2018-03-23 16:27:31', '', 0, 1),
(369, 4, '2018-03-23 16:27:41', 'nouvelle recette: 1 / test', 0, 1),
(370, 4, '2018-03-23 16:28:05', 'suppression recette ', 0, 1),
(371, 4, '2018-03-23 16:40:32', 'nouvelle recette: 2 / test', 0, 1),
(372, 4, '2018-03-23 16:40:58', 'suppression recette ', 0, 1),
(373, 3, '2018-03-23 16:51:29', '', 0, 1),
(374, 4, '2018-03-23 16:51:41', 'nouvelle recette: 1 / test', 0, 1),
(375, 4, '2018-03-23 17:03:33', 'nouvelle recette: 1 / test', 0, 1),
(376, 4, '2018-03-23 17:04:38', 'ajout ingrédient code: 18904 / recette: 1', 0, 1),
(377, 4, '2018-03-23 17:05:30', 'suppression recette ', 0, 1),
(378, 4, '2018-03-23 17:09:02', 'nouvelle recette: 2 / Tarte tatin', 0, 1),
(379, 4, '2018-03-23 17:09:13', 'suppression recette ', 0, 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `app_logs_details`
--
CREATE TABLE `app_logs_details` (
`log_id` int(255)
,`log_lty_id` int(255)
,`log_date` timestamp
,`log_description` varchar(255)
,`log_cli_id` int(255)
,`log_usr_id` int(255)
,`lty_id` int(255)
,`lty_name` varchar(50)
,`usr_id` int(255)
,`usr_first_name` varchar(255)
,`usr_last_name` varchar(255)
,`usr_login` varchar(255)
,`usr_password` varchar(255)
,`usr_confirmed` int(1)
,`usr_activekey` varchar(255)
,`usr_mail` varchar(255)
,`usr_pro_id` int(255)
,`usr_lang` varchar(2)
,`usr_image_path` varchar(255)
,`usr_in_date` timestamp
,`usr_out_date` timestamp
,`usr_flag` char(1)
);

-- --------------------------------------------------------

--
-- Structure de la table `app_logs_types`
--

CREATE TABLE `app_logs_types` (
  `lty_id` int(255) NOT NULL COMMENT 'ID de l''enregistrement',
  `lty_name` varchar(50) NOT NULL COMMENT 'Nom du type de log'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `app_logs_types`
--

INSERT INTO `app_logs_types` (`lty_id`, `lty_name`) VALUES
(4, 'Action'),
(1, 'Envoi alerte'),
(2, 'Export des données'),
(3, 'Login');

-- --------------------------------------------------------

--
-- Structure de la table `app_parameters`
--

CREATE TABLE `app_parameters` (
  `prt_id` int(255) NOT NULL COMMENT 'Id du paramètre',
  `prt_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Code+Nom du paramètre',
  `prt_value` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Valeur du paramètre',
  `prt_apt_id` int(255) DEFAULT NULL COMMENT 'ID du type de paramètre',
  `prt_flag` char(1) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `app_parameters`
--

INSERT INTO `app_parameters` (`prt_id`, `prt_name`, `prt_value`, `prt_apt_id`, `prt_flag`) VALUES
(1, '__APP_MAINTAIN__', '0', 2, NULL),
(2, '__APP_DEBUG__', '1', 2, NULL),
(3, '__APP_FRONT_ADDRESS__', '', 1, NULL),
(4, '__APP_INTERNATIONAL__', '0', 2, NULL),
(5, '__APP_USER_LOGO__', '0', 2, NULL),
(6, '__APP_USER_CREATE__', '1', 2, NULL),
(7, '__APP_ACTIVE_DELAY__', '1', 3, NULL);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `app_parameters_details`
--
CREATE TABLE `app_parameters_details` (
`prt_id` int(255)
,`prt_name` varchar(255)
,`prt_value` varchar(255)
,`prt_apt_id` int(255)
,`prt_flag` char(1)
,`apt_id` int(255)
,`apt_name` varchar(255)
,`apt_cast_type` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure de la table `app_parameters_types`
--

CREATE TABLE `app_parameters_types` (
  `apt_id` int(255) NOT NULL COMMENT 'ID de l''enregistrement',
  `apt_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Nom du type de paramètre',
  `apt_cast_type` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Formule de casting'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `app_parameters_types`
--

INSERT INTO `app_parameters_types` (`apt_id`, `apt_name`, `apt_cast_type`) VALUES
(1, 'Chaine', 'string'),
(2, 'Booléen', 'bool'),
(3, 'Entier', 'int'),
(4, 'Float', 'float');

-- --------------------------------------------------------

--
-- Structure de la table `app_translate`
--

CREATE TABLE `app_translate` (
  `atr_id` int(255) NOT NULL,
  `atr_table` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Nom de la table',
  `atr_data_field` varchar(150) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Champs à traduire'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `app_translate`
--

INSERT INTO `app_translate` (`atr_id`, `atr_table`, `atr_data_field`) VALUES
(0, 'global', 'php'),
(1, 'users_profiles', 'pro_name');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `app_translate_details`
--
CREATE TABLE `app_translate_details` (
`atr_table` varchar(50)
,`atr_data_field` varchar(150)
,`atl_data_id` varchar(50)
,`atl_lang` varchar(2)
,`atl_data_lib` varchar(1000)
);

-- --------------------------------------------------------

--
-- Structure de la table `app_translate_lines`
--

CREATE TABLE `app_translate_lines` (
  `atl_id` int(255) NOT NULL,
  `atl_atr_id` int(255) NOT NULL COMMENT 'Id translate',
  `atl_data_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Id de la donnée',
  `atl_lang` varchar(2) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Langue de traduction',
  `atl_data_lib` varchar(1000) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Traduction'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `app_translate_lines`
--

INSERT INTO `app_translate_lines` (`atl_id`, `atl_atr_id`, `atl_data_id`, `atl_lang`, `atl_data_lib`) VALUES
(1, 0, 'libLogin1', 'fr', ''),
(2, 0, 'vldLogin1', 'fr', 'Votre identifiant ou votre mot de passe est incorrect'),
(3, 0, 'vldLogin2', 'fr', 'Cet identifiant n''existe pas'),
(4, 0, 'msgLogin1', 'fr', '3 tentatives échouées, veuillez contacter le responsable du site'),
(5, 0, 'msgLogin2', 'fr', '3 tentatives échouées, veuillez contacter le support technique'),
(6, 0, 'msgSupplier1', 'fr', 'Le fournisseur a été ajouté'),
(7, 0, 'msgSupplier2', 'fr', 'Erreur dans la création du logo'),
(8, 0, 'libContact1', 'fr', 'Récapitulatif de votre demande du'),
(9, 0, 'msgError1', 'fr', 'Votre session a expiré'),
(10, 0, 'btnReturn', 'fr', 'Retour'),
(11, 0, 'libLogin1', 'en', ''),
(12, 0, 'vldLogin1', 'en', 'Your login or password is incorrect'),
(13, 0, 'vldLogin2', 'en', 'This login does not exist'),
(14, 0, 'msgLogin1', 'en', '3 failed attempts, please contact the manager of the establishment'),
(15, 0, 'msgLogin2', 'en', '3 failed attempts, please contact technical support'),
(16, 0, 'msgSupplier1', 'en', 'The supplier was created'),
(17, 0, 'msgSupplier2', 'en', 'Error in creating the logo'),
(18, 0, 'libContact1', 'en', 'Summary of your request the'),
(19, 0, 'msgError1', 'en', 'Your session has expired'),
(20, 0, 'btnReturn', 'en', 'Return'),
(21, 0, 'libLogin1', 'es', ''),
(22, 0, 'vldLogin1', 'es', 'Este inicio de sesión o contraseña es incorrect'),
(23, 0, 'vldLogin2', 'es', 'Este inicio de sesión no existe'),
(24, 0, 'msgLogin1', 'es', '3 intentos fallidos, por favor póngase en contacto con el establecimiento'),
(25, 0, 'msgLogin2', 'es', '3 intentos fallidos, por favor póngase en contacto con soporte técnico'),
(26, 0, 'msgSupplier1', 'es', 'Se añadió el proveedor'),
(27, 0, 'msgSupplier2', 'es', 'Error en la creación del logotipo'),
(28, 0, 'libContact1', 'es', 'Resumen de su solicitud el'),
(29, 0, 'msgError1', 'es', 'Su sesión ha expirado'),
(30, 0, 'btnReturn', 'es', 'Retorno'),
(32, 1, '1', 'fr', 'Root'),
(33, 1, '1', 'en', 'Root'),
(34, 1, '1', 'es', 'Root'),
(35, 1, '2', 'fr', 'Responsable'),
(36, 1, '2', 'en', 'Manager'),
(37, 1, '2', 'es', 'Gerente'),
(38, 1, '3', 'fr', 'Utilisateur'),
(39, 1, '3', 'en', 'User'),
(40, 1, '3', 'es', 'Usuario'),
(41, 1, '4', 'fr', 'Patron'),
(42, 1, '4', 'en', 'Boss'),
(43, 1, '4', 'es', 'Patrón');

-- --------------------------------------------------------

--
-- Structure de la table `recipes`
--

CREATE TABLE `recipes` (
  `rec_id` int(11) NOT NULL,
  `rec_usr_id` int(11) NOT NULL,
  `rec_title` varchar(255) NOT NULL,
  `rec_label` text NOT NULL,
  `rec_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `rec_flag` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `recipes`
--

INSERT INTO `recipes` (`rec_id`, `rec_usr_id`, `rec_title`, `rec_label`, `rec_update`, `rec_flag`) VALUES
(1, 1, 'test', '<b>test</b><br/><i>Eléments d’étiquetage à rajouter sur les emballages de vos produits fabriqués :</i><br/>Valeurs nutritionnelles moyennes pour 100g : Energie 554KJ / 133Kcal ; Matières grasses 8.3g, dont acides gras saturés <0.1g ; Glucides 6.2g, dont sucres 3.2g ; Protéines 8.1g ; Sel 0.04g', '2018-03-23 17:05:30', 'D'),
(2, 1, 'Tarte tatin', '<b>Tarte tatin</b><br/><i>Eléments d’étiquetage à rajouter sur les emballages de vos produits fabriqués :</i><br/>Valeurs nutritionnelles moyennes pour 100g : Energie 888KJ / 213Kcal ; Matières grasses 13.8g, dont acides gras saturés 3.1g ; Glucides <0.5g, dont sucres <0.5g ; Protéines 22.1g ; Sel <0.01g', '2018-03-23 17:09:13', 'D');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `recipes_details`
--
CREATE TABLE `recipes_details` (
`rec_id` int(11)
,`rec_usr_id` int(11)
,`rec_title` varchar(255)
,`rec_label` text
,`rec_update` timestamp
,`rec_flag` char(1)
,`rel_id` int(11)
,`rel_rec_id` int(11)
,`rel_code` varchar(20)
,`rel_qte` float
,`rel_update` timestamp
,`rel_flag` char(1)
);

-- --------------------------------------------------------

--
-- Structure de la table `recipes_lines`
--

CREATE TABLE `recipes_lines` (
  `rel_id` int(11) NOT NULL,
  `rel_rec_id` int(11) NOT NULL,
  `rel_code` varchar(20) NOT NULL,
  `rel_qte` float NOT NULL,
  `rel_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `rel_flag` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `recipes_lines`
--

INSERT INTO `recipes_lines` (`rel_id`, `rel_rec_id`, `rel_code`, `rel_qte`, `rel_update`, `rel_flag`) VALUES
(1, 1, '8512', 15, '0000-00-00 00:00:00', NULL),
(2, 1, '18904', 20, '0000-00-00 00:00:00', NULL),
(3, 2, '26999', 10, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `usr_id` int(255) NOT NULL COMMENT 'ID',
  `usr_first_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Prénom',
  `usr_last_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Nom',
  `usr_login` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Login',
  `usr_password` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Mot de passe',
  `usr_confirmed` int(1) NOT NULL DEFAULT '0',
  `usr_activekey` varchar(255) NOT NULL,
  `usr_mail` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Mail',
  `usr_pro_id` int(255) NOT NULL COMMENT 'ID du profil',
  `usr_lang` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'fr' COMMENT 'Langue',
  `usr_image_path` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Chemin du fichier image',
  `usr_in_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date d''entrée',
  `usr_out_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date de sortie',
  `usr_flag` char(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Flag pour suppression'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`usr_id`, `usr_first_name`, `usr_last_name`, `usr_login`, `usr_password`, `usr_confirmed`, `usr_activekey`, `usr_mail`, `usr_pro_id`, `usr_lang`, `usr_image_path`, `usr_in_date`, `usr_out_date`, `usr_flag`) VALUES
(1, '', 'cnygren46@gmail.com', 'cnygren46@gmail.com', '$2y$10$d8U4w6VOsFvu5bynYpNfFewZfx1sySYzd26HjpriRewHMwyFWdbna', 1, '90b8736f8492501c7c437b97c014282a', 'cnygren46@gmail.com', 3, 'fr', 'views/img//profiles/profile_logo.png', '2018-02-23 18:05:14', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users2`
--

CREATE TABLE `users2` (
  `usr_id` int(255) NOT NULL COMMENT 'ID',
  `usr_first_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Prénom',
  `usr_last_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Nom',
  `usr_login` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Login',
  `usr_password` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Mot de passe',
  `usr_confirmed` int(1) NOT NULL DEFAULT '0',
  `usr_activekey` varchar(255) NOT NULL,
  `usr_mail` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Mail',
  `usr_pro_id` int(255) NOT NULL COMMENT 'ID du profil',
  `usr_lang` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'fr' COMMENT 'Langue',
  `usr_image_path` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Chemin du fichier image',
  `usr_in_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date d''entrée',
  `usr_out_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date de sortie',
  `usr_flag` char(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Flag pour suppression'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users2`
--

INSERT INTO `users2` (`usr_id`, `usr_first_name`, `usr_last_name`, `usr_login`, `usr_password`, `usr_confirmed`, `usr_activekey`, `usr_mail`, `usr_pro_id`, `usr_lang`, `usr_image_path`, `usr_in_date`, `usr_out_date`, `usr_flag`) VALUES
(1, 'Emilie', 'FOSTER', 'utilisateur1', '$2y$10$PJk.fKrarYSjo2cRcyKl4OzWQQsp/iOQfJ7hmGeGhiHZbUwi541CW', 1, '', 'test2016@mdp', 3, 'fr', 'views/img/profiles/usertile11.bmp', '2016-02-26 09:45:28', '0000-00-00 00:00:00', NULL),
(4, 'RootNautilus', '', 'rootnautilus', '$2y$10$PJk.fKrarYSjo2cRcyKl4OzWQQsp/iOQfJ7hmGeGhiHZbUwi541CW', 1, '', '', 1, 'fr', 'views/img/profiles/usertile37.bmp', '2016-03-02 19:07:29', '0000-00-00 00:00:00', NULL),
(39, 'Fred', 'f.mevollon@nautilusweb.fr', 'f.mevollon@nautilusweb.fr', '$2y$10$02Q76ngpCyJKif3rX2cTBeEs5hUt5j54UfdXhRWHsSihcnL/tmYCu', 1, 'bc0d83da033a9957f4d1d71eebf92500', 'f.mevollon@nautilusweb.fr', 3, 'fr', 'views/img//profiles/profile_logo.png', '2017-09-08 13:51:44', '0000-00-00 00:00:00', NULL),
(47, '', 'cnygren46@gmail.com', 'cnygren46@gmail.com', '$2y$10$5nAEFuQjDQAPWew40WrcyOqSbz/nIk5Kj2v9khzE5o9hWKF6VeCAO', 1, '77bf1c477e7c21c39ecd1157c7c009dc', 'cnygren46@gmail.com', 3, 'fr', 'views/img//profiles/profile_logo.png', '2018-02-19 20:31:06', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `users_details`
--
CREATE TABLE `users_details` (
`usr_id` int(255)
,`usr_first_name` varchar(255)
,`usr_last_name` varchar(255)
,`usr_login` varchar(255)
,`usr_password` varchar(255)
,`usr_confirmed` int(1)
,`usr_activekey` varchar(255)
,`usr_mail` varchar(255)
,`usr_pro_id` int(255)
,`usr_lang` varchar(2)
,`usr_image_path` varchar(255)
,`usr_in_date` timestamp
,`usr_out_date` timestamp
,`usr_flag` char(1)
,`pro_id` int(255)
,`pro_name` varchar(255)
,`pro_access` int(255)
,`pro_flag` char(1)
);

-- --------------------------------------------------------

--
-- Structure de la table `users_profiles`
--

CREATE TABLE `users_profiles` (
  `pro_id` int(255) NOT NULL COMMENT 'ID du profil',
  `pro_name` varchar(255) NOT NULL COMMENT 'Nom du profil',
  `pro_access` int(255) NOT NULL COMMENT 'Valeur accès',
  `pro_flag` char(1) DEFAULT NULL COMMENT 'Flag pour suppression'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Profils utilisateurs';

--
-- Contenu de la table `users_profiles`
--

INSERT INTO `users_profiles` (`pro_id`, `pro_name`, `pro_access`, `pro_flag`) VALUES
(1, 'Root', 999, NULL),
(2, 'Responsable', 599, NULL),
(3, 'Utilisateur', 199, NULL),
(4, 'Administrateur', 799, NULL);

-- --------------------------------------------------------

--
-- Structure de la vue `app_logs_details`
--
DROP TABLE IF EXISTS `app_logs_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_logs_details`  AS  select `app_logs`.`log_id` AS `log_id`,`app_logs`.`log_lty_id` AS `log_lty_id`,`app_logs`.`log_date` AS `log_date`,`app_logs`.`log_description` AS `log_description`,`app_logs`.`log_cli_id` AS `log_cli_id`,`app_logs`.`log_usr_id` AS `log_usr_id`,`app_logs_types`.`lty_id` AS `lty_id`,`app_logs_types`.`lty_name` AS `lty_name`,`users`.`usr_id` AS `usr_id`,`users`.`usr_first_name` AS `usr_first_name`,`users`.`usr_last_name` AS `usr_last_name`,`users`.`usr_login` AS `usr_login`,`users`.`usr_password` AS `usr_password`,`users`.`usr_confirmed` AS `usr_confirmed`,`users`.`usr_activekey` AS `usr_activekey`,`users`.`usr_mail` AS `usr_mail`,`users`.`usr_pro_id` AS `usr_pro_id`,`users`.`usr_lang` AS `usr_lang`,`users`.`usr_image_path` AS `usr_image_path`,`users`.`usr_in_date` AS `usr_in_date`,`users`.`usr_out_date` AS `usr_out_date`,`users`.`usr_flag` AS `usr_flag` from ((`app_logs` join `app_logs_types` on((`app_logs`.`log_lty_id` = `app_logs_types`.`lty_id`))) left join `users` on((`app_logs`.`log_usr_id` = `users`.`usr_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `app_parameters_details`
--
DROP TABLE IF EXISTS `app_parameters_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_parameters_details`  AS  select `app_parameters`.`prt_id` AS `prt_id`,`app_parameters`.`prt_name` AS `prt_name`,`app_parameters`.`prt_value` AS `prt_value`,`app_parameters`.`prt_apt_id` AS `prt_apt_id`,`app_parameters`.`prt_flag` AS `prt_flag`,`app_parameters_types`.`apt_id` AS `apt_id`,`app_parameters_types`.`apt_name` AS `apt_name`,`app_parameters_types`.`apt_cast_type` AS `apt_cast_type` from (`app_parameters` join `app_parameters_types` on((`app_parameters_types`.`apt_id` = `app_parameters`.`prt_apt_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `app_translate_details`
--
DROP TABLE IF EXISTS `app_translate_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_translate_details`  AS  select `app_translate`.`atr_table` AS `atr_table`,`app_translate`.`atr_data_field` AS `atr_data_field`,`app_translate_lines`.`atl_data_id` AS `atl_data_id`,`app_translate_lines`.`atl_lang` AS `atl_lang`,`app_translate_lines`.`atl_data_lib` AS `atl_data_lib` from (`app_translate` join `app_translate_lines` on((`app_translate`.`atr_id` = `app_translate_lines`.`atl_atr_id`))) order by `app_translate`.`atr_table`,`app_translate`.`atr_data_field`,`app_translate_lines`.`atl_data_id`,`app_translate_lines`.`atl_lang` ;

-- --------------------------------------------------------

--
-- Structure de la vue `recipes_details`
--
DROP TABLE IF EXISTS `recipes_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recipes_details`  AS  select `recipes`.`rec_id` AS `rec_id`,`recipes`.`rec_usr_id` AS `rec_usr_id`,`recipes`.`rec_title` AS `rec_title`,`recipes`.`rec_label` AS `rec_label`,`recipes`.`rec_update` AS `rec_update`,`recipes`.`rec_flag` AS `rec_flag`,`recipes_lines`.`rel_id` AS `rel_id`,`recipes_lines`.`rel_rec_id` AS `rel_rec_id`,`recipes_lines`.`rel_code` AS `rel_code`,`recipes_lines`.`rel_qte` AS `rel_qte`,`recipes_lines`.`rel_update` AS `rel_update`,`recipes_lines`.`rel_flag` AS `rel_flag` from (`recipes` join `recipes_lines` on((`recipes`.`rec_id` = `recipes_lines`.`rel_rec_id`))) where isnull(`recipes`.`rec_flag`) order by `recipes_lines`.`rel_rec_id`,`recipes_lines`.`rel_qte` desc ;

-- --------------------------------------------------------

--
-- Structure de la vue `users_details`
--
DROP TABLE IF EXISTS `users_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users_details`  AS  select `users`.`usr_id` AS `usr_id`,`users`.`usr_first_name` AS `usr_first_name`,`users`.`usr_last_name` AS `usr_last_name`,`users`.`usr_login` AS `usr_login`,`users`.`usr_password` AS `usr_password`,`users`.`usr_confirmed` AS `usr_confirmed`,`users`.`usr_activekey` AS `usr_activekey`,`users`.`usr_mail` AS `usr_mail`,`users`.`usr_pro_id` AS `usr_pro_id`,`users`.`usr_lang` AS `usr_lang`,`users`.`usr_image_path` AS `usr_image_path`,`users`.`usr_in_date` AS `usr_in_date`,`users`.`usr_out_date` AS `usr_out_date`,`users`.`usr_flag` AS `usr_flag`,`users_profiles`.`pro_id` AS `pro_id`,`users_profiles`.`pro_name` AS `pro_name`,`users_profiles`.`pro_access` AS `pro_access`,`users_profiles`.`pro_flag` AS `pro_flag` from (`users` join `users_profiles` on((`users`.`usr_pro_id` = `users_profiles`.`pro_id`))) ;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `app_logs`
--
ALTER TABLE `app_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_date` (`log_date`),
  ADD KEY `log_lty_id` (`log_lty_id`),
  ADD KEY `log_date_2` (`log_date`),
  ADD KEY `log_cli_id` (`log_cli_id`),
  ADD KEY `log_usr_id` (`log_usr_id`);

--
-- Index pour la table `app_logs_types`
--
ALTER TABLE `app_logs_types`
  ADD PRIMARY KEY (`lty_id`),
  ADD UNIQUE KEY `lty_name` (`lty_name`);

--
-- Index pour la table `app_parameters`
--
ALTER TABLE `app_parameters`
  ADD PRIMARY KEY (`prt_id`);

--
-- Index pour la table `app_parameters_types`
--
ALTER TABLE `app_parameters_types`
  ADD PRIMARY KEY (`apt_id`),
  ADD KEY `apt_name` (`apt_name`(191));

--
-- Index pour la table `app_translate`
--
ALTER TABLE `app_translate`
  ADD PRIMARY KEY (`atr_id`);

--
-- Index pour la table `app_translate_lines`
--
ALTER TABLE `app_translate_lines`
  ADD PRIMARY KEY (`atl_id`),
  ADD KEY `tll_id` (`atl_atr_id`);

--
-- Index pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `rec_usr_id` (`rec_usr_id`);

--
-- Index pour la table `recipes_lines`
--
ALTER TABLE `recipes_lines`
  ADD PRIMARY KEY (`rel_id`),
  ADD UNIQUE KEY `rec_id_code` (`rel_rec_id`,`rel_code`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usr_id`);

--
-- Index pour la table `users2`
--
ALTER TABLE `users2`
  ADD PRIMARY KEY (`usr_id`);

--
-- Index pour la table `users_profiles`
--
ALTER TABLE `users_profiles`
  ADD PRIMARY KEY (`pro_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `app_logs`
--
ALTER TABLE `app_logs`
  MODIFY `log_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID de l''enregistrement', AUTO_INCREMENT=380;
--
-- AUTO_INCREMENT pour la table `app_parameters`
--
ALTER TABLE `app_parameters`
  MODIFY `prt_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'Id du paramètre', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `app_parameters_types`
--
ALTER TABLE `app_parameters_types`
  MODIFY `apt_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID de l''enregistrement', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `app_translate_lines`
--
ALTER TABLE `app_translate_lines`
  MODIFY `atl_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT pour la table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `rec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `recipes_lines`
--
ALTER TABLE `recipes_lines`
  MODIFY `rel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `usr_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `users2`
--
ALTER TABLE `users2`
  MODIFY `usr_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=48;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
