-- =============================================================================
-- Tabelas > Principais > produto > tb_produto
-- Descrição: Cadastro de produtos (estoque, preço, validade, etc.)
-- Dependências: referenciais (ref_classificacao_produto, ref_tarja_produto), principais/usuario (tb_usuario)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `tb_produto`;

CREATE TABLE `tb_produto` (
  `id_produto` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_classificacao_produto` tinyint unsigned NOT NULL,
  `fk_tarja_produto` tinyint unsigned NOT NULL,
  `fk_usuario` char(11) NOT NULL,
  `quantidade_produto` int NOT NULL,
  `preco_produto` decimal(15,2) NOT NULL,
  `data_fabricacao_produto` date NOT NULL,
  `data_validade_produto` date NOT NULL,
  `nome_produto` varchar(200) NOT NULL,
  `fabricante_produto` varchar(100) NOT NULL,
  `descricao_produto` text NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_tb_produto_ref_classificacao_produto1_idx` (`fk_classificacao_produto`),
  KEY `fk_tb_produto_ref_tarja_produto1_idx` (`fk_tarja_produto`),
  KEY `fk_tb_produto_tb_usuario1_idx` (`fk_usuario`),
  KEY `idx_tb_produto_nome_produto` (`nome_produto`),
  CONSTRAINT `fk_tb_produto_ref_classificacao_produto1` FOREIGN KEY (`fk_classificacao_produto`) REFERENCES `ref_classificacao_produto` (`id_classificacao_produto`),
  CONSTRAINT `fk_tb_produto_ref_tarja_produto1` FOREIGN KEY (`fk_tarja_produto`) REFERENCES `ref_tarja_produto` (`id_tarja_produto`),
  CONSTRAINT `fk_tb_produto_tb_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `tb_usuario` (`cpf_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
