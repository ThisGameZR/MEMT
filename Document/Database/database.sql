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
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Position` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `DepartmentId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Position_Department1_idx` (`DepartmentId` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Position_Department1`
    FOREIGN KEY (`DepartmentId`)
    REFERENCES `mydb`.`Department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Role` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` NVARCHAR(50) NOT NULL,
  `lastName` NVARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `positionId` INT UNSIGNED NOT NULL,
  `roleId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Employee_Position_idx` (`positionId` ASC) VISIBLE,
  INDEX `fk_Employee_Role1_idx` (`roleId` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Position`
    FOREIGN KEY (`positionId`)
    REFERENCES `mydb`.`Position` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Role1`
    FOREIGN KEY (`roleId`)
    REFERENCES `mydb`.`Role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mood` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EmployeeMood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EmployeeMood` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `employeeId` INT UNSIGNED NOT NULL,
  `moodId` INT UNSIGNED NOT NULL,
  `feeling` VARCHAR(255) NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_EmployeeMood_Employee1_idx` (`employeeId` ASC) VISIBLE,
  INDEX `fk_EmployeeMood_Mood1_idx` (`moodId` ASC) VISIBLE,
  CONSTRAINT `fk_EmployeeMood_Employee1`
    FOREIGN KEY (`employeeId`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EmployeeMood_Mood1`
    FOREIGN KEY (`moodId`)
    REFERENCES `mydb`.`Mood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Question` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Answer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `answer` INT NOT NULL,
  `answererId` INT UNSIGNED NOT NULL,
  `questionId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Answer_Question1_idx` (`questionId` ASC) VISIBLE,
  INDEX `fk_Answer_Employee1_idx` (`answererId` ASC) VISIBLE,
  CONSTRAINT `fk_Answer_Question1`
    FOREIGN KEY (`questionId`)
    REFERENCES `mydb`.`Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Answer_Employee1`
    FOREIGN KEY (`answererId`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Choice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Choice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `answer` VARCHAR(255) NOT NULL,
  `questionId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Choice_Question1_idx` (`questionId` ASC) VISIBLE,
  CONSTRAINT `fk_Choice_Question1`
    FOREIGN KEY (`questionId`)
    REFERENCES `mydb`.`Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Suggestion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Suggestion` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `suggestion` VARCHAR(500) NOT NULL,
  `solution` VARCHAR(500) NOT NULL,
  `creatorId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Suggestion_Employee1_idx` (`creatorId` ASC) VISIBLE,
  CONSTRAINT `fk_Suggestion_Employee1`
    FOREIGN KEY (`creatorId`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SuggestionReceiver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SuggestionReceiver` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `suggestionId` INT UNSIGNED NOT NULL,
  `receiverId` INT UNSIGNED NOT NULL,
  `createdAt` DATETIME NOT NULL,
  INDEX `fk_SuggestionReceiver_Suggestion1_idx` (`suggestionId` ASC) VISIBLE,
  INDEX `fk_SuggestionReceiver_Employee1_idx` (`receiverId` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_SuggestionReceiver_Suggestion1`
    FOREIGN KEY (`suggestionId`)
    REFERENCES `mydb`.`Suggestion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SuggestionReceiver_Employee1`
    FOREIGN KEY (`receiverId`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`QuestionSession`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`QuestionSession` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `questionId` INT UNSIGNED NOT NULL,
  `questionerId` INT UNSIGNED NOT NULL,
  `createdAt` DATETIME NOT NULL,
  INDEX `fk_QuestionSession_Question1_idx` (`questionId` ASC) VISIBLE,
  INDEX `fk_QuestionSession_Employee1_idx` (`questionerId` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_QuestionSession_Question1`
    FOREIGN KEY (`questionId`)
    REFERENCES `mydb`.`Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_QuestionSession_Employee1`
    FOREIGN KEY (`questionerId`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Notification` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `seenYet` BIT NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL,
  `receiverId` INT UNSIGNED NOT NULL,
  `suggestionReceiverId` INT UNSIGNED NULL,
  `questionSessionId` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Notification_Employee1_idx` (`receiverId` ASC) VISIBLE,
  INDEX `fk_Notification_SuggestionReceiver1_idx` (`suggestionReceiverId` ASC) VISIBLE,
  INDEX `fk_Notification_QuestionSession1_idx` (`questionSessionId` ASC) VISIBLE,
  CONSTRAINT `fk_Notification_Employee1`
    FOREIGN KEY (`receiverId`)
    REFERENCES `mydb`.`Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Notification_SuggestionReceiver1`
    FOREIGN KEY (`suggestionReceiverId`)
    REFERENCES `mydb`.`SuggestionReceiver` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Notification_QuestionSession1`
    FOREIGN KEY (`questionSessionId`)
    REFERENCES `mydb`.`QuestionSession` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
