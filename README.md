# Arquitetura de Banco de Dados Baseada em Projetos

Este diretório contém o esquema do banco **farmacia**, com tabelas agrupadas em **associativas**, **principais** e **referencias** dentro da pasta **tables**.

## Estrutura de pastas

```
migrations/
│
├── database/   → create_database.sql      
│
└── tables/         
    │                          
    ├── associativas/               
    │   └── tb_usuario_has_ref_tipo_usuario/ → tb_usuario_has_ref_tipo_usuario.sql 
    │
    ├── principais/
    │   ├── cidade/     → tb_cidade.sql   
    │   ├── endereco/   → tb_endereco.sql
    │   ├── historico/  → tb_historico.sql
    │   ├── produto/    → tb_produto.sql
    │   └── usuario/    → tb_usuario.sql 
    │
    └── referencias/
        ├── ref_alteracao/              → ref_alteracao.sql           
        ├── ref_classificacao_produto/  → ref_classificacao_produto.sql
        ├── ref_estado/                 → ref_estado.sql             
        ├── ref_genero/                 → ref_genero.sql
        ├── ref_situacao_usuario/       → ref_situacao_usuario.sql
        ├── ref_tarja_produto/          → ref_tarja_produto.sql
        ├── ref_tipo_movimentacao/      → ref_tipo_movimentacao.sql
        └── ref_tipo_usuario/           → ref_tipo_usuario.sql

```

Outras pastas importantes:
- `deploy/` — script mestre de deploy (`deploy.sql`)
- `docs/` — documentação (manual de inicialização, regras de negócio, etc.)
- `functions/`, `procedures/`, `triggers/`, `views/` — objetos adicionais do banco
- `seeds/` — dados iniciais que serão implementados


## Separação tabelas

- **1 tables/referenciais** — tabelas de domínio estático (tipos, situações, classificações). Não dependem de outras tabelas do modelo.
- **1 tables/principais** — tabelas de negócio (cidade, endereco, usuario, produto, historico). Podem referenciar referenciais e outras principais.
- **1 tables/associativas** — tabelas de relação N:N (ex.: usuário × tipo de usuário).

## Ordem de dependências

1. **0 database** → cria o banco e `USE farmacia`
2. **1 tables/referenciais** → todas as `ref_*` (inclui **ref_estado**, criada antes de tb_cidade)
3. **1 tables/principais/cidade** → `tb_cidade` (depende de ref_estado)
4. **1 tables/principais/usuario** → `tb_usuario`
5. **1 tables/principais/endereco** → `tb_endereco` (depende de tb_cidade e tb_usuario)
6. **1 tables/associativas** → `tb_usuario_has_ref_tipo_usuario` (depende de ref_tipo_usuario e tb_usuario)
7. **1 tables/principais/produto** → `tb_produto`
8. **1 tables/principais/historico** → `tb_historico`

## Benefícios desta estrutura

- **Pasta tables** — deixa explícito que tudo que é tabela está em um só lugar.
- **Referenciais vs principais** — separação clara entre domínio estático e tabelas de negócio.
- **Principais por domínio** — dentro de principais, cada subpasta (usuario, produto, etc.) mantém a organização por projeto.
- **Deploy em ordem** — o `deploy.sql` garante a ordem correta respeitando FKs.

## Documentação relacionada

- `docs/regras_negocio.md` — políticas e validações que regem o comportamento do sistema.
- `docs/mentalidade_analitica.md` — mapa de stakeholders, métricas e necessidades analíticas.
- `docs/como_iniciar.md` — manual passo a passo para inicializar o projeto.
