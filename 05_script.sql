-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eugene
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eugene
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eugene` DEFAULT CHARACTER SET utf8mb3 ;
USE `eugene` ;

-- -----------------------------------------------------
-- Table `eugene`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eugene`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `eugene`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eugene`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NULL,
  `count` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `eugene`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `eugene`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eugene`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eugene`.`order_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eugene`.`order_list` (
  `order_id` INT NOT NULL,
  `custumer_id` INT NULL,
  `order_date` DATETIME NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_sale_order_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_sales_customer_idx` (`custumer_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `eugene`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_customer`
    FOREIGN KEY (`custumer_id`)
    REFERENCES `eugene`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
