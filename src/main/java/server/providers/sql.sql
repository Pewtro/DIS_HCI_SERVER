-- MySQL Script generated by MySQL Workbench
-- Tue Oct 17 20:29:36 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema stfu
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema stfu
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stfu` DEFAULT CHARACTER SET latin1 ;
USE `stfu` ;

-- -----------------------------------------------------
-- Table `stfu`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stfu`.`events` (
  `idEvent` INT(11) NOT NULL,
  `eventName` VARCHAR(100) NOT NULL,
  `idStudent` INT(11) NOT NULL,
  `location` VARCHAR(100) NOT NULL,
  `price` INT(11) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` LONGTEXT NOT NULL,
  PRIMARY KEY (`idEvent`),
  UNIQUE INDEX `idEvent_UNIQUE` (`idEvent` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stfu`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stfu`.`students` (
  `idStudent` INT(11) NOT NULL,
  `firstName` VARCHAR(100) NOT NULL,
  `lastName` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE INDEX `idStudent_UNIQUE` (`idStudent` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stfu`.`student_has_event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stfu`.`student_has_event` (
  `events_idEvent` INT(11) NOT NULL,
  `student_has_eventId` INT(11) NOT NULL,
  `students_idStudent1` INT(11) NOT NULL,
  INDEX `fk_Student_has_Event_Event1_idx` (`events_idEvent` ASC),
  PRIMARY KEY (`student_has_eventId`),
  INDEX `fk_student_has_event_students1_idx` (`students_idStudent1` ASC),
  CONSTRAINT `fk_Student_has_Event_Event1`
    FOREIGN KEY (`events_idEvent`)
    REFERENCES `stfu`.`events` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_event_students1`
    FOREIGN KEY (`students_idStudent1`)
    REFERENCES `stfu`.`students` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
