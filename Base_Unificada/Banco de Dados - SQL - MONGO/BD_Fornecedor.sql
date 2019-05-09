-- MySQL Script generated by MySQL Workbench
-- qui 09 mai 2019 11:39:46 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema logic685_stagiopbd
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `logic685_stagiopbd` ;

-- -----------------------------------------------------
-- Schema logic685_stagiopbd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `logic685_stagiopbd` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `logic685_stagiopbd` ;

-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`supplier_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`supplier_type` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`supplier_type` (
  `spt_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `spt_name` VARCHAR(128) NOT NULL,
  `spt_created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `spt_updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`spt_id`),
  UNIQUE INDEX `nome` (`spt_name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`person` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`person` (
  `per_id` INT NOT NULL AUTO_INCREMENT,
  `per_name` VARCHAR(100) NOT NULL,
  `per_cnpjcpf` CHAR(14) NOT NULL,
  `per_address` VARCHAR(50) NULL,
  `per_number` INT(5) NULL,
  `per_complement` VARCHAR(15) NULL,
  `per_neighborhood` VARCHAR(45) NULL,
  `per_city` VARCHAR(45) NULL,
  `per_state` CHAR(2) NULL,
  `per_zipcode` CHAR(8) NULL,
  `per_country` VARCHAR(45) NULL,
  `per_phone_inter_code` CHAR(2) NULL,
  `per_phone_area_code` CHAR(3) NULL,
  `per_phone_number` CHAR(9) NULL,
  `per_email` VARCHAR(60) NULL,
  PRIMARY KEY (`per_id`),
  UNIQUE INDEX `ppl_cnpjcpf_UNIQUE` (`per_cnpjcpf` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`supplier` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`supplier` (
  `sup_id` INT NOT NULL AUTO_INCREMENT,
  `sup_fantasy_name` VARCHAR(100) NOT NULL,
  `sup_open_date` DATETIME NULL,
  `sup_spt_id` INT(10) UNSIGNED NOT NULL,
  `sup_created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sup_updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sup_deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `sup_ppl_id` INT NOT NULL,
  PRIMARY KEY (`sup_id`),
  INDEX `fk_tipo_fornecedor` (`sup_spt_id` ASC),
  INDEX `fk_supplier_people1_idx` (`sup_ppl_id` ASC),
  CONSTRAINT `fk_tipo_fornecedor`
    FOREIGN KEY (`sup_spt_id`)
    REFERENCES `logic685_stagiopbd`.`supplier_type` (`spt_id`),
  CONSTRAINT `fk_supplier_people1`
    FOREIGN KEY (`sup_ppl_id`)
    REFERENCES `logic685_stagiopbd`.`person` (`per_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`password_resets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`password_resets` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`password_resets` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_idx` (`email`(191) ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`users` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`therapeutic_class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`therapeutic_class` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`therapeutic_class` (
  `thc_id` INT NOT NULL AUTO_INCREMENT,
  `thc_descripition` VARCHAR(120) NULL,
  `thc_code` CHAR(5) NULL,
  PRIMARY KEY (`thc_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`product_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`product_type` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`product_type` (
  `pdt_id` INT NOT NULL AUTO_INCREMENT,
  `pdt_description` VARCHAR(30) NULL,
  PRIMARY KEY (`pdt_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`stripe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`stripe` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`stripe` (
  `stp_id` INT NOT NULL AUTO_INCREMENT,
  `stp_description` VARCHAR(15) NULL,
  PRIMARY KEY (`stp_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`medicine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`medicine` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`medicine` (
  `med_id` INT NOT NULL AUTO_INCREMENT,
  `med_active_principle` MEDIUMTEXT NULL,
  `med_code_ggrem` CHAR(15) NULL,
  `med_register` CHAR(13) NULL,
  `med_ean1` CHAR(14) NULL,
  `med_ean2` CHAR(14) NULL,
  `med_ean3` CHAR(14) NULL,
  `med_product_description` VARCHAR(120) NULL,
  `med_presentation` VARCHAR(200) NULL,
  `med_hospital_restrictions` TINYINT NULL,
  `med_cap` TINYINT NULL,
  `med_confaz87` TINYINT NULL,
  `med_marketing_year` INT(4) NULL,
  `med_sup_id` INT NOT NULL,
  `med_thc_id` INT NOT NULL,
  `med_pdt_id` INT NOT NULL,
  `med_stp_id` INT NOT NULL,
  PRIMARY KEY (`med_id`),
  INDEX `fk_medicine_supplier1_idx` (`med_sup_id` ASC),
  INDEX `fk_medicine_therapeutic_class1_idx` (`med_thc_id` ASC),
  INDEX `fk_medicine_product_type1_idx` (`med_pdt_id` ASC),
  INDEX `fk_medicine_stripe1_idx` (`med_stp_id` ASC),
  CONSTRAINT `fk_medicine_supplier1`
    FOREIGN KEY (`med_sup_id`)
    REFERENCES `logic685_stagiopbd`.`supplier` (`sup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicine_therapeutic_class1`
    FOREIGN KEY (`med_thc_id`)
    REFERENCES `logic685_stagiopbd`.`therapeutic_class` (`thc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicine_product_type1`
    FOREIGN KEY (`med_pdt_id`)
    REFERENCES `logic685_stagiopbd`.`product_type` (`pdt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicine_stripe1`
    FOREIGN KEY (`med_stp_id`)
    REFERENCES `logic685_stagiopbd`.`stripe` (`stp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`patient` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`patient` (
  `pat_cpf` VARCHAR(11) NOT NULL,
  `pat_name` VARCHAR(200) NOT NULL,
  `pat_gender` VARCHAR(1) NOT NULL,
  `pat_blood_type` VARCHAR(1) NOT NULL,
  `pat_birthdate` DATE NOT NULL,
  `per_id` INT NULL,
  PRIMARY KEY (`pat_cpf`),
  INDEX `fk_patient_people1_idx` (`per_id` ASC),
  CONSTRAINT `fk_patient_people1`
    FOREIGN KEY (`per_id`)
    REFERENCES `logic685_stagiopbd`.`person` (`per_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`physician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`physician` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`physician` (
  `phy_cpf` VARCHAR(11) NOT NULL,
  `phy_name` VARCHAR(200) NOT NULL,
  `phy_birthdate` DATE NOT NULL,
  `phy_gender` VARCHAR(1) NOT NULL,
  `phy_phone` VARCHAR(15) NULL,
  `per_id` INT NOT NULL,
  PRIMARY KEY (`phy_cpf`),
  INDEX `fk_physician_people1_idx` (`per_id` ASC),
  CONSTRAINT `fk_physician_people1`
    FOREIGN KEY (`per_id`)
    REFERENCES `logic685_stagiopbd`.`person` (`per_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`medical_speciality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`medical_speciality` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`medical_speciality` (
  `msp_code` INT NOT NULL,
  `msp_name` VARCHAR(127) NOT NULL,
  PRIMARY KEY (`msp_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`physician_speciality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`physician_speciality` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`physician_speciality` (
  `msp_code` INT NOT NULL,
  `phy_cpf` VARCHAR(11) NOT NULL,
  INDEX `fk_physician_speciality_medical_speciality1_idx` (`msp_code` ASC),
  CONSTRAINT `fk_physician_speciality_medical_speciality1`
    FOREIGN KEY (`msp_code`)
    REFERENCES `logic685_stagiopbd`.`medical_speciality` (`msp_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`allergy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`allergy` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`allergy` (
  `alg_id` INT NOT NULL,
  `med_active_principle` MEDIUMTEXT NULL,
  `alg_description` MEDIUMTEXT NOT NULL,
  `alg_classification` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`alg_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`patient_has_allergy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`patient_has_allergy` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`patient_has_allergy` (
  `pat_cpf` VARCHAR(11) NOT NULL,
  `alg_id` INT NOT NULL,
  `dgn_id` INT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`pat_cpf`, `alg_id`),
  INDEX `fk_patient_has_allergy_allergy1_idx` (`alg_id` ASC),
  INDEX `fk_patient_has_allergy_patient1_idx` (`pat_cpf` ASC),
  CONSTRAINT `fk_patient_has_allergy_patient1`
    FOREIGN KEY (`pat_cpf`)
    REFERENCES `logic685_stagiopbd`.`patient` (`pat_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_has_allergy_allergy1`
    FOREIGN KEY (`alg_id`)
    REFERENCES `logic685_stagiopbd`.`allergy` (`alg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`patient_health`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`patient_health` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`patient_health` (
  `pat_cpf` VARCHAR(11) NOT NULL,
  `phl_weight` FLOAT NOT NULL,
  `phl_height` FLOAT NOT NULL,
  `phl_imc` VARCHAR(50) NULL,
  `phl_smokeoften` VARCHAR(10) NOT NULL,
  `phl_drinkoften` VARCHAR(10) NOT NULL,
  `phl_trainingoften` VARCHAR(10) NOT NULL,
  INDEX `fk_patient_health_patient1_idx` (`pat_cpf` ASC),
  PRIMARY KEY (`pat_cpf`),
  CONSTRAINT `fk_patient_health_patient1`
    FOREIGN KEY (`pat_cpf`)
    REFERENCES `logic685_stagiopbd`.`patient` (`pat_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`hospital_sittuation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`hospital_sittuation` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`hospital_sittuation` (
  `sit_id` INT NOT NULL,
  `sit_description` VARCHAR(45) NULL,
  `sit_bedroom` VARCHAR(45) NULL,
  `sit_physician` VARCHAR(45) NULL,
  `sit_available` VARCHAR(45) NULL,
  PRIMARY KEY (`sit_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`hospital` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`hospital` (
  `hsp_id` INT NOT NULL,
  `hsp_cnpj` VARCHAR(20) NOT NULL,
  `hsp_name` VARCHAR(100) NOT NULL,
  `hsp_address` VARCHAR(200) NOT NULL,
  `hsp_phone` VARCHAR(30) NOT NULL,
  `per_id` INT NULL,
  `sit_id` INT NULL,
  PRIMARY KEY (`hsp_id`),
  INDEX `fk_hospital_hospital_sittuation1_idx` (`sit_id` ASC),
  INDEX `fk_hospital_person1_idx` (`per_id` ASC),
  CONSTRAINT `fk_hospital_hospital_sittuation1`
    FOREIGN KEY (`sit_id`)
    REFERENCES `logic685_stagiopbd`.`hospital_sittuation` (`sit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hospital_person1`
    FOREIGN KEY (`per_id`)
    REFERENCES `logic685_stagiopbd`.`person` (`per_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`hospital_wing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`hospital_wing` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`hospital_wing` (
  `wng_id` INT NOT NULL,
  `wng_type` VARCHAR(45) NULL,
  `msp_code` INT NOT NULL,
  `sit_id` INT NOT NULL,
  `hsp_id` INT NOT NULL,
  PRIMARY KEY (`wng_id`),
  INDEX `fk_hospital_wing_medical_speciality1_idx` (`msp_code` ASC),
  INDEX `fk_hospital_wing_hospital_sittuation1_idx` (`sit_id` ASC),
  INDEX `fk_hospital_wing_hospital1_idx` (`hsp_id` ASC),
  CONSTRAINT `fk_hospital_wing_medical_speciality1`
    FOREIGN KEY (`msp_code`)
    REFERENCES `logic685_stagiopbd`.`medical_speciality` (`msp_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hospital_wing_hospital_sittuation1`
    FOREIGN KEY (`sit_id`)
    REFERENCES `logic685_stagiopbd`.`hospital_sittuation` (`sit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hospital_wing_hospital1`
    FOREIGN KEY (`hsp_id`)
    REFERENCES `logic685_stagiopbd`.`hospital` (`hsp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`bedroom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`bedroom` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`bedroom` (
  `bed_id` INT NOT NULL,
  `wng_id` INT NOT NULL,
  `pat_cpf` VARCHAR(11) NULL,
  PRIMARY KEY (`bed_id`),
  INDEX `fk_bedroom_hospital_wing1_idx` (`wng_id` ASC),
  INDEX `fk_bedroom_patient_health1_idx` (`pat_cpf` ASC),
  CONSTRAINT `fk_bedroom_hospital_wing1`
    FOREIGN KEY (`wng_id`)
    REFERENCES `logic685_stagiopbd`.`hospital_wing` (`wng_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bedroom_patient_health1`
    FOREIGN KEY (`pat_cpf`)
    REFERENCES `logic685_stagiopbd`.`patient_health` (`pat_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`exam_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`exam_request` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`exam_request` (
  `exr_id` INT NOT NULL AUTO_INCREMENT,
  `exr_phy_cpf` VARCHAR(11) NOT NULL,
  `exr_pat_cpf` VARCHAR(11) NOT NULL,
  `exr_sup_id` INT NOT NULL,
  `exr_hsp_id` INT NOT NULL,
  `exr_date_request` DATETIME NULL,
  `exr_date_forecast_release` DATETIME NULL,
  `exr_date_delivery` DATETIME NULL,
  `exr_urgency` TINYINT NULL COMMENT '1-Yes\n2-No',
  PRIMARY KEY (`exr_id`),
  INDEX `fk_exam_request_physician1_idx` (`exr_phy_cpf` ASC),
  INDEX `fk_exam_request_patient1_idx` (`exr_pat_cpf` ASC),
  INDEX `fk_exam_request_supplier1_idx` (`exr_sup_id` ASC),
  INDEX `fk_exam_request_hospital1_idx` (`exr_hsp_id` ASC),
  CONSTRAINT `fk_exam_request_physician1`
    FOREIGN KEY (`exr_phy_cpf`)
    REFERENCES `logic685_stagiopbd`.`physician` (`phy_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_request_patient1`
    FOREIGN KEY (`exr_pat_cpf`)
    REFERENCES `logic685_stagiopbd`.`patient` (`pat_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_request_supplier1`
    FOREIGN KEY (`exr_sup_id`)
    REFERENCES `logic685_stagiopbd`.`supplier` (`sup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_request_hospital1`
    FOREIGN KEY (`exr_hsp_id`)
    REFERENCES `logic685_stagiopbd`.`hospital` (`hsp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`exam_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`exam_group` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`exam_group` (
  `exg_id` INT NOT NULL AUTO_INCREMENT,
  `exg_name` VARCHAR(45) NULL,
  PRIMARY KEY (`exg_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`exam_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`exam_item` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`exam_item` (
  `exi_id` INT NOT NULL AUTO_INCREMENT,
  `exi_name` VARCHAR(45) NULL,
  PRIMARY KEY (`exi_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`exam_subitem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`exam_subitem` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`exam_subitem` (
  `exs_id` INT NOT NULL AUTO_INCREMENT,
  `exs_name` VARCHAR(45) NULL,
  `exs_exi_id` INT NOT NULL,
  PRIMARY KEY (`exs_id`),
  INDEX `fk_exam_subitem_exam_item1_idx` (`exs_exi_id` ASC),
  CONSTRAINT `fk_exam_subitem_exam_item1`
    FOREIGN KEY (`exs_exi_id`)
    REFERENCES `logic685_stagiopbd`.`exam_item` (`exi_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`exam_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`exam_type` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`exam_type` (
  `ext_id` INT NOT NULL AUTO_INCREMENT,
  `ext_exg_id` INT NOT NULL,
  `ext_exs_id` INT NOT NULL,
  `ext_code` CHAR(15) NULL,
  `ext_description` VARCHAR(100) NULL,
  `ext_technical` VARCHAR(45) NULL,
  `ext_indication` VARCHAR(45) NULL,
  `ext_details` TINYTEXT NULL,
  `ext_paraminitial` FLOAT NULL,
  `ext_paramfinal` FLOAT NULL,
  PRIMARY KEY (`ext_id`),
  INDEX `fk_exam_type_exam_group1_idx` (`ext_exg_id` ASC),
  INDEX `fk_exam_type_exam_subitem1_idx` (`ext_exs_id` ASC),
  CONSTRAINT `fk_exam_type_exam_group1`
    FOREIGN KEY (`ext_exg_id`)
    REFERENCES `logic685_stagiopbd`.`exam_group` (`exg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_type_exam_subitem1`
    FOREIGN KEY (`ext_exs_id`)
    REFERENCES `logic685_stagiopbd`.`exam_subitem` (`exs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`responsible_technician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`responsible_technician` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`responsible_technician` (
  `rpt_id` INT NOT NULL AUTO_INCREMENT,
  `rpt_birthdate` DATE NOT NULL,
  `rpt_gender` VARCHAR(1) NOT NULL,
  `rpt_per_id` INT NOT NULL,
  PRIMARY KEY (`rpt_id`),
  INDEX `fk_physician_people1_idx` (`rpt_per_id` ASC),
  CONSTRAINT `fk_physician_people10`
    FOREIGN KEY (`rpt_per_id`)
    REFERENCES `logic685_stagiopbd`.`person` (`per_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logic685_stagiopbd`.`exam_request_has_exam_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logic685_stagiopbd`.`exam_request_has_exam_type` ;

CREATE TABLE IF NOT EXISTS `logic685_stagiopbd`.`exam_request_has_exam_type` (
  `ert_exr_id` INT NOT NULL,
  `ert_ext_id` INT NOT NULL,
  `ert_measurement` FLOAT NULL,
  `ert_collect_date` DATETIME NULL,
  `ert_rpt_id` INT NOT NULL,
  PRIMARY KEY (`ert_exr_id`, `ert_ext_id`),
  INDEX `fk_exam_request_has_exam_type_exam_type1_idx` (`ert_ext_id` ASC),
  INDEX `fk_exam_request_has_exam_type_exam_request1_idx` (`ert_exr_id` ASC),
  INDEX `fk_exam_request_has_exam_type_responsible_technician1_idx` (`ert_rpt_id` ASC),
  CONSTRAINT `fk_exam_request_has_exam_type_exam_request1`
    FOREIGN KEY (`ert_exr_id`)
    REFERENCES `logic685_stagiopbd`.`exam_request` (`exr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_request_has_exam_type_exam_type1`
    FOREIGN KEY (`ert_ext_id`)
    REFERENCES `logic685_stagiopbd`.`exam_type` (`ext_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_request_has_exam_type_responsible_technician1`
    FOREIGN KEY (`ert_rpt_id`)
    REFERENCES `logic685_stagiopbd`.`responsible_technician` (`rpt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
