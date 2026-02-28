-- =============================================================================
-- Tabelas > Referenciais > ref_situacao_usuario
-- Descrição: Situação do usuário (ex.: ativo, inativo)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `ref_situacao_usuario`;

CREATE TABLE `ref_situacao_usuario` (
  `id_situacao_usuario` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_situacao_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_situacao_usuario`),
  UNIQUE KEY `nome_situacao_usuario_UNIQUE` (`nome_situacao_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
