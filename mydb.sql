-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`address` ;

CREATE TABLE IF NOT EXISTS `mydb`.`address` (
  `zip_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `zip_code` VARCHAR(45) NOT NULL COMMENT '',
  `city` VARCHAR(45) NOT NULL COMMENT '',
  `state` VARCHAR(45) NOT NULL COMMENT '',
  `country` VARCHAR(45) NOT NULL COMMENT '',
  `address` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`zip_id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`property` ;

CREATE TABLE IF NOT EXISTS `mydb`.`property` (
  `prop_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `price` DOUBLE NOT NULL COMMENT '',
  `size` VARCHAR(45) NOT NULL COMMENT '',
  `bed` INT(11) NOT NULL COMMENT '',
  `bath` INT(11) NOT NULL COMMENT '',
  `description` LONGTEXT NOT NULL COMMENT '',
  `type` VARCHAR(45) NOT NULL COMMENT '',
  `address_zip_id1` INT(10) UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`prop_id`)  COMMENT '',
  INDEX `fk_property_address1_idx` (`address_zip_id1` ASC)  COMMENT '',
  CONSTRAINT `fk_property_address1`
    FOREIGN KEY (`address_zip_id1`)
    REFERENCES `mydb`.`address` (`zip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`propertyphoto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`propertyphoto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`propertyphoto` (
  `photo_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `photo_name` VARCHAR(45) NOT NULL COMMENT '',
  `photo_path` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`photo_id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `fname` VARCHAR(45) NOT NULL COMMENT '',
  `lname` VARCHAR(45) NOT NULL COMMENT '',
  `dob` VARCHAR(45) NOT NULL COMMENT '',
  `gender` VARCHAR(45) NOT NULL COMMENT '',
  `contact` VARCHAR(45) NOT NULL COMMENT '',
  `email` VARCHAR(45) NOT NULL COMMENT '',
  `address_zip_id` INT(10) UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`user_id`)  COMMENT '',
  INDEX `fk_users_address1_idx` (`address_zip_id` ASC)  COMMENT '',
  CONSTRAINT `fk_users_address`
    FOREIGN KEY (`address_zip_id`)
    REFERENCES `mydb`.`address` (`zip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`propertylisting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`propertylisting` ;

CREATE TABLE IF NOT EXISTS `mydb`.`propertylisting` (
  `listing_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `propertyphoto_photo_id` INT(10) UNSIGNED NOT NULL COMMENT '',
  `property_prop_id` INT(10) UNSIGNED NOT NULL COMMENT '',
  `users_user_id` INT(10) UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`listing_id`)  COMMENT '',
  INDEX `fk_propertylisting_propertyphoto1_idx` (`propertyphoto_photo_id` ASC)  COMMENT '',
  INDEX `fk_propertylisting_property1_idx` (`property_prop_id` ASC)  COMMENT '',
  INDEX `fk_propertylisting_users1_idx` (`users_user_id` ASC)  COMMENT '',
  CONSTRAINT `fk_propertylisting_property1`
    FOREIGN KEY (`property_prop_id`)
    REFERENCES `mydb`.`property` (`prop_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_propertylisting_propertyphoto1`
    FOREIGN KEY (`propertyphoto_photo_id`)
    REFERENCES `mydb`.`propertyphoto` (`photo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_propertylisting_users1`
    FOREIGN KEY (`users_user_id`)
    REFERENCES `mydb`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
