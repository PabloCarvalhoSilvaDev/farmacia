-- =============================================================================
-- Tabelas > Principais > historico > tb_historico
-- Descrição: Histórico de movimentações de estoque (entrada/saída por produto)
-- Dependências: referenciais (ref_alteracao, ref_tipo_movimentacao), principais/produto (tb_produto), principais/usuario (tb_usuario)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `tb_historico`;

CREATE TABLE `tb_historico` (
  `id_historico` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_alteracao` tinyint unsigned NOT NULL,
  `fk_tipo_movimentacao` tinyint unsigned NOT NULL,
  `fk_produto` bigint unsigned NOT NULL,
  `fk_usuario` char(11) NOT NULL,
  `quantidade_historico` int NOT NULL,
  `quantidade_movimentada_historico` int NOT NULL,
  `data_hora_historico` timestamp NOT NULL,
  PRIMARY KEY (`id_historico`),
  KEY `fk_historico_produto1_idx` (`fk_produto`),
  KEY `fk_tb_historico_ref_alteracao1_idx` (`fk_alteracao`),
  KEY `fk_tb_historico_tb_usuario1_idx` (`fk_usuario`),
  KEY `fk_tb_historico_ref_tipo_movimentacao1_idx` (`fk_tipo_movimentacao`),
  KEY `idx_tb_historico_data_hora` (`data_hora_historico`),
  KEY `idx_tb_historico_data_produto` (`data_hora_historico`,`fk_produto`),
  CONSTRAINT `fk_historico_produto1` FOREIGN KEY (`fk_produto`) REFERENCES `tb_produto` (`id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tb_historico_ref_alteracao1` FOREIGN KEY (`fk_alteracao`) REFERENCES `ref_alteracao` (`id_alteracao`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tb_historico_ref_tipo_movimentacao1` FOREIGN KEY (`fk_tipo_movimentacao`) REFERENCES `ref_tipo_movimentacao` (`id_tipo_movimentacao`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tb_historico_tb_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `tb_usuario` (`cpf_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
