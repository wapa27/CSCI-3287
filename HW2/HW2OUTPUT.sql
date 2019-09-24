-- MySQL Script generated by MySQL Workbench
-- Tue 24 Sep 2019 05:48:41 PM MDT
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
-- Table `mydb`.`Customer_Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Customer_Info` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Customer_Info` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone1` INT NOT NULL,
  `Phone2` INT NULL,
  `CustomerZIP` INT NOT NULL,
  `CustomerCIty` VARCHAR(45) NOT NULL,
  `CustomerState` VARCHAR(16) NOT NULL,
  `Address1` VARCHAR(45) NOT NULL,
  `Address2` VARCHAR(45) NOT NULL,
  `ReferredBy` VARCHAR(45) NULL,
  `Mowing` TINYINT NOT NULL,
  `Landscaping` TINYINT NOT NULL,
  `Other` TINYINT NOT NULL,
  `CustomerNotes` VARCHAR(128) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer_Invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Customer_Invoice` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Customer_Invoice` (
  `InvoiceID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `InvoiceDate` DATE NOT NULL,
  `TotalAmountDueNow` DECIMAL(9,2) NOT NULL,
  `AmountRemitted` DECIMAL(9,2) NOT NULL,
  `TotalCustomerCharges` DECIMAL(9,2) NOT NULL,
  `TotalCustomerCredits` DECIMAL(9,2) NOT NULL,
  `PriorBalance` DECIMAL(9,2) NOT NULL,
  `TotalNewCharges` DECIMAL(9,2) NOT NULL,
  `Taxes` DECIMAL(9,2) NOT NULL,
  `TotalCredits` DECIMAL(9,2) NOT NULL,
  `TotalAmountDue` INT NOT NULL,
  PRIMARY KEY (`InvoiceID`),
  CONSTRAINT `fk_Customer_Invoice_Customer_Info1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customer_Info` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Customer_Invoice_Customer_Info1_idx` ON `mydb`.`Customer_Invoice` (`CustomerID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Services&MaterialsDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Services&MaterialsDetails` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Services&MaterialsDetails` (
  `ServiceID` INT NOT NULL,
  `InvoiceID` INT NOT NULL,
  `PurchaseDate` DATE NOT NULL,
  `Charges` DECIMAL(9,2) NOT NULL,
  `Credits` INT NOT NULL,
  `ServicesRendered` VARCHAR(512) NULL,
  `MaterialsDelivered` VARCHAR(512) NULL,
  PRIMARY KEY (`ServiceID`, `InvoiceID`),
  CONSTRAINT `fk_Services&MaterialsDetails_Customer_Invoice1`
    FOREIGN KEY (`InvoiceID`)
    REFERENCES `mydb`.`Customer_Invoice` (`InvoiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Services&MaterialsDetails_Customer_Invoice1_idx` ON `mydb`.`Services&MaterialsDetails` (`InvoiceID` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
