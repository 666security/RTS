-- MySQL Script generated by MySQL Workbench
-- Wed Sep 28 15:30:24 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`villagers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`villagers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nick` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`villages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`villages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `x` VARCHAR(45) NULL,
  `y` VARCHAR(45) NULL,
  `playerid` INT NULL,
  `villagers_id` INT NOT NULL,
  PRIMARY KEY (`id`, `villagers_id`),
  CONSTRAINT `fk_villages_villagers1`
    FOREIGN KEY (`villagers_id`)
    REFERENCES `mydb`.`villagers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`buildings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`resources` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`troops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`troops` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `damage` VARCHAR(45) NULL,
  `distance.damage` VARCHAR(45) NULL,
  `defense` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`villages_has_resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`villages_has_resources` (
  `villages_id` INT NOT NULL AUTO_INCREMENT,
  `villages_villagers_id` INT NOT NULL,
  `resources_id` INT NOT NULL,
  `value` INT NULL,
  PRIMARY KEY (`villages_id`, `villages_villagers_id`, `resources_id`),
  CONSTRAINT `fk_villages_has_resources_villages1`
    FOREIGN KEY (`villages_id`)
    REFERENCES `mydb`.`villages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_villages_has_resources_resources1`
    FOREIGN KEY (`resources_id`)
    REFERENCES `mydb`.`resources` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`villages_has_buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`villages_has_buildings` (
  `villages_id` INT NOT NULL AUTO_INCREMENT,
  `villages_villagers_id` INT NOT NULL,
  `buildings_id` INT NOT NULL,
  PRIMARY KEY (`villages_id`, `villages_villagers_id`, `buildings_id`),
  CONSTRAINT `fk_villages_has_buildings_villages1`
    FOREIGN KEY (`villages_id`)
    REFERENCES `mydb`.`villages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_villages_has_buildings_buildings1`
    FOREIGN KEY (`buildings_id`)
    REFERENCES `mydb`.`buildings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`villages_has_troops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`villages_has_troops` (
  `villages_id` INT NOT NULL AUTO_INCREMENT,
  `villages_villagers_id` INT NOT NULL,
  `troops_id` INT NOT NULL,
  PRIMARY KEY (`villages_id`, `villages_villagers_id`, `troops_id`),
  CONSTRAINT `fk_villages_has_troops_villages1`
    FOREIGN KEY (`villages_id`)
    REFERENCES `mydb`.`villages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_villages_has_troops_troops1`
    FOREIGN KEY (`troops_id`)
    REFERENCES `mydb`.`troops` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
