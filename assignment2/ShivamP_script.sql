-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema assignment_2_multiple
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assignment_2_multiple
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assignment_2_multiple` DEFAULT CHARACTER SET utf8 COLLATE utf8_icelandic_ci ;
USE `assignment_2_multiple` ;

-- -----------------------------------------------------
-- Table `assignment_2_multiple`.`Dim_Coustumer_ShivamP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment_2_multiple`.`Dim_Coustumer_ShivamP` (
  `coustumer_id` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `Licence_number` VARCHAR(45) NULL,
  `Licence_issuing_date` DATETIME NULL,
  `Licence_expiring_date` DATETIME NULL,
  `coustumer_photo` VARCHAR(45) NULL,
  `coustumer_date_of birth` DATETIME NULL,
  `Dim_Coustumer_ShivamPcol` VARCHAR(45) NULL,
  PRIMARY KEY (`coustumer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment_2_multiple`.`Dim_Car_ShivamP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment_2_multiple`.`Dim_Car_ShivamP` (
  `Licence_plate_Number` VARCHAR(45) NULL,
  `car_id` INT NOT NULL,
  `car_issuing_country` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `car_photos` VARCHAR(45) NULL,
  `Location_of_car` VARCHAR(45) NULL,
  `year_of manufacturing` INT NULL,
  `make` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `transmission` VARCHAR(45) NULL,
  `colour` VARCHAR(45) NULL,
  `odometer` VARCHAR(45) NULL,
  `features` VARCHAR(45) NULL,
  `car_discription` VARCHAR(45) NULL,
  `car_avalibility_details` VARCHAR(45) NULL,
  `car_usage_instructions` VARCHAR(45) NULL,
  `car_type` VARCHAR(45) NULL,
  UNIQUE INDEX `Licence_plate_Number_UNIQUE` (`Licence_plate_Number` ASC),
  PRIMARY KEY (`car_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment_2_multiple`.`Dim_Location_ShivamP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment_2_multiple`.`Dim_Location_ShivamP` (
  `location_id` INT NOT NULL,
  `zipcode` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `Region` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment_2_multiple`.`Dim_Time_ShivamP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment_2_multiple`.`Dim_Time_ShivamP` (
  `date_key` DATETIME NOT NULL,
  `day_number` INT NULL,
  `month_number` INT NULL,
  `month_name` VARCHAR(45) NULL,
  `other_details` VARCHAR(45) NULL,
  PRIMARY KEY (`date_key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment_2_multiple`.`Fact_Turo_Rental_Services_ShivamP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment_2_multiple`.`Fact_Turo_Rental_Services_ShivamP` (
  `rental_id` INT NOT NULL,
  `car_reservation_date_time` DATETIME NULL,
  `car_dilivery_date_time` DATETIME NULL,
  `car_return_date_time` DATETIME NULL,
  `coustumer_key` INT NULL,
  `car_key` INT NULL,
  `owner_id` INT NULL,
  `guest_id` INT NULL,
  `location_id` INT NULL,
  `transaction_amount` INT NULL,
  `number_of_trips_of_car` INT NULL,
  `number_of_days_of_trip` INT NULL,
  `extended_days_of_trip` INT NULL,
  `total_amout_paid_by_coustumer` INT NULL,
  `owner_share` INT NULL,
  `tax_charge` INT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `owner_id_idx` (`owner_id` ASC),
  INDEX `guest_id_idx` (`guest_id` ASC),
  INDEX `coustomer_key_idx` (`coustumer_key` ASC),
  INDEX `car_key_idx` (`car_key` ASC),
  INDEX `location_id_idx` (`location_id` ASC),
  INDEX `car_reservation_date_idx` (`car_reservation_date_time` ASC),
  INDEX `car_return_date_tiem_idx` (`car_return_date_time` ASC),
  INDEX `car_delivery_date_time_idx` (`car_dilivery_date_time` ASC),
  CONSTRAINT `owner_id`
    FOREIGN KEY (`owner_id`)
    REFERENCES `assignment_2_multiple`.`Dim_Coustumer_ShivamP` (`coustumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `guest_id`
    FOREIGN KEY (`guest_id`)
    REFERENCES `assignment_2_multiple`.`Dim_Coustumer_ShivamP` (`coustumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `coustomer_key`
    FOREIGN KEY (`coustumer_key`)
    REFERENCES `assignment_2_multiple`.`Dim_Coustumer_ShivamP` (`coustumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `car_key`
    FOREIGN KEY (`car_key`)
    REFERENCES `assignment_2_multiple`.`Dim_Car_ShivamP` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `assignment_2_multiple`.`Dim_Location_ShivamP` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `car_reservation_date`
    FOREIGN KEY (`car_reservation_date_time`)
    REFERENCES `assignment_2_multiple`.`Dim_Time_ShivamP` (`date_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `car_return_date_tiem`
    FOREIGN KEY (`car_return_date_time`)
    REFERENCES `assignment_2_multiple`.`Dim_Time_ShivamP` (`date_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `car_delivery_date_time`
    FOREIGN KEY (`car_dilivery_date_time`)
    REFERENCES `assignment_2_multiple`.`Dim_Time_ShivamP` (`date_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment_2_multiple`.`Dim_Review_ShivamP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment_2_multiple`.`Dim_Review_ShivamP` (
  `review_id` INT NOT NULL,
  `review_discreption` VARCHAR(45) NULL,
  `review_for_car_owner_or_both` VARCHAR(45) NULL,
  `review_inserted_date` DATETIME NULL COMMENT 'Slowly changing Type 2 dimension ',
  `latest_review` INT NULL COMMENT '1 value is for the latest review.',
  `review_surrogate_key` INT NOT NULL,
  PRIMARY KEY (`review_surrogate_key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment_2_multiple`.`fact_review_ShivamP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment_2_multiple`.`fact_review_ShivamP` (
  `coustomer_key_review` INT NULL,
  `fact_review_id` INT NOT NULL,
  `guest_key` INT NULL,
  `owner_key` INT NULL,
  `number_of_reviews` INT NULL,
  `rating_of_trip_out_of_5` INT NULL,
  `car_key_review` INT NULL,
  `review_key` INT NULL,
  `review_date` DATETIME NULL,
  `review_month` INT NULL,
  PRIMARY KEY (`fact_review_id`),
  INDEX `coustomer_key_idx` (`coustomer_key_review` ASC),
  INDEX `guest_key_idx` (`guest_key` ASC),
  INDEX `owner_key_idx` (`owner_key` ASC),
  INDEX `car_key_review_idx` (`car_key_review` ASC),
  INDEX `review_key_idx` (`review_key` ASC),
  INDEX `review_date_idx` (`review_date` ASC),
  CONSTRAINT `coustomer_key_review`
    FOREIGN KEY (`coustomer_key_review`)
    REFERENCES `assignment_2_multiple`.`Dim_Coustumer_ShivamP` (`coustumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `guest_key`
    FOREIGN KEY (`guest_key`)
    REFERENCES `assignment_2_multiple`.`Dim_Coustumer_ShivamP` (`coustumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `owner_key`
    FOREIGN KEY (`owner_key`)
    REFERENCES `assignment_2_multiple`.`Dim_Coustumer_ShivamP` (`coustumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `car_key_review`
    FOREIGN KEY (`car_key_review`)
    REFERENCES `assignment_2_multiple`.`Dim_Car_ShivamP` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `review_key`
    FOREIGN KEY (`review_key`)
    REFERENCES `assignment_2_multiple`.`Dim_Review_ShivamP` (`review_surrogate_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `review_date`
    FOREIGN KEY (`review_date`)
    REFERENCES `assignment_2_multiple`.`Dim_Time_ShivamP` (`date_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
