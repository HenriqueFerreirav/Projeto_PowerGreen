-- MySQL Script generated by MySQL Workbench
-- sáb 28 jan 2023 17:02:22
-- Model: bd_PoweGreen    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_PowerGreen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_PowerGreen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_PowerGreen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
USE `bd_PowerGreen` ;

-- -----------------------------------------------------
-- Table `bd_PowerGreen`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_PowerGreen`.`tb_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_PowerGreen`.`tb_plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_PowerGreen`.`tb_plano` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `preco` DECIMAL NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_PowerGreen`.`tb_bateria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_PowerGreen`.`tb_bateria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `capacidade` INT NOT NULL,
  `num_saidas` INT NOT NULL,
  `foto` VARCHAR(255) NULL,
  `descricao` VARCHAR(1000) NOT NULL,
  `usuario_id` INT NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produto_4t_usuario_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_produto_4t_categoria_2t1_idx` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `fk_produto_4t_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `bd_PowerGreen`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_4t_categoria_2t1`
    FOREIGN KEY (`plano_id`)
    REFERENCES `bd_PowerGreen`.`tb_plano` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;