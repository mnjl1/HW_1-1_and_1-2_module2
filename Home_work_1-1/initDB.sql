-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema developer_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema developer_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `developer_db` DEFAULT CHARACTER SET utf8 ;
USE `developer_db` ;

-- -----------------------------------------------------
-- Table `developer_db`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `developer_db`.`customers` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customerName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `developer_db`.`itcompany`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `developer_db`.`itcompany` (
  `itcompany_id` INT(11) NOT NULL AUTO_INCREMENT,
  `companyName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`itcompany_id`, `companyName`))
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `developer_db`.`developers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `developer_db`.`developers` (
  `developer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `itcompany_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`developer_id`),
  INDEX `itcompany_id_idx` (`itcompany_id` ASC),
  CONSTRAINT `itcompany_id`
  FOREIGN KEY (`itcompany_id`)
  REFERENCES `developer_db`.`itcompany` (`itcompany_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  AUTO_INCREMENT = 20
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `developer_db`.`developer_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `developer_db`.`developer_skills` (
  `developer_id` INT(11) NOT NULL,
  `skill` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`developer_id`, `skill`),
  CONSTRAINT `developer_id_fk`
  FOREIGN KEY (`developer_id`)
  REFERENCES `developer_db`.`developers` (`developer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `developer_db`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `developer_db`.`projects` (
  `developer_id` INT(11) NOT NULL DEFAULT '0',
  `projectName` VARCHAR(45) NOT NULL,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `cost` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`projectName`, `developer_id`),
  INDEX `developer_id_idx` (`developer_id` ASC),
  INDEX `customer_id_idx` (`customer_id` ASC),
  CONSTRAINT `customer_id`
  FOREIGN KEY (`customer_id`)
  REFERENCES `developer_db`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `developer_id`
  FOREIGN KEY (`developer_id`)
  REFERENCES `developer_db`.`developers` (`developer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
