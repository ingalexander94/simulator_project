# ************************************************************
# Sequel Ace SQL dump
# Versión 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Equipo: localhost (MySQL 11.2.2-MariaDB-1:11.2.2+maria~ubu2204)
# Base de datos: mapi_db_client
# Tiempo de generación: 2024-03-18 21:13:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla mp_brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_brands`;

CREATE TABLE `mp_brands` (
  `id_brand` int(11) NOT NULL AUTO_INCREMENT,
  `brand_code` varchar(100) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `brand_team` int(11) NOT NULL,
  `brand_state` tinyint(4) DEFAULT 1,
  `brand_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_brand`),
  KEY `brand_team` (`brand_team`),
  CONSTRAINT `mp_brands_ibfk_1` FOREIGN KEY (`brand_team`) REFERENCES `mp_teams` (`id_team`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_brands` WRITE;
/*!40000 ALTER TABLE `mp_brands` DISABLE KEYS */;

INSERT INTO `mp_brands` (`id_brand`, `brand_code`, `brand_name`, `brand_team`, `brand_state`, `brand_created_at`)
VALUES
	(9,'M','MARCA 1',12,1,'2024-02-29 19:14:14');

/*!40000 ALTER TABLE `mp_brands` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_bridges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_bridges`;

CREATE TABLE `mp_bridges` (
  `id_bridge` int(11) NOT NULL AUTO_INCREMENT,
  `bridge_front_brand` varchar(100) DEFAULT NULL,
  `bridge_front_model` varchar(100) DEFAULT NULL,
  `bridge_serial` varchar(100) DEFAULT NULL,
  `bridge_front_suspension` varchar(100) DEFAULT NULL,
  `bridge_rear_suspension` varchar(100) DEFAULT NULL,
  `bridge_rear_brand` varchar(100) DEFAULT NULL,
  `bridge_rear_model` varchar(100) DEFAULT NULL,
  `bridge_intermediate_differential` varchar(100) DEFAULT NULL,
  `bridge_rear_differential` varchar(100) DEFAULT NULL,
  `bridge_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_bridge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_bridges` WRITE;
/*!40000 ALTER TABLE `mp_bridges` DISABLE KEYS */;

INSERT INTO `mp_bridges` (`id_bridge`, `bridge_front_brand`, `bridge_front_model`, `bridge_serial`, `bridge_front_suspension`, `bridge_rear_suspension`, `bridge_rear_brand`, `bridge_rear_model`, `bridge_intermediate_differential`, `bridge_rear_differential`, `bridge_created_at`)
VALUES
	(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 15:49:39'),
	(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 15:52:05'),
	(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 15:58:43'),
	(4,'Motorola',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 16:00:32'),
	(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 16:01:29'),
	(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-18 13:30:29');

/*!40000 ALTER TABLE `mp_bridges` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_components`;

CREATE TABLE `mp_components` (
  `id_component` int(11) NOT NULL AUTO_INCREMENT,
  `component_code` varchar(100) NOT NULL,
  `component_name` varchar(100) NOT NULL,
  `component_team` int(11) NOT NULL,
  `component_state` tinyint(4) DEFAULT 1,
  `component_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_component`),
  KEY `component_team` (`component_team`),
  CONSTRAINT `mp_components_ibfk_1` FOREIGN KEY (`component_team`) REFERENCES `mp_teams` (`id_team`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla mp_engines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_engines`;

CREATE TABLE `mp_engines` (
  `id_engine` int(11) NOT NULL AUTO_INCREMENT,
  `engine_brand` varchar(100) DEFAULT NULL,
  `engine_model` varchar(100) DEFAULT NULL,
  `engine_cylinder_capacity` varchar(100) DEFAULT NULL,
  `engine_serial` varchar(100) DEFAULT NULL,
  `engine_power` varchar(100) DEFAULT NULL,
  `engine_rpm_power` varchar(100) DEFAULT NULL,
  `engine_torque` varchar(100) DEFAULT NULL,
  `engine_governed_speed` varchar(100) DEFAULT NULL,
  `engine_ecm_name` varchar(100) DEFAULT NULL,
  `engine_ecm_code` varchar(100) DEFAULT NULL,
  `engine_part_ecm` varchar(100) DEFAULT NULL,
  `engine_serial_ecm` varchar(100) DEFAULT NULL,
  `engine_cpl` varchar(100) DEFAULT NULL,
  `engine_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_engine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_engines` WRITE;
/*!40000 ALTER TABLE `mp_engines` DISABLE KEYS */;

INSERT INTO `mp_engines` (`id_engine`, `engine_brand`, `engine_model`, `engine_cylinder_capacity`, `engine_serial`, `engine_power`, `engine_rpm_power`, `engine_torque`, `engine_governed_speed`, `engine_ecm_name`, `engine_ecm_code`, `engine_part_ecm`, `engine_serial_ecm`, `engine_cpl`, `engine_created_at`)
VALUES
	(1,'Test 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 14:32:01'),
	(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 15:49:39'),
	(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 15:52:05'),
	(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 15:58:43'),
	(5,'Toyota',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 16:00:32'),
	(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-15 16:01:29'),
	(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-18 13:30:29');

/*!40000 ALTER TABLE `mp_engines` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_expenses_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_expenses_detail`;

CREATE TABLE `mp_expenses_detail` (
  `id_expenses_detail` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ed_concept` varchar(100) DEFAULT NULL,
  `ed_price` float DEFAULT NULL,
  `ed_id_operating` int(11) NOT NULL,
  PRIMARY KEY (`id_expenses_detail`),
  KEY `ed_id_operating` (`ed_id_operating`),
  CONSTRAINT `ed_id_operating` FOREIGN KEY (`ed_id_operating`) REFERENCES `mp_operating_expenses` (`id_operating_expenses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla mp_inventory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_inventory`;

CREATE TABLE `mp_inventory` (
  `id_inventory` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_item_name` varchar(100) DEFAULT NULL,
  `inventory_reference` varchar(100) DEFAULT NULL,
  `inventory_quantity` int(11) DEFAULT NULL,
  `inventory_units` int(11) DEFAULT NULL,
  `inventory_price_without_tax` varchar(100) DEFAULT NULL,
  `inventory_tax` varchar(100) DEFAULT NULL,
  `inventory_price_with_tax` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_inventory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_inventory` WRITE;
/*!40000 ALTER TABLE `mp_inventory` DISABLE KEYS */;

INSERT INTO `mp_inventory` (`id_inventory`, `inventory_item_name`, `inventory_reference`, `inventory_quantity`, `inventory_units`, `inventory_price_without_tax`, `inventory_tax`, `inventory_price_with_tax`, `created_at`, `updated_at`)
VALUES
	(1,'Filtro de combustible 25 Micras','FS197665',1,1,'200000','1000','2000','2024-02-29 19:20:36',NULL),
	(2,'Filtro separador ISXPP','FF3699W',100,2,'4000','19','4760','2024-02-29 19:09:38','2024-03-11 20:56:57');

/*!40000 ALTER TABLE `mp_inventory` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_maintenance_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_maintenance_type`;

CREATE TABLE `mp_maintenance_type` (
  `id_maintenance_type` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_type_name` varchar(100) NOT NULL,
  `maintenance_type_state` tinyint(4) DEFAULT 1,
  `maintenance_type_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_maintenance_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_maintenance_type` WRITE;
/*!40000 ALTER TABLE `mp_maintenance_type` DISABLE KEYS */;

INSERT INTO `mp_maintenance_type` (`id_maintenance_type`, `maintenance_type_name`, `maintenance_type_state`, `maintenance_type_created_at`)
VALUES
	(1,'Mantenimiento preventivo',1,'2024-02-23 17:18:46'),
	(2,'Mantenimiento correctivo programado',1,'2024-02-23 17:18:46'),
	(3,'Mantenimiento por condición',1,'2024-02-29 15:38:00'),
	(4,'Mantenimiento reactivo',1,'2024-02-29 15:38:00');

/*!40000 ALTER TABLE `mp_maintenance_type` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_models
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_models`;

CREATE TABLE `mp_models` (
  `id_model` int(11) NOT NULL AUTO_INCREMENT,
  `model_code` varchar(100) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `model_init_year` smallint(6) NOT NULL,
  `model_final_year` smallint(6) NOT NULL,
  `model_engine` varchar(100) NOT NULL,
  `model_transmission` varchar(300) NOT NULL,
  `model_application` varchar(300) NOT NULL,
  `model_brand` int(11) NOT NULL,
  `model_state` tinyint(4) DEFAULT 1,
  `model_created_at` timestamp NULL DEFAULT current_timestamp(),
  `model_suspension` varchar(300) NOT NULL,
  `model_rear_bridge` varchar(300) NOT NULL,
  PRIMARY KEY (`id_model`),
  KEY `model_brand` (`model_brand`),
  CONSTRAINT `mp_models_ibfk_1` FOREIGN KEY (`model_brand`) REFERENCES `mp_brands` (`id_brand`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_models` WRITE;
/*!40000 ALTER TABLE `mp_models` DISABLE KEYS */;

INSERT INTO `mp_models` (`id_model`, `model_code`, `model_name`, `model_init_year`, `model_final_year`, `model_engine`, `model_transmission`, `model_application`, `model_brand`, `model_state`, `model_created_at`, `model_suspension`, `model_rear_bridge`)
VALUES
	(11,'M1','M200',2008,2010,'MOTOR AKT','AWS 200','TRACTOCAMIÓN',9,1,'2024-02-29 19:14:14','SUSPENSIÓN 200','PUENTE TRASERO 200');

/*!40000 ALTER TABLE `mp_models` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_operating_expenses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_operating_expenses`;

CREATE TABLE `mp_operating_expenses` (
  `id_operating_expenses` int(11) NOT NULL AUTO_INCREMENT,
  `ope_departure_location` varchar(100) DEFAULT NULL,
  `ope_departure_date` timestamp NULL DEFAULT NULL,
  `ope_arrival_place` varchar(100) DEFAULT NULL,
  `ope_arrival_date` timestamp NULL DEFAULT NULL,
  `ope_km_driven` varchar(100) DEFAULT NULL,
  `ope_company` varchar(100) DEFAULT NULL,
  `ope_product` varchar(100) DEFAULT NULL,
  `ope_total_expenses` float DEFAULT NULL,
  `ope_travel_utility` float DEFAULT NULL,
  `ope_car_plate` varchar(50) NOT NULL DEFAULT '',
  `ope_id_driver` int(11) NOT NULL,
  `ope_name_manager` varchar(100) DEFAULT NULL,
  `ope_phone_manager` varchar(100) DEFAULT NULL,
  `ope_advance_company` float DEFAULT NULL,
  PRIMARY KEY (`id_operating_expenses`),
  KEY `ope_car_plate` (`ope_car_plate`),
  KEY `ope_id_driver` (`ope_id_driver`),
  CONSTRAINT `ope_car_plate` FOREIGN KEY (`ope_car_plate`) REFERENCES `mp_user_team` (`ut_car_plate`),
  CONSTRAINT `ope_id_driver` FOREIGN KEY (`ope_id_driver`) REFERENCES `mp_personal` (`id_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla mp_operation_model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_operation_model`;

CREATE TABLE `mp_operation_model` (
  `id_operation_model` int(11) NOT NULL AUTO_INCREMENT,
  `om_id_operation` int(11) NOT NULL,
  `om_id_model` int(11) NOT NULL,
  PRIMARY KEY (`id_operation_model`),
  KEY `om_id_operation` (`om_id_operation`),
  KEY `om_id_model` (`om_id_model`),
  CONSTRAINT `mp_operation_model_ibfk_1` FOREIGN KEY (`om_id_operation`) REFERENCES `mp_operations` (`id_operation`) ON DELETE CASCADE,
  CONSTRAINT `mp_operation_model_ibfk_2` FOREIGN KEY (`om_id_model`) REFERENCES `mp_models` (`id_model`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_operation_model` WRITE;
/*!40000 ALTER TABLE `mp_operation_model` DISABLE KEYS */;

INSERT INTO `mp_operation_model` (`id_operation_model`, `om_id_operation`, `om_id_model`)
VALUES
	(4,7,11);

/*!40000 ALTER TABLE `mp_operation_model` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_operations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_operations`;

CREATE TABLE `mp_operations` (
  `id_operation` int(11) NOT NULL AUTO_INCREMENT,
  `operation_team` int(11) DEFAULT NULL,
  `operation_component` varchar(50) NOT NULL,
  `operation_measure` tinyint(4) NOT NULL,
  `operation_description` varchar(200) NOT NULL,
  `operation_technician` int(11) DEFAULT NULL,
  `operation_maintenance_type` int(11) DEFAULT NULL,
  `operation_total` int(11) DEFAULT NULL,
  `operation_state` tinyint(4) DEFAULT 1,
  `operation_created_at` timestamp NULL DEFAULT current_timestamp(),
  `operation_kilometres` int(11) DEFAULT NULL,
  `operation_hours` int(11) DEFAULT NULL,
  `operation_duration_minutes` float DEFAULT NULL,
  `operation_duration_hours` float DEFAULT NULL,
  PRIMARY KEY (`id_operation`),
  KEY `operation_maintenance_type` (`operation_maintenance_type`),
  KEY `operation_team` (`operation_team`),
  KEY `operation_technician` (`operation_technician`),
  CONSTRAINT `mp_operations_ibfk_1` FOREIGN KEY (`operation_maintenance_type`) REFERENCES `mp_maintenance_type` (`id_maintenance_type`),
  CONSTRAINT `mp_operations_ibfk_2` FOREIGN KEY (`operation_team`) REFERENCES `mp_teams` (`id_team`) ON DELETE SET NULL,
  CONSTRAINT `mp_operations_ibfk_3` FOREIGN KEY (`operation_technician`) REFERENCES `mp_technician` (`id_technician`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_operations` WRITE;
/*!40000 ALTER TABLE `mp_operations` DISABLE KEYS */;

INSERT INTO `mp_operations` (`id_operation`, `operation_team`, `operation_component`, `operation_measure`, `operation_description`, `operation_technician`, `operation_maintenance_type`, `operation_total`, `operation_state`, `operation_created_at`, `operation_kilometres`, `operation_hours`, `operation_duration_minutes`, `operation_duration_hours`)
VALUES
	(7,12,'C-10',2,'Cambiar las tapas del motor.',2,1,10000,1,'2024-02-29 19:19:15',2000,600,NULL,NULL),
	(8,12,'C-10',1,'Mensaje de prueba',NULL,NULL,NULL,1,'2024-02-29 19:28:26',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `mp_operations` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_personal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_personal`;

CREATE TABLE `mp_personal` (
  `id_personal` int(11) NOT NULL AUTO_INCREMENT,
  `personal_names` varchar(100) NOT NULL,
  `personal_surnames` varchar(100) NOT NULL,
  `personal_phone` varchar(100) NOT NULL,
  `personal_document` varchar(100) NOT NULL,
  `personal_photo` varchar(100) DEFAULT 'mapi/avatars/default.svg',
  `personal_technician` int(11) DEFAULT NULL,
  `personal_salary` int(11) DEFAULT NULL,
  `personal_status` tinyint(4) DEFAULT 1,
  `personal_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_personal`),
  KEY `personal_technician` (`personal_technician`),
  CONSTRAINT `mp_personal_ibfk_1` FOREIGN KEY (`personal_technician`) REFERENCES `mp_technician` (`id_technician`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_personal` WRITE;
/*!40000 ALTER TABLE `mp_personal` DISABLE KEYS */;

INSERT INTO `mp_personal` (`id_personal`, `personal_names`, `personal_surnames`, `personal_phone`, `personal_document`, `personal_photo`, `personal_technician`, `personal_salary`, `personal_status`, `personal_created_at`)
VALUES
	(2,'Alexander','Peñaloza','+573213568479','1090494143','mapi/avatars/2/avatar_1709907500782_137848259.jpg',3,1000000,1,'2024-03-07 15:40:35'),
	(3,'Freymar','Sanchez','+573213568479','1090494143','mapi/avatars/default.svg',2,1000000,1,'2024-03-07 15:40:35');

/*!40000 ALTER TABLE `mp_personal` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_roles`;

CREATE TABLE `mp_roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_description` varchar(100) DEFAULT NULL,
  `role_state` tinyint(4) DEFAULT 1 COMMENT '0: inactivo, 1: activo',
  PRIMARY KEY (`id_role`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_roles` WRITE;
/*!40000 ALTER TABLE `mp_roles` DISABLE KEYS */;

INSERT INTO `mp_roles` (`id_role`, `role_name`, `role_description`, `role_state`)
VALUES
	(1,'SUPERADMIN','Usuario prinicipal con permisos globales',1),
	(2,'ADMIN','Usuario con permisos sobre los clientes',1),
	(3,'TEAM','Usuario con permisos específicos',1),
	(4,'CONDUCTOR','Usuario conductor',1);

/*!40000 ALTER TABLE `mp_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_systems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_systems`;

CREATE TABLE `mp_systems` (
  `id_system` int(11) NOT NULL AUTO_INCREMENT,
  `system_code` varchar(100) NOT NULL,
  `system_name` varchar(100) NOT NULL,
  `system_component` int(11) NOT NULL,
  `system_state` tinyint(4) DEFAULT 1,
  `system_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_system`),
  KEY `system_component` (`system_component`),
  CONSTRAINT `mp_systems_ibfk_1` FOREIGN KEY (`system_component`) REFERENCES `mp_components` (`id_component`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Volcado de tabla mp_team_photo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_team_photo`;

CREATE TABLE `mp_team_photo` (
  `id_team_photo` int(11) NOT NULL AUTO_INCREMENT,
  `tp_user_team` int(11) DEFAULT NULL,
  `tp_photo` varchar(300) DEFAULT NULL,
  `tp_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_team_photo`),
  KEY `tp_user_team` (`tp_user_team`),
  CONSTRAINT `mp_team_photo_ibfk_1` FOREIGN KEY (`tp_user_team`) REFERENCES `mp_user_team` (`id_user_team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_team_photo` WRITE;
/*!40000 ALTER TABLE `mp_team_photo` DISABLE KEYS */;

INSERT INTO `mp_team_photo` (`id_team_photo`, `tp_user_team`, `tp_photo`, `tp_created_at`)
VALUES
	(1,1,'https://cdn.agroempresario.com/images/posts/9ec916d83e27122fe9cf691228bfd8c8f616aa5b2d4381ec_840.jpg','2024-03-11 13:22:10'),
	(2,2,'https://www.shutterstock.com/image-photo/small-solo-truck-delivery-box-600nw-2237366807.jpg','2024-03-11 13:22:10'),
	(3,3,'https://i.ytimg.com/vi/k3--D5q-zls/maxresdefault.jpg','2024-03-11 13:22:10'),
	(5,5,'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png','2024-03-15 15:52:05'),
	(6,6,'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png','2024-03-15 15:58:43'),
	(7,7,'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png','2024-03-15 16:00:32'),
	(8,8,'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png','2024-03-15 16:01:29'),
	(9,9,'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png','2024-03-18 13:30:29');

/*!40000 ALTER TABLE `mp_team_photo` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_teams`;

CREATE TABLE `mp_teams` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) NOT NULL,
  `team_state` tinyint(4) DEFAULT 1,
  `team_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_teams` WRITE;
/*!40000 ALTER TABLE `mp_teams` DISABLE KEYS */;

INSERT INTO `mp_teams` (`id_team`, `team_name`, `team_state`, `team_created_at`)
VALUES
	(12,'Tractocamión',1,'2024-02-29 19:09:38'),
	(13,'Camion',1,'2024-03-13 18:50:39'),
	(14,'Volqt',1,'2024-03-13 18:50:45');

/*!40000 ALTER TABLE `mp_teams` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_technician
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_technician`;

CREATE TABLE `mp_technician` (
  `id_technician` int(11) NOT NULL AUTO_INCREMENT,
  `technician_name` varchar(100) NOT NULL,
  `technician_code` varchar(100) DEFAULT NULL,
  `technician_description` varchar(400) DEFAULT NULL,
  `technician_education` varchar(100) DEFAULT NULL,
  `technician_salary` varchar(20) DEFAULT NULL,
  `technician_icon` varchar(100) DEFAULT NULL,
  `technician_state` tinyint(4) DEFAULT NULL COMMENT '0: inactivo, 1: activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_technician`,`technician_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_technician` WRITE;
/*!40000 ALTER TABLE `mp_technician` DISABLE KEYS */;

INSERT INTO `mp_technician` (`id_technician`, `technician_name`, `technician_code`, `technician_description`, `technician_education`, `technician_salary`, `technician_icon`, `technician_state`, `created_at`, `updated_at`)
VALUES
	(2,'Técnico de motor nivel 1','TM1','Este técnico debe conocer como cambiar las tapas de un motor.','Tecnólogo','1300000','/assets/Motor-FD9xSgtb.svg',1,'2024-02-29 19:20:36','2024-02-29 19:21:22'),
	(3,'Conductor','C1','Conductor','Profesional','1000000','/assets/Mechanics-_ty_URhn.svg',1,'2024-03-07 15:35:36',NULL);

/*!40000 ALTER TABLE `mp_technician` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_transmissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_transmissions`;

CREATE TABLE `mp_transmissions` (
  `id_transmission` int(11) NOT NULL AUTO_INCREMENT,
  `transmission_brand` varchar(100) DEFAULT NULL,
  `transmission_model` varchar(100) DEFAULT NULL,
  `transmission_oil_cooler` smallint(6) DEFAULT NULL,
  `transmission_serial` varchar(100) DEFAULT NULL,
  `transmission_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_transmission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_transmissions` WRITE;
/*!40000 ALTER TABLE `mp_transmissions` DISABLE KEYS */;

INSERT INTO `mp_transmissions` (`id_transmission`, `transmission_brand`, `transmission_model`, `transmission_oil_cooler`, `transmission_serial`, `transmission_created_at`)
VALUES
	(1,NULL,NULL,NULL,NULL,'2024-03-15 15:49:39'),
	(2,NULL,NULL,NULL,NULL,'2024-03-15 15:52:05'),
	(3,NULL,NULL,NULL,NULL,'2024-03-15 15:58:43'),
	(4,'Siemens',NULL,1,NULL,'2024-03-15 16:00:32'),
	(5,NULL,NULL,NULL,NULL,'2024-03-15 16:01:29'),
	(6,NULL,NULL,NULL,NULL,'2024-03-18 13:30:29');

/*!40000 ALTER TABLE `mp_transmissions` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_user_roles`;

CREATE TABLE `mp_user_roles` (
  `id_user_role` int(11) NOT NULL AUTO_INCREMENT,
  `ur_id_user` int(11) NOT NULL,
  `ur_id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_user_role`),
  KEY `ur_id_user` (`ur_id_user`),
  KEY `ur_id_role` (`ur_id_role`),
  CONSTRAINT `mp_user_roles_ibfk_1` FOREIGN KEY (`ur_id_user`) REFERENCES `mp_users` (`id_user`),
  CONSTRAINT `mp_user_roles_ibfk_10` FOREIGN KEY (`ur_id_role`) REFERENCES `mp_roles` (`id_role`),
  CONSTRAINT `mp_user_roles_ibfk_2` FOREIGN KEY (`ur_id_role`) REFERENCES `mp_roles` (`id_role`),
  CONSTRAINT `mp_user_roles_ibfk_3` FOREIGN KEY (`ur_id_user`) REFERENCES `mp_users` (`id_user`),
  CONSTRAINT `mp_user_roles_ibfk_4` FOREIGN KEY (`ur_id_role`) REFERENCES `mp_roles` (`id_role`),
  CONSTRAINT `mp_user_roles_ibfk_5` FOREIGN KEY (`ur_id_user`) REFERENCES `mp_users` (`id_user`),
  CONSTRAINT `mp_user_roles_ibfk_6` FOREIGN KEY (`ur_id_role`) REFERENCES `mp_roles` (`id_role`),
  CONSTRAINT `mp_user_roles_ibfk_7` FOREIGN KEY (`ur_id_user`) REFERENCES `mp_users` (`id_user`),
  CONSTRAINT `mp_user_roles_ibfk_8` FOREIGN KEY (`ur_id_role`) REFERENCES `mp_roles` (`id_role`),
  CONSTRAINT `mp_user_roles_ibfk_9` FOREIGN KEY (`ur_id_user`) REFERENCES `mp_users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_user_roles` WRITE;
/*!40000 ALTER TABLE `mp_user_roles` DISABLE KEYS */;

INSERT INTO `mp_user_roles` (`id_user_role`, `ur_id_user`, `ur_id_role`)
VALUES
	(1,1,1),
	(2,1,2),
	(3,2,1),
	(4,2,2),
	(5,3,2),
	(6,3,1);

/*!40000 ALTER TABLE `mp_user_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_user_team
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_user_team`;

CREATE TABLE `mp_user_team` (
  `id_user_team` int(11) NOT NULL AUTO_INCREMENT,
  `ut_user` int(11) DEFAULT NULL,
  `ut_team` int(11) DEFAULT NULL,
  `ut_brand` int(11) DEFAULT NULL,
  `ut_model` int(11) DEFAULT NULL,
  `ut_year` smallint(6) DEFAULT NULL,
  `ut_car_plate` varchar(50) DEFAULT NULL,
  `ut_application` varchar(100) DEFAULT NULL,
  `ut_date_purchased` timestamp NULL DEFAULT NULL,
  `ut_measure` int(11) DEFAULT NULL,
  `ut_vin` varchar(50) DEFAULT NULL,
  `ut_driver` int(11) DEFAULT NULL,
  `ut_engine` int(11) DEFAULT NULL,
  `ut_wheels_number` tinyint(4) DEFAULT NULL,
  `ut_rear_tires_number` tinyint(4) DEFAULT NULL,
  `ut_front_tires_number` tinyint(4) DEFAULT NULL,
  `ut_transmission` int(11) DEFAULT NULL,
  `ut_bridge` int(11) DEFAULT NULL,
  `ut_state` tinyint(4) DEFAULT 1,
  `ut_created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_user_team`),
  KEY `ut_team` (`ut_team`),
  KEY `ut_brand` (`ut_brand`),
  KEY `ut_model` (`ut_model`),
  KEY `ut_driver` (`ut_driver`),
  KEY `ut_engine` (`ut_engine`),
  KEY `ut_transmission` (`ut_transmission`),
  KEY `ut_bridge` (`ut_bridge`),
  KEY `ut_user` (`ut_user`),
  KEY `ut_car_plate` (`ut_car_plate`),
  CONSTRAINT `mp_user_team_ibfk ut_driver` FOREIGN KEY (`ut_driver`) REFERENCES `mp_personal` (`id_personal`),
  CONSTRAINT `mp_user_team_ibfk_1` FOREIGN KEY (`ut_team`) REFERENCES `mp_teams` (`id_team`),
  CONSTRAINT `mp_user_team_ibfk_2` FOREIGN KEY (`ut_brand`) REFERENCES `mp_brands` (`id_brand`),
  CONSTRAINT `mp_user_team_ibfk_3` FOREIGN KEY (`ut_model`) REFERENCES `mp_models` (`id_model`),
  CONSTRAINT `mp_user_team_ibfk_5` FOREIGN KEY (`ut_engine`) REFERENCES `mp_engines` (`id_engine`),
  CONSTRAINT `mp_user_team_ibfk_6` FOREIGN KEY (`ut_transmission`) REFERENCES `mp_transmissions` (`id_transmission`),
  CONSTRAINT `mp_user_team_ibfk_7` FOREIGN KEY (`ut_bridge`) REFERENCES `mp_bridges` (`id_bridge`),
  CONSTRAINT `mp_user_team_ibfk_8` FOREIGN KEY (`ut_user`) REFERENCES `mp_users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_user_team` WRITE;
/*!40000 ALTER TABLE `mp_user_team` DISABLE KEYS */;

INSERT INTO `mp_user_team` (`id_user_team`, `ut_user`, `ut_team`, `ut_brand`, `ut_model`, `ut_year`, `ut_car_plate`, `ut_application`, `ut_date_purchased`, `ut_measure`, `ut_vin`, `ut_driver`, `ut_engine`, `ut_wheels_number`, `ut_rear_tires_number`, `ut_front_tires_number`, `ut_transmission`, `ut_bridge`, `ut_state`, `ut_created_at`)
VALUES
	(1,1,12,9,11,2008,'WOY52C','MOTOS','2024-03-11 13:13:58',1,'3WKDD40XXMF728346',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-03-11 12:57:38'),
	(2,1,12,9,11,2008,'MSI125','MOTOS','2024-03-11 13:13:58',1,'3WKDD40XXMF728346',2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-03-11 12:57:38'),
	(3,1,12,9,11,2008,'MSI126','MOTOS','2024-03-11 00:00:00',1,'3WKDD40XXMF728346',2,1,4,2,2,NULL,NULL,1,'2024-03-11 12:57:38'),
	(5,NULL,12,9,11,2008,'WOY53C','',NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,2,NULL,'2024-03-15 15:52:05'),
	(6,NULL,12,9,11,2008,'woy54c','',NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,3,3,NULL,'2024-03-15 15:58:43'),
	(7,NULL,12,9,11,2008,'WOY56C','MOTOS','2024-03-16 00:00:00',1,NULL,2,5,NULL,NULL,NULL,4,4,NULL,'2024-03-15 16:00:32'),
	(8,NULL,12,9,11,2008,'WOC52C','CAMIÓN','2024-03-13 00:00:00',NULL,NULL,NULL,6,NULL,NULL,NULL,5,5,NULL,'2024-03-15 16:01:29'),
	(9,NULL,12,9,11,2009,'ytu546','',NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,6,6,NULL,'2024-03-18 13:30:29');

/*!40000 ALTER TABLE `mp_user_team` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla mp_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mp_users`;

CREATE TABLE `mp_users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_names` varchar(100) NOT NULL,
  `user_surnames` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(64) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_document` varchar(50) DEFAULT NULL,
  `user_photo` varchar(100) DEFAULT NULL,
  `user_code` varchar(6) DEFAULT NULL,
  `user_position` varchar(100) DEFAULT NULL,
  `user_salary` float DEFAULT NULL,
  `user_state` tinyint(4) DEFAULT 1 COMMENT '0: inactivo, 1: activo',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_document` (`user_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `mp_users` WRITE;
/*!40000 ALTER TABLE `mp_users` DISABLE KEYS */;

INSERT INTO `mp_users` (`id_user`, `user_names`, `user_surnames`, `user_email`, `user_password`, `user_phone`, `user_document`, `user_photo`, `user_code`, `user_position`, `user_salary`, `user_state`, `created_at`)
VALUES
	(1,'Yorluis','Vega','yorluis.vega@wiedii.co','a33e6c581ec1d4ac3818807eae92c2fd95dcbd3567b2a17b88eface13a831bcc','+573144095806','1093803754',NULL,NULL,NULL,NULL,1,'2024-01-12 18:47:42'),
	(2,'Libardo','Silva','libardo.silva@gmail.com','a33e6c581ec1d4ac3818807eae92c2fd95dcbd3567b2a17b88eface13a831bcc','+573213568479','1093803756',NULL,NULL,NULL,NULL,1,'2024-02-28 18:47:42'),
	(3,'Luis','Peñaloza','luis.penaloza@wiedii.co','a33e6c581ec1d4ac3818807eae92c2fd95dcbd3567b2a17b88eface13a831bcc','+573213568479',NULL,NULL,NULL,NULL,NULL,1,'2024-03-05 13:57:55');

/*!40000 ALTER TABLE `mp_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
