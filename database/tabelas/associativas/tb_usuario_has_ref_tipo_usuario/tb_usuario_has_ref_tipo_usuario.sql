-- =============================================================================
-- Tabelas > Principais > usuario > tb_usuario_has_ref_tipo_usuario
-- Descrição: Relação N:N entre usuário e tipo de usuário (perfis)
-- Dependências: referenciais (ref_tipo_usuario), principais/usuario (tb_usuario)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `tb_usuario_has_ref_tipo_usuario`;

CREATE TABLE `tb_usuario_has_ref_tipo_usuario` (
  `ref_tipo_usuario_id_tipo_usuario` tinyint unsigned NOT NULL,
  `tb_usuario_cpf_usuario` char(11) NOT NULL,
  PRIMARY KEY (`ref_tipo_usuario_id_tipo_usuario`,`tb_usuario_cpf_usuario`),
  KEY `fk_tb_usuario_has_ref_tipo_usuario_ref_tipo_usuario1_idx` (`ref_tipo_usuario_id_tipo_usuario`),
  KEY `fk_tb_usuario_has_ref_tipo_usuario_tb_usuario1_idx` (`tb_usuario_cpf_usuario`),
  CONSTRAINT `fk_tb_usuario_has_ref_tipo_usuario_ref_tipo_usuario1` FOREIGN KEY (`ref_tipo_usuario_id_tipo_usuario`) REFERENCES `ref_tipo_usuario` (`id_tipo_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tb_usuario_has_ref_tipo_usuario_tb_usuario1` FOREIGN KEY (`tb_usuario_cpf_usuario`) REFERENCES `tb_usuario` (`cpf_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
