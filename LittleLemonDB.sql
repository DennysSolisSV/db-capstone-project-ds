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
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `CustomerID` INT NOT NULL,
  `CustomerFirstName` VARCHAR(150) NULL,
  `CustomerLastName` VARCHAR(150) NULL,
  `PhoneNumber` VARCHAR(75) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `BookingID` INT NOT NULL,
  `TableNo` INT NULL,
  `CustomerID` INT NULL,
  `BookinSlot` DATETIME NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_Bookings_1_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu` (
  `MenuID` INT NOT NULL,
  `Menucol` INT NULL,
  `Cuisine` VARCHAR(100) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(150) NULL,
  `Role` VARCHAR(150) NULL,
  `Salary` VARCHAR(150) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderId` INT NOT NULL,
  `TableNo` INT NULL,
  `MenuID` INT NULL,
  `BookingID` INT NULL,
  `BillAmount` DECIMAL(6,2) NULL,
  `Quantity` INT NULL,
  `StaffID` INT NULL,
  PRIMARY KEY (`OrderId`),
  INDEX `fk_Orders_1_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Orders_2_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_Orders_3_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_1`
    FOREIGN KEY (`BookingID`)
    REFERENCES `mydb`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_2`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_3`
    FOREIGN KEY (`StaffID`)
    REFERENCES `mydb`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderStatus` (
  `OrderStatusID` INT NOT NULL,
  `OrderId` INT NULL,
  `DeliveryDate` DATETIME NULL,
  `Status` VARCHAR(100) NULL,
  PRIMARY KEY (`OrderStatusID`),
  INDEX `fk_OrderStatus_1_idx` (`OrderId` ASC) VISIBLE,
  CONSTRAINT `fk_OrderStatus_1`
    FOREIGN KEY (`OrderId`)
    REFERENCES `mydb`.`Orders` (`OrderId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
