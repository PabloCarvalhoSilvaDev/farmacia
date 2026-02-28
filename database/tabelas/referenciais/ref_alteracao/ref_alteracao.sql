-- =============================================================================
-- Tabelas > Referenciais > ref_alteracao
-- Descrição: Tipos de alteração para histórico de movimentação
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `ref_alteracao`;

CREATE TABLE `ref_alteracao` (
  `id_alteracao` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_alteracao` varchar(45) NOT NULL,
  PRIMARY KEY (`id_alteracao`),
  UNIQUE KEY `nome_alteracao_UNIQUE` (`nome_alteracao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
