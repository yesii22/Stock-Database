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
-- Table `mydb`.`STOCK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`STOCK` (
  `StockSymbol` VARCHAR(5) NOT NULL,
  `StockName` VARCHAR(45) NULL DEFAULT NULL,
  `StockPrice` DECIMAL(20,2) NULL DEFAULT NULL,
  PRIMARY KEY (`StockSymbol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`COMPANY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`COMPANY` (
  `CompanyID` INT NOT NULL,
  `CompanyStockSymbol` VARCHAR(45) NOT NULL,
  `CompanyName` VARCHAR(45) NULL DEFAULT NULL,
  `CompanyAddress` VARCHAR(75) NULL DEFAULT NULL,
  PRIMARY KEY (`CompanyID`),
  INDEX `CompanyStockSymbol_idx` (`CompanyStockSymbol` ASC) VISIBLE,
  CONSTRAINT `CompanyStockSymbol`
    FOREIGN KEY (`CompanyStockSymbol`)
    REFERENCES `mydb`.`STOCK` (`StockSymbol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USER` (
  `UserID` INT NOT NULL,
  `UserFirstName` VARCHAR(45) NULL DEFAULT NULL,
  `UserLastName` VARCHAR(45) NULL DEFAULT NULL,
  `UserFullName` VARCHAR(90) GENERATED ALWAYS AS (concat(`UserFirstName`,_utf8mb3' ',`UserLastName`)) VIRTUAL,
  `Address` VARCHAR(75) NULL DEFAULT NULL,
  `BrokerBalance` DECIMAL(20,2) NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`MADEORDER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MADEORDER` (
  `OrderID` INT NOT NULL,
  `OrdererUserID` INT NOT NULL,
  `OrderedStockSymbol` VARCHAR(45) NOT NULL,
  `OrderedQuantity` INT NULL DEFAULT NULL,
  `OrderDate` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `StockSymbol_idx` (`OrderedStockSymbol` ASC) VISIBLE,
  INDEX `UserID_idx` (`OrdererUserID` ASC) VISIBLE,
  CONSTRAINT `OrderedStockSymbol`
    FOREIGN KEY (`OrderedStockSymbol`)
    REFERENCES `mydb`.`STOCK` (`StockSymbol`),
  CONSTRAINT `OrdererUserID`
    FOREIGN KEY (`OrdererUserID`)
    REFERENCES `mydb`.`USER` (`UserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
