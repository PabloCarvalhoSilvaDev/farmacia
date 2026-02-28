-- =============================================================================
-- Tabelas > Principais > usuario > tb_usuario
-- Descrição: Cadastro de usuários do sistema
-- Dependências: referenciais (ref_genero, ref_situacao_usuario)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `tb_usuario`;

CREATE TABLE `tb_usuario` (
  `cpf_usuario` char(11) NOT NULL,
  `fk_situacao_usuario` tinyint unsigned NOT NULL,
  `fk_genero` tinyint unsigned NOT NULL,
  `nome_usuario` varchar(45) NOT NULL,
  `sobrenome_usuario` varchar(45) NOT NULL,
  `email_usuario` varchar(100) NOT NULL,
  `senha_usuario` varchar(255) NOT NULL,
  `telefone_usuario` varchar(19) NOT NULL,
  PRIMARY KEY (`cpf_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email_usuario`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone_usuario`),
  KEY `fk_tb_usuario_ref_genero1_idx` (`fk_genero`),
  KEY `fk_tb_usuario_ref_situacao_usuario1_idx` (`fk_situacao_usuario`),
  CONSTRAINT `fk_tb_usuario_ref_genero1` FOREIGN KEY (`fk_genero`) REFERENCES `ref_genero` (`id_genero`),
  CONSTRAINT `fk_tb_usuario_ref_situacao_usuario1` FOREIGN KEY (`fk_situacao_usuario`) REFERENCES `ref_situacao_usuario` (`id_situacao_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
