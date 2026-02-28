-- =============================================================================
-- Projeto: 00_bootstrap
-- Descrição: Criação do banco de dados e configurações iniciais
-- Ordem de execução: 1
-- =============================================================================

CREATE DATABASE IF NOT EXISTS `farmacia`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci
  /*!80016 DEFAULT ENCRYPTION='N' */;

USE `farmacia`;

-- Configurações de sessão para importação
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
SET UNIQUE_CHECKS = 0;
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
