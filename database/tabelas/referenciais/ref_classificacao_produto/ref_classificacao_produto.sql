-- =============================================================================
-- Tabelas > Referenciais > ref_classificacao_produto
-- Descrição: Classificação dos produtos (ex.: medicamento, cosmético)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `ref_classificacao_produto`;

CREATE TABLE `ref_classificacao_produto` (
  `id_classificacao_produto` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_classificacao_produto` varchar(45) NOT NULL,
  PRIMARY KEY (`id_classificacao_produto`),
  UNIQUE KEY `nome_classificacao_produto_UNIQUE` (`nome_classificacao_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
