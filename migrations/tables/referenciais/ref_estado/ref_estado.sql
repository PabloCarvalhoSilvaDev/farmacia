-- =============================================================================
-- Tabelas > Referenciais > ref_uf > tb_estado
-- Descrição: Unidades Federativas (Estados) do Brasil
-- Dependências: nenhuma
-- =============================================================================

USE `farmacia`;

DROP TABLE IF EXISTS `ref_estado`;

CREATE TABLE `ref_estado` (
  `sigla_uf` char(2) NOT NULL,
  `nome_estado` varchar(50) NOT NULL,
  PRIMARY KEY (`sigla_uf`),
  UNIQUE KEY `uk_nome_estado` (`nome_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
