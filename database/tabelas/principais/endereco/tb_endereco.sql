-- =============================================================================
-- Tabelas > Principais > usuario > tb_endereco
-- Descrição: Endereços dos usuários
-- Dependências: principais/localizacao (tb_cidade), principais/usuario (tb_usuario)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `tb_endereco`;

CREATE TABLE `tb_endereco` (
  `id_endereco` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_cidade` int unsigned NOT NULL,
  `fk_usuario` char(11) NOT NULL,
  `cep_endereco` char(8) NOT NULL,
  `logradouro_endereco` varchar(150) NOT NULL,
  `numero_endereco` varchar(10) NOT NULL,
  `complemento_endereco` varchar(50) DEFAULT NULL,
  `bairro_endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `fk_tb_endereco_ref_cidade_idx` (`fk_cidade`),
  KEY `fk_tb_endereco_tb_usuario1_idx` (`fk_usuario`),
  CONSTRAINT `fk_tb_endereco_ref_cidade` FOREIGN KEY (`fk_cidade`) REFERENCES `tb_cidade` (`id_cidade`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tb_endereco_tb_usuario1` FOREIGN KEY (`fk_usuario`) REFERENCES `tb_usuario` (`cpf_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
