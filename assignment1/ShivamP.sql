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
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`manufacturer_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`manufacturer_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`manufacturer_ShivamP` (
  `manufacturer_code` INT NOT NULL,
  `manufacturer_name` VARCHAR(45) NULL,
  `manufacturer_details` VARCHAR(45) NULL,
  PRIMARY KEY (`manufacturer_code`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`car_model_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`car_model_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`car_model_ShivamP` (
  `model_name` VARCHAR(45) NULL,
  `model_hire_rate` INT NULL,
  `car_model_id` INT NOT NULL,
  `transmissian` VARCHAR(45) NULL,
  CONSTRAINT `manufacturer_code`
    FOREIGN KEY (`car_model_id`)
    REFERENCES `mydb`.`manufacturer_ShivamP` (`manufacturer_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`catagory_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`catagory_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`catagory_ShivamP` (
  `catagory_id` INT NOT NULL,
  `catagory_name` VARCHAR(45) NULL,
  PRIMARY KEY (`catagory_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Car_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Car_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Car_ShivamP` (
  `licence_plate_number` INT NOT NULL,
  `number of seats` INT NOT NULL,
  `total trips` INT NULL,
  `ratings` INT NULL,
  `car_name` VARCHAR(45) NULL,
  `pics_id` VARCHAR(10) NOT NULL,
  `feature_id` INT NOT NULL,
  `Guidelines` VARCHAR(1000) NULL,
  `milage` INT NULL,
  `status` VARCHAR(10) NULL,
  `car_model_id` INT NOT NULL,
  `issuing_country` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `car_avaliability_discription` VARCHAR(150) NULL,
  `color` VARCHAR(45) NULL,
  `distance_included` INT NULL,
  `avalibility_notice_period` DATETIME NULL,
  `Shortest_possible_ride` INT NULL,
  `Longest_possible_ride` INT NULL,
  `catagory_car_id` INT NOT NULL,
  PRIMARY KEY (`licence_plate_number`, `catagory_car_id`),
  INDEX `car_model_id_idx` (`car_model_id` ASC),
  INDEX `catagory_car_id_idx` (`catagory_car_id` ASC),
  UNIQUE INDEX `pics_id_UNIQUE` (`pics_id` ASC),
  UNIQUE INDEX `feature_id_UNIQUE` (`feature_id` ASC),
  CONSTRAINT `car_model_id`
    FOREIGN KEY (`car_model_id`)
    REFERENCES `mydb`.`car_model_ShivamP` (`car_model_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `catagory_car_id`
    FOREIGN KEY (`catagory_car_id`)
    REFERENCES `mydb`.`catagory_ShivamP` (`catagory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`customer_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`customer_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`customer_ShivamP` (
  `customer_id` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `birth_date` DATE NULL,
  `driving_licence_number` VARCHAR(45) NOT NULL,
  `phone_number` INT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `driving_licence_number_UNIQUE` (`driving_licence_number` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Reviews_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Reviews_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Reviews_ShivamP` (
  `review_id` INT NOT NULL,
  `reviewer_fname` VARCHAR(45) NULL,
  `reviewer_lname` VARCHAR(45) NULL,
  `review_description` VARCHAR(45) NULL,
  `coustumer_id` INT NOT NULL,
  PRIMARY KEY (`review_id`, `coustumer_id`),
  INDEX `coustumer_id_idx` (`coustumer_id` ASC),
  UNIQUE INDEX `coustumer_id_UNIQUE` (`coustumer_id` ASC),
  CONSTRAINT `coustumer_id`
    FOREIGN KEY (`coustumer_id`)
    REFERENCES `mydb`.`customer_ShivamP` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`city_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`city_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`city_ShivamP` (
  `city_id` INT NOT NULL,
  `city_name` VARCHAR(45) NULL,
  `state_name` VARCHAR(45) NULL,
  PRIMARY KEY (`city_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`location_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`location_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`location_ShivamP` (
  `location_id` INT NOT NULL,
  `city_id` INT NOT NULL,
  `adress` VARCHAR(100) NULL,
  `zipcode` INT NULL,
  PRIMARY KEY (`location_id`, `city_id`),
  INDEX `city_id_idx` (`city_id` ASC),
  CONSTRAINT `city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `mydb`.`city_ShivamP` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`offer_details_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`offer_details_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`offer_details_ShivamP` (
  `promo_type` VARCHAR(45) NOT NULL,
  `percentage` INT NULL,
  `first_time_only` VARCHAR(10) NULL,
  `discount_amount` INT NULL,
  `status` VARCHAR(45) NULL,
  `promo_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`promo_code`, `promo_type`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`payment_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`payment_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`payment_ShivamP` (
  `payment_id` INT NOT NULL,
  `amount_paid` INT NULL,
  `card_number` INT NULL,
  `expiry_date` DATE NULL,
  `name_of_card` VARCHAR(45) NULL,
  `CVV` INT NULL,
  `billing_adress` VARCHAR(45) NULL,
  `reservation_id` INT NULL,
  `saved_card_number` INT NULL,
  `paid_by_cash` INT NULL,
  `share` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`, `user_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`booking_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`booking_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`booking_ShivamP` (
  `booking_id` INT NOT NULL,
  `pick_up_location_id` INT NOT NULL,
  `drop_off_location_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `rental_amount` INT NULL,
  `additional_amount` INT NULL,
  `total_ammount` INT NULL,
  `penalty_amount` INT NULL,
  `promo_code` VARCHAR(45) NOT NULL,
  `car_pick_up_or_dilivery` VARCHAR(10) NULL,
  `dilivery_charge` INT NULL,
  `start_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  `actual_end_time` DATETIME NULL,
  `payment_id` INT NOT NULL,
  `car_booking_id` INT NOT NULL,
  `catagory_booking_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`, `pick_up_location_id`, `drop_off_location_id`, `customer_id`, `payment_id`, `catagory_booking_id`, `car_booking_id`),
  INDEX `pick_up_location_id_idx` (`pick_up_location_id` ASC),
  INDEX `customer_id_idx` (`customer_id` ASC),
  UNIQUE INDEX `promocode_UNIQUE` (`promo_code` ASC),
  INDEX `payment_id_idx` (`payment_id` ASC),
  INDEX `drop_off_location_id_idx` (`drop_off_location_id` ASC),
  UNIQUE INDEX `payment_id_UNIQUE` (`payment_id` ASC),
  UNIQUE INDEX `car_id_UNIQUE` (`car_booking_id` ASC),
  INDEX `catagory_booking_id_idx` (`catagory_booking_id` ASC),
  CONSTRAINT `pick_up_location_id`
    FOREIGN KEY (`pick_up_location_id`)
    REFERENCES `mydb`.`location_ShivamP` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `drop_off_location_id`
    FOREIGN KEY (`drop_off_location_id`)
    REFERENCES `mydb`.`location_ShivamP` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customer_ShivamP` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `promo_code`
    FOREIGN KEY (`promo_code`)
    REFERENCES `mydb`.`offer_details_ShivamP` (`promo_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `payment_id`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment_ShivamP` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `catagory_booking_id`
    FOREIGN KEY (`catagory_booking_id`)
    REFERENCES `mydb`.`catagory_ShivamP` (`catagory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `car_booking_id`
    FOREIGN KEY (`car_booking_id`)
    REFERENCES `mydb`.`Car_ShivamP` (`licence_plate_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`owner_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`owner_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`owner_ShivamP` (
  `owner_id` INT NOT NULL,
  `car_number` INT NULL,
  `coustumer_owner_id` INT NOT NULL,
  `responce_time` DATETIME NULL,
  `response_rate` INT NULL,
  `owner_pics` BLOB NULL,
  PRIMARY KEY (`owner_id`, `coustumer_owner_id`),
  INDEX `coustumer_id_idx` (`coustumer_owner_id` ASC),
  CONSTRAINT `coustumer_owner_id`
    FOREIGN KEY (`coustumer_owner_id`)
    REFERENCES `mydb`.`customer_ShivamP` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`rental_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`rental_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`rental_ShivamP` (
  `rental_id` INT NOT NULL,
  `owner_rental_id` INT NOT NULL,
  `car_rental_id` INT NOT NULL,
  `rental_pick_up_location_id` INT NOT NULL,
  `rental_drop_off_location_id` INT NOT NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `instructions` VARCHAR(1000) NULL,
  `payment_rental_id` INT NOT NULL,
  `pick_up_hour` DATETIME NULL,
  `return_hour` DATETIME NULL,
  `airpot_dilivery` VARCHAR(45) NULL,
  PRIMARY KEY (`rental_id`, `car_rental_id`, `rental_drop_off_location_id`, `rental_pick_up_location_id`, `owner_rental_id`, `payment_rental_id`),
  INDEX `pick_up_location_id_idx` (`rental_pick_up_location_id` ASC),
  INDEX `drop_off_location_id_idx` (`rental_drop_off_location_id` ASC),
  INDEX `car_id_idx` (`car_rental_id` ASC),
  INDEX `payment_id_idx` (`payment_rental_id` ASC),
  UNIQUE INDEX `owner_id_UNIQUE` (`owner_rental_id` ASC),
  UNIQUE INDEX `car_id_UNIQUE` (`car_rental_id` ASC),
  UNIQUE INDEX `pick_up_location_id_UNIQUE` (`rental_pick_up_location_id` ASC),
  UNIQUE INDEX `drop_off_location_id_UNIQUE` (`rental_drop_off_location_id` ASC),
  UNIQUE INDEX `payment_id_UNIQUE` (`payment_rental_id` ASC),
  CONSTRAINT `rental_pick_up_location_id`
    FOREIGN KEY (`rental_pick_up_location_id`)
    REFERENCES `mydb`.`location_ShivamP` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rental_drop_off_location_id`
    FOREIGN KEY (`rental_drop_off_location_id`)
    REFERENCES `mydb`.`location_ShivamP` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `car_rental_id`
    FOREIGN KEY (`car_rental_id`)
    REFERENCES `mydb`.`Car_ShivamP` (`licence_plate_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `payment_rental_id`
    FOREIGN KEY (`payment_rental_id`)
    REFERENCES `mydb`.`payment_ShivamP` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `owner_rental_id`
    FOREIGN KEY (`owner_rental_id`)
    REFERENCES `mydb`.`owner_ShivamP` (`owner_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`insurance_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`insurance_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`insurance_ShivamP` (
  `insurance_id` INT NOT NULL,
  `insurance_name` VARCHAR(45) NULL,
  `insurance_Discription` TEXT(100) NULL,
  `insurance_coverage` VARCHAR(45) NULL,
  PRIMARY KEY (`insurance_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`insurance_has_rental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`insurance_has_rental` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`insurance_has_rental` (
  `insurance_ShivamP_insurance_id` INT NOT NULL,
  `rental_ShivamP_rental_id` INT NOT NULL,
  PRIMARY KEY (`insurance_ShivamP_insurance_id`, `rental_ShivamP_rental_id`),
  INDEX `fk_insurance_ShivamP_has_rental_ShivamP_rental_ShivamP1_idx` (`rental_ShivamP_rental_id` ASC),
  INDEX `fk_insurance_ShivamP_has_rental_ShivamP_insurance_ShivamP1_idx` (`insurance_ShivamP_insurance_id` ASC),
  CONSTRAINT `fk_insurance_ShivamP_has_rental_ShivamP_insurance_ShivamP1`
    FOREIGN KEY (`insurance_ShivamP_insurance_id`)
    REFERENCES `mydb`.`insurance_ShivamP` (`insurance_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insurance_ShivamP_has_rental_ShivamP_rental_ShivamP1`
    FOREIGN KEY (`rental_ShivamP_rental_id`)
    REFERENCES `mydb`.`rental_ShivamP` (`rental_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`card_details_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`card_details_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`card_details_ShivamP` (
  `name_on_card` VARCHAR(45) NULL,
  `card_number` INT NULL,
  `expiry_date` DATE NULL,
  `billing_address` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`users_details_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users_details_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`users_details_ShivamP` (
  `login_id` INT NOT NULL,
  `password` VARCHAR(45) NULL,
  `licence_no` VARCHAR(45) NOT NULL,
  `membership_type` VARCHAR(45) NULL,
  `membership_price` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`login_id`, `user_id`),
  UNIQUE INDEX `licence_no_UNIQUE` (`licence_no` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `login_id`
    FOREIGN KEY (`login_id`)
    REFERENCES `mydb`.`customer_ShivamP` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`card_details_ShivamP` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`users_details_ShivamP_pays_payment_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users_details_ShivamP_pays_payment_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`users_details_ShivamP_pays_payment_ShivamP` (
  `payment_ShivamP_payment_id` INT NOT NULL,
  `payment_ShivamP_user_id` INT NOT NULL,
  `users_details_ShivamP_login_id` INT NOT NULL,
  `users_details_ShivamP_user_id` INT NOT NULL,
  `users_details_ShivamP_card_id` INT NOT NULL,
  PRIMARY KEY (`payment_ShivamP_payment_id`, `payment_ShivamP_user_id`, `users_details_ShivamP_login_id`, `users_details_ShivamP_user_id`, `users_details_ShivamP_card_id`),
  INDEX `fk_payment_ShivamP_has_users_details_ShivamP_users_details__idx` (`users_details_ShivamP_login_id` ASC, `users_details_ShivamP_user_id` ASC, `users_details_ShivamP_card_id` ASC),
  INDEX `fk_payment_ShivamP_has_users_details_ShivamP_payment_Shivam_idx` (`payment_ShivamP_payment_id` ASC, `payment_ShivamP_user_id` ASC),
  CONSTRAINT `fk_payment_ShivamP_has_users_details_ShivamP_payment_ShivamP1`
    FOREIGN KEY (`payment_ShivamP_payment_id` , `payment_ShivamP_user_id`)
    REFERENCES `mydb`.`payment_ShivamP` (`payment_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_ShivamP_has_users_details_ShivamP_users_details_Sh1`
    FOREIGN KEY (`users_details_ShivamP_login_id` , `users_details_ShivamP_user_id`)
    REFERENCES `mydb`.`users_details_ShivamP` (`login_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`feature_ShivamP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`feature_ShivamP` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`feature_ShivamP` (
  `features_id` INT NOT NULL,
  `freture_name` VARCHAR(45) NULL,
  PRIMARY KEY (`features_id`),
  CONSTRAINT `features_id`
    FOREIGN KEY (`features_id`)
    REFERENCES `mydb`.`Car_ShivamP` (`feature_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`picture_Shivamp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`picture_Shivamp` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`picture_Shivamp` (
  `picture_id` VARCHAR(10) NOT NULL,
  `picture` BLOB NULL,
  PRIMARY KEY (`picture_id`),
  CONSTRAINT `picture_id`
    FOREIGN KEY (`picture_id`)
    REFERENCES `mydb`.`Car_ShivamP` (`pics_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
