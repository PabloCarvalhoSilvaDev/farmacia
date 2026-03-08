-- =============================================================================
-- Tabelas > Referenciais > ref_tipo_movimentacao
-- Descrição: Tipo de movimentação no histórico (entrada, saída, etc.)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `ref_tipo_movimentacao`;

CREATE TABLE `ref_tipo_movimentacao` (
  `id_tipo_movimentacao` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_tipo_movimentacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_movimentacao`),
  UNIQUE KEY `ref_tipo_movimentacaocol_UNIQUE` (`nome_tipo_movimentacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
