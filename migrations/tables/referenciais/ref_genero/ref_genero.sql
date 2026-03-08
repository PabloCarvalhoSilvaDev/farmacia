-- =============================================================================
-- Tabelas > Referenciais > ref_genero
-- Descrição: Gênero do usuário
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `ref_genero`;

CREATE TABLE `ref_genero` (
  `id_genero` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_genero` varchar(45) NOT NULL,
  PRIMARY KEY (`id_genero`),
  UNIQUE KEY `nome_genero_UNIQUE` (`nome_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
