SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `iot_dashboard_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `iot_dashboard_db` ;

-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`widget`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`widget` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `type` ENUM('bool', 'integer', 'enumerated_integer', 'decimal', 'enumerated_decimal', 'textual', 'enumerated_textual') NOT NULL ,
  `topic` VARCHAR(100) NOT NULL ,
  `date` DATE NOT NULL ,
  `time` TIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`decimal_widget`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`decimal_widget` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `direction` ENUM('read_only', 'read_write') NOT NULL ,
  `max_value` DECIMAL(10,4) NOT NULL ,
  `min_value` DECIMAL(10,4) NOT NULL ,
  `archiving_on` TINYINT(1) NOT NULL ,
  `graphical_info` TEXT NOT NULL ,
  `widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `widget_id_fk_idx_6` (`widget_id` ASC) ,
  CONSTRAINT `widget_id_fk_6`
    FOREIGN KEY (`widget_id` )
    REFERENCES `iot_dashboard_db`.`widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`integer_widget`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`integer_widget` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `direction` ENUM('read_only', 'read_write') NOT NULL ,
  `max_value` INT NOT NULL ,
  `min_value` INT NOT NULL ,
  `archiving_on` TINYINT(1) NOT NULL ,
  `graphical_info` TEXT NOT NULL ,
  `widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `widget_id_fk_idx_1` (`widget_id` ASC) ,
  CONSTRAINT `widget_id_fk_1`
    FOREIGN KEY (`widget_id` )
    REFERENCES `iot_dashboard_db`.`widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`bool_widget`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`bool_widget` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `direction` ENUM('read_only', 'read_write') NOT NULL ,
  `archiving_on` TINYINT(1) NOT NULL ,
  `graphical_info` TEXT NOT NULL ,
  `widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `widget_id_fk_idx_3` (`widget_id` ASC) ,
  CONSTRAINT `widget_id_fk_3`
    FOREIGN KEY (`widget_id` )
    REFERENCES `iot_dashboard_db`.`widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`textual_widget`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`textual_widget` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `direction` ENUM('read_only', 'read_write') NOT NULL ,
  `archiving_on` TINYINT(1) NOT NULL ,
  `graphical_info` TEXT NOT NULL ,
  `widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `widget_id_fk_idx_5` (`widget_id` ASC) ,
  CONSTRAINT `widget_id_fk_5`
    FOREIGN KEY (`widget_id` )
    REFERENCES `iot_dashboard_db`.`widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`enumerated_integer_widget`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`enumerated_integer_widget` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `direction` ENUM('read_only', 'read_write') NOT NULL ,
  `archiving_on` TINYINT(1) NOT NULL ,
  `graphical_info` TEXT NOT NULL ,
  `widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `widget_id_fk_idx_2` (`widget_id` ASC) ,
  CONSTRAINT `widget_id_fk_2`
    FOREIGN KEY (`widget_id` )
    REFERENCES `iot_dashboard_db`.`widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`enumerated_decimal_widget`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`enumerated_decimal_widget` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `direction` ENUM('read_only', 'read_write') NOT NULL ,
  `archiving_on` TINYINT(1) NOT NULL ,
  `graphical_info` TEXT NOT NULL ,
  `widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `widget_id_fk_idx_7` (`widget_id` ASC) ,
  CONSTRAINT `widget_id_fk_7`
    FOREIGN KEY (`widget_id` )
    REFERENCES `iot_dashboard_db`.`widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`enumerated_textual_widget`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`enumerated_textual_widget` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `direction` ENUM('read_only', 'read_write') NOT NULL ,
  `archiving_on` TINYINT(1) NOT NULL ,
  `graphical_info` TEXT NOT NULL ,
  `widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `widget_id_fk_idx_4` (`widget_id` ASC) ,
  CONSTRAINT `widget_id_fk_4`
    FOREIGN KEY (`widget_id` )
    REFERENCES `iot_dashboard_db`.`widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`integer_limitation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`integer_limitation` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `limit` INT NOT NULL ,
  `enumerated_integer_widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `enumerated_integer_widget_id_fk_idx_3` (`enumerated_integer_widget_id` ASC) ,
  CONSTRAINT `enumerated_integer_widget_id_fk_3`
    FOREIGN KEY (`enumerated_integer_widget_id` )
    REFERENCES `iot_dashboard_db`.`enumerated_integer_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`decimal_limitation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`decimal_limitation` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `limit` DECIMAL(10,4) NOT NULL ,
  `enumerated_decimal_widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `enumerated_decimal_widget_id_fk_idx_3` (`enumerated_decimal_widget_id` ASC) ,
  CONSTRAINT `enumerated_decimal_widget_id_fk_3`
    FOREIGN KEY (`enumerated_decimal_widget_id` )
    REFERENCES `iot_dashboard_db`.`enumerated_decimal_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`textual_limitation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`textual_limitation` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `limit` VARCHAR(100) NOT NULL ,
  `enumerated_textual_widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `enumerated_textual_widget_id_fk_idx_1` (`enumerated_textual_widget_id` ASC) ,
  CONSTRAINT `enumerated_textual_widget_id_fk_1`
    FOREIGN KEY (`enumerated_textual_widget_id` )
    REFERENCES `iot_dashboard_db`.`enumerated_textual_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`last_integer_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`last_integer_value` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `value` INT NOT NULL ,
  `integer_widget_id` INT NULL ,
  `enumerated_integer_widget_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `integer_widget_id_fk_idx_1` (`integer_widget_id` ASC) ,
  CONSTRAINT `integer_widget_id_fk_1`
    FOREIGN KEY (`integer_widget_id` )
    REFERENCES `iot_dashboard_db`.`integer_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `enumerated_integer_widget_id_fk_1`
    FOREIGN KEY (`enumerated_integer_widget_id` )
    REFERENCES `iot_dashboard_db`.`enumerated_integer_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`archived_integer_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`archived_integer_value` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `time` TIME NOT NULL ,
  `value` INT NOT NULL ,
  `integer_widget_id` INT NULL ,
  `enumerated_integer_widget_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `integer_widget_id_fk_idx_2` (`integer_widget_id` ASC) ,
  CONSTRAINT `integer_widget_id_fk_2`
    FOREIGN KEY (`integer_widget_id` )
    REFERENCES `iot_dashboard_db`.`integer_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `enumerated_integer_widget_id_fk_2`
    FOREIGN KEY (`enumerated_integer_widget_id` )
    REFERENCES `iot_dashboard_db`.`enumerated_integer_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`archived_decimal_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`archived_decimal_value` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `time` TIME NOT NULL ,
  `value` DECIMAL(10,4) NOT NULL ,
  `decimal_widget_id` INT NULL ,
  `enumerated_decimal_widget_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `decimal_widget_id_fk_idx_1` (`decimal_widget_id` ASC) ,
  INDEX `enumerated_decimal_widget_id_fk_idx_1` (`enumerated_decimal_widget_id` ASC) ,
  CONSTRAINT `decimal_widget_id_fk_1`
    FOREIGN KEY (`decimal_widget_id` )
    REFERENCES `iot_dashboard_db`.`decimal_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `enumerated_decimal_widget_id_fk_1`
    FOREIGN KEY (`enumerated_decimal_widget_id` )
    REFERENCES `iot_dashboard_db`.`enumerated_decimal_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`last_decimal_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`last_decimal_value` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `value` DECIMAL(10,4) NOT NULL ,
  `decimal_widget_id` INT NULL ,
  `enumerated_decimal_widget_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `decimal_widget_id_fk_idx_2` (`decimal_widget_id` ASC) ,
  CONSTRAINT `decimal_widget_id_fk_2`
    FOREIGN KEY (`decimal_widget_id` )
    REFERENCES `iot_dashboard_db`.`decimal_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `enumerated_decimal_widget_id_fk_2`
    FOREIGN KEY (`enumerated_decimal_widget_id` )
    REFERENCES `iot_dashboard_db`.`enumerated_decimal_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`last_textual_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`last_textual_value` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `value` TEXT NOT NULL ,
  `textual_widget_id` INT NULL ,
  `enumerated_textual_widget_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `textual_widget_id_fk_idx_1` (`textual_widget_id` ASC) ,
  CONSTRAINT `textual_widget_id_fk_1`
    FOREIGN KEY (`textual_widget_id` )
    REFERENCES `iot_dashboard_db`.`textual_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `enumerated_textual_widget_id_fk_2`
    FOREIGN KEY (`enumerated_textual_widget_id` )
    REFERENCES `iot_dashboard_db`.`enumerated_textual_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`archived_textual_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`archived_textual_value` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `time` TIME NOT NULL ,
  `value` TEXT NOT NULL ,
  `textual_widget_id` INT NULL ,
  `enumerated_textual_widget_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `textual_widget_id_fk_idx_2` (`textual_widget_id` ASC) ,
  CONSTRAINT `textual_widget_id_fk_2`
    FOREIGN KEY (`textual_widget_id` )
    REFERENCES `iot_dashboard_db`.`textual_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `enumerated_textual_widget_id_fk_3`
    FOREIGN KEY (`enumerated_textual_widget_id` )
    REFERENCES `iot_dashboard_db`.`enumerated_textual_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`last_bool_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`last_bool_value` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `value` TINYINT(1) NOT NULL ,
  `bool_widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `bool_widget_id_fk_idx_1` (`bool_widget_id` ASC) ,
  CONSTRAINT `bool_widget_id_fk_1`
    FOREIGN KEY (`bool_widget_id` )
    REFERENCES `iot_dashboard_db`.`bool_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`archived_bool_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`archived_bool_value` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `time` TIME NOT NULL ,
  `value` TINYINT(1) NOT NULL ,
  `bool_widget_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `bool_widget_id_fk_idx_2` (`bool_widget_id` ASC) ,
  CONSTRAINT `bool_widget_id_fk_2`
    FOREIGN KEY (`bool_widget_id` )
    REFERENCES `iot_dashboard_db`.`bool_widget` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iot_dashboard_db`.`widget_change`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `iot_dashboard_db`.`widget_change` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `flag` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

USE `iot_dashboard_db` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
