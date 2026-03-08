-- =============================================================================
-- Tabelas > Referenciais > ref_tarja_produto
-- Descrição: Tarja do produto (ex.: vermelha, amarela, sem tarja)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `ref_tarja_produto`;

CREATE TABLE `ref_tarja_produto` (
  `id_tarja_produto` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_tarja_produto` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tarja_produto`),
  UNIQUE KEY `nome_tarja_produto_UNIQUE` (`nome_tarja_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
