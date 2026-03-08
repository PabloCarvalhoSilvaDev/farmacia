-- =============================================================================
-- Tabelas > Principais > localizacao > tb_cidade
-- Descrição: Cidades (UF + nome) para endereços
-- Dependências: referenciais/ref_uf (tb_estado)
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `tb_cidade`;

CREATE TABLE `tb_cidade` (
  `id_cidade` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_estado` char(2) NOT NULL,
  `nome_cidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cidade`),
  UNIQUE KEY `uk_cidade_por_estado` (`fk_estado`, `nome_cidade`),
  CONSTRAINT `fk_cidade_estado` FOREIGN KEY (`fk_estado`) REFERENCES `ref_estado` (`sigla_uf`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
