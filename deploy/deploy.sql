-- =============================================================================
-- DEPLOY MASTER - Banco de Dados Farmácia
-- Descrição: Script master que executa todas as migrations na ordem correta
-- Autor: Pablo Carvalho Silva
-- Data: 2026-03-07
-- =============================================================================

-- ============================================================================= 
-- ETAPA 0: Criação do banco de dados e configurações iniciais
-- =============================================================================
SOURCE ../migrations/database/create_database.sql

use farmacia;

-- =============================================================================
-- ETAPA 1: Tabelas Referenciais (domínio estático - sem dependências)
-- =============================================================================
SOURCE ../migrations/tables/referenciais/ref_alteracao/ref_alteracao.sql;
SOURCE ../migrations/tables/referenciais/ref_classificacao_produto/ref_classificacao_produto.sql;
SOURCE ../migrations/tables/referenciais/ref_estado/ref_estado.sql;
SOURCE ../migrations/tables/referenciais/ref_genero/ref_genero.sql;
SOURCE ../migrations/tables/referenciais/ref_situacao_usuario/ref_situacao_usuario.sql;
SOURCE ../migrations/tables/referenciais/ref_tarja_produto/ref_tarja_produto.sql;
SOURCE ../migrations/tables/referenciais/ref_tipo_movimentacao/ref_tipo_movimentacao.sql;
SOURCE ../migrations/tables/referenciais/ref_tipo_usuario/ref_tipo_usuario.sql;

-- =============================================================================
-- ETAPA 2: Tabelas Principais (negócio - possíveis dependências internas)
-- =============================================================================
-- Nota: ordem importa! tb_cidade depende de ref_estado (já criada)
SOURCE ../migrations/tables/principais/cidade/tb_cidade.sql;

-- tb_usuario é independente
SOURCE ../migrations/tables/principais/usuario/tb_usuario.sql;

-- tb_endereco depende de tb_cidade e tb_usuario (já criadas)
SOURCE ../migrations/tables/principais/endereco/tb_endereco.sql;

-- tb_produto pode depender de ref_classificacao_produto e ref_tarja_produto (já criadas)
SOURCE ../migrations/tables/principais/produto/tb_produto.sql;

-- tb_historico pode depender de outras tabelas (ajuste conforme necessário)
SOURCE ../migrations/tables/principais/historico/tb_historico.sql;

-- =============================================================================
-- ETAPA 3: Tabelas Associativas (N:N)
-- =============================================================================
-- Depende de tb_usuario e ref_tipo_usuario (já criadas)
SOURCE ../migrations/tables/associativas/tb_usuario_has_ref_tipo_usuario/tb_usuario_has_ref_tipo_usuario.sql;

-- =============================================================================
-- ETAPA 4: Functions, Stored Procedures e Triggers (se existirem)
-- =============================================================================
-- Descomente as linhas abaixo quando as pastas contenham arquivos:
-- SOURCE ../migrations/functions/*.sql;
-- SOURCE ../migrations/procedures/*.sql;
-- SOURCE ../migrations/triggers/*.sql;
-- SOURCE ../migrations/views/*.sql;

-- =============================================================================
-- FIM DO DEPLOY
-- =============================================================================
-- Verifica se as tabelas foram criadas com sucesso
USE farmacia;
SHOW TABLES;