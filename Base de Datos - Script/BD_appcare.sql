SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `appcare` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `appcare` ;

-- -----------------------------------------------------
-- Table `appcare`.`RecienNacido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appcare`.`RecienNacido` (
  `idRecienNacido` INT NOT NULL AUTO_INCREMENT,
  `ApellidoPaterno` VARCHAR(45) NOT NULL,
  `ApellidoMaterno` VARCHAR(45) NOT NULL,
  `Peso` VARCHAR(45) NULL,
  `FechaDeNacimiento` DATE NULL,
  `HoraDeNacimiento` TIME NULL,
  `Estado` VARCHAR(45) NULL,
  `talla` VARCHAR(45) NULL,
  `sexo` VARCHAR(45) NULL,
  PRIMARY KEY (`idRecienNacido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appcare`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appcare`.`Usuario` (
  `idUsuario` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `ApellidoPaterno` VARCHAR(45) NOT NULL,
  `ApellidoMaterno` VARCHAR(45) NOT NULL,
  `Profecion` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appcare`.`SignoVital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appcare`.`SignoVital` (
  `idSignovital` VARCHAR(10) NOT NULL,
  `IdRecienNAcido` INT NULL AUTO_INCREMENT,
  `HoraRegistrada` TIME NULL,
  `FechaRegistrada` DATE NULL,
  `TipodeLectura` VARCHAR(45) NULL,
  `ValorDeLectura` DOUBLE NULL,
  PRIMARY KEY (`idSignovital`),
  INDEX `FK_IdRecienNac_idx` (`IdRecienNAcido` ASC),
  CONSTRAINT `FK_IdRecienNac`
    FOREIGN KEY (`IdRecienNAcido`)
    REFERENCES `appcare`.`RecienNacido` (`idRecienNacido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appcare`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appcare`.`Login` (
  `idLogin` VARCHAR(10) NOT NULL,
  `IdUsuario` VARCHAR(10) NULL,
  `NombreDeUsuario` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`idLogin`),
  INDEX `FK_idUsuario_idx` (`IdUsuario` ASC),
  CONSTRAINT `FK_idUsuario`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `appcare`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appcare`.`Historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appcare`.`Historial` (
  `idHistorial` VARCHAR(10) NOT NULL,
  `tipodemovimiento` VARCHAR(45) NULL,
  `idUsuario` VARCHAR(10) NULL,
  `fecha` DATE NULL,
  `registroAfectado` VARCHAR(45) NULL,
  `Observaciones` VARCHAR(45) NULL,
  PRIMARY KEY (`idHistorial`),
  INDEX `FK_IdUsuario_idx` (`idUsuario` ASC),
  CONSTRAINT `FK_IdUsuarioH`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `appcare`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
