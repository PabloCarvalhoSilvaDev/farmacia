-- =============================================================================
-- Tabelas > Referenciais > ref_tipo_usuario
-- Descrição: Tipo/perfil do usuário (ex.: admin, farmacêutico, vendedor)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `ref_tipo_usuario`;

CREATE TABLE `ref_tipo_usuario` (
  `id_tipo_usuario` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_tipo_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`),
  UNIQUE KEY `nome_tipo_usuario_UNIQUE` (`nome_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
