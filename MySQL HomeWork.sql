-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema buying
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema buying
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `buying` DEFAULT CHARACTER SET utf8mb4 ;
USE `buying` ;

-- -----------------------------------------------------
-- Table `buying`.`catagories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buying`.`catagories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `catagories_name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `buying`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buying`.`city` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `buying`.`manufacture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buying`.`manufacture` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `manu_name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `buying`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buying`.`product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(20) NULL DEFAULT NULL,
  `price` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `buying`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buying`.`customers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(20) NULL DEFAULT NULL,
  `city_id` INT(11) NULL DEFAULT NULL,
  `manufacture_id` INT(11) NULL DEFAULT NULL,
  `catagories_id` INT(11) NULL DEFAULT NULL,
  `product_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `city_id_constraint` (`city_id` ASC) VISIBLE,
  INDEX `catagories_id_constraint` (`catagories_id` ASC) VISIBLE,
  INDEX `product_id_constraint` (`product_id` ASC) VISIBLE,
  INDEX `manufacture_id_constraint` (`manufacture_id` ASC) VISIBLE,
  CONSTRAINT `catagories_id_constraint`
    FOREIGN KEY (`catagories_id`)
    REFERENCES `buying`.`catagories` (`id`),
  CONSTRAINT `city_id_constraint`
    FOREIGN KEY (`city_id`)
    REFERENCES `buying`.`city` (`id`),
  CONSTRAINT `manufacture_id_constraint`
    FOREIGN KEY (`manufacture_id`)
    REFERENCES `buying`.`manufacture` (`id`),
  CONSTRAINT `product_id_constraint`
    FOREIGN KEY (`product_id`)
    REFERENCES `buying`.`product` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
