-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema advantis_dental_surgery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema advantis_dental_surgery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `advantis_dental_surgery` DEFAULT CHARACTER SET utf8 ;
USE `advantis_dental_surgery` ;

-- -----------------------------------------------------
-- Table `advantis_dental_surgery`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `advantis_dental_surgery`.`users` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `phoneNumber` VARCHAR(45) NULL,
  `emailAddress` VARCHAR(45) NULL,
  `dateOfBirth` VARCHAR(45) NULL,
  `address_street` VARCHAR(45) NULL,
  `address_city` VARCHAR(45) NULL,
  `address_zip` VARCHAR(45) NULL,
  `address_state` VARCHAR(45) NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `advantis_dental_surgery`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `advantis_dental_surgery`.`roles` (
  `roleId` INT NOT NULL AUTO_INCREMENT,
  `roleName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`roleId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `advantis_dental_surgery`.`appointment_requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `advantis_dental_surgery`.`appointment_requests` (
  `appointmentRequestId` INT NOT NULL AUTO_INCREMENT,
  `appointmentRequestDateTime` DATETIME NULL,
  `requestedBy` INT NULL,
  `doctorId` INT NULL,
  PRIMARY KEY (`appointmentRequestId`),
  INDEX `users_appointmentsrequest_idx` (`requestedBy` ASC) VISIBLE,
  INDEX `users_app_request_doc_idx` (`doctorId` ASC) VISIBLE,
  CONSTRAINT `users_appointmentsrequest`
    FOREIGN KEY (`requestedBy`)
    REFERENCES `advantis_dental_surgery`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `users_app_request_doc`
    FOREIGN KEY (`doctorId`)
    REFERENCES `advantis_dental_surgery`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `advantis_dental_surgery`.`appointments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `advantis_dental_surgery`.`appointments` (
  `appointmentId` INT NOT NULL AUTO_INCREMENT,
  `appointmentDate` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  `createdBy` INT NULL,
  `doctorId` INT NULL,
  `patientId` INT NULL,
  PRIMARY KEY (`appointmentId`),
  INDEX `user_appointment_fk_idx` (`createdBy` ASC) VISIBLE,
  INDEX `user_appointment_doctorfk_idx` (`doctorId` ASC) VISIBLE,
  INDEX `user_appointment_patientId_idx` (`patientId` ASC) VISIBLE,
  CONSTRAINT `user_appointment_fk`
    FOREIGN KEY (`createdBy`)
    REFERENCES `advantis_dental_surgery`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_appointment_doctorfk`
    FOREIGN KEY (`doctorId`)
    REFERENCES `advantis_dental_surgery`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_appointment_patientId`
    FOREIGN KEY (`patientId`)
    REFERENCES `advantis_dental_surgery`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `advantis_dental_surgery`.`surgerylocations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `advantis_dental_surgery`.`surgerylocations` (
  `surgeryLocationsId` INT NOT NULL AUTO_INCREMENT,
  `locationName` VARCHAR(45) NULL,
  `surgeryLocationPhoneNumber` VARCHAR(45) NULL,
  `appointment_id` INT NULL,
  PRIMARY KEY (`surgeryLocationsId`),
  INDEX `appointments_surgerylocation_fk_idx` (`appointment_id` ASC) VISIBLE,
  CONSTRAINT `appointments_surgerylocation_fk`
    FOREIGN KEY (`appointment_id`)
    REFERENCES `advantis_dental_surgery`.`appointments` (`appointmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `advantis_dental_surgery`.`bills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `advantis_dental_surgery`.`bills` (
  `billId` INT NOT NULL AUTO_INCREMENT,
  `amount` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `userId` INT NULL,
  PRIMARY KEY (`billId`),
  INDEX `users_bills_fk_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `users_bills_fk`
    FOREIGN KEY (`userId`)
    REFERENCES `advantis_dental_surgery`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `advantis_dental_surgery`.`users_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `advantis_dental_surgery`.`users_roles` (
  `userRoleId` INT NOT NULL,
  `userId` INT NULL,
  `roleId` INT NULL,
  PRIMARY KEY (`userRoleId`),
  INDEX `users_role_fk_idx` (`userId` ASC) VISIBLE,
  INDEX `users_role_fk_idx1` (`roleId` ASC) VISIBLE,
  CONSTRAINT `users_role_fk1`
    FOREIGN KEY (`userId`)
    REFERENCES `advantis_dental_surgery`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `users_role_fk2`
    FOREIGN KEY (`roleId`)
    REFERENCES `advantis_dental_surgery`.`roles` (`roleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
