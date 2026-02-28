# Arquitetura de Banco de Dados Baseada em Projetos

Este diretório contém o esquema do banco **farmacia**, com tabelas agrupadas em **referenciais** e **principais** dentro da pasta **tabelas**.

## Estrutura de pastas

```
database/
├── banco de dados/                # Criação do banco e configurações iniciais
│   └── create_database.sql
│
└── tabelas/                       # Todas as tabelas do modelo
    ├── referenciais/                # Tabelas de referência (domínio estático ref_*)
    │   ├── ref_alteracao/           
    │   ├── ref_classificacao_produto/
    │   ├── ref_estado/             
    │   ├── ref_genero/
    │   ├── ref_situacao_usuario/
    │   ├── ref_tarja_produto/
    │   ├── ref_tipo_movimentacao/
    │   └── ref_tipo_usuario/
    │
    ├── principais/                  # Tabelas de negócio (tb_*)
    │   ├── cidade/       → tb_cidade.sql
    │   ├── endereco/     → tb_endereco.sql
    │   ├── historico/    → tb_historico.sql
    │   ├── produto/      → tb_produto.sql
    │   └── usuario/      → tb_usuario.sql
    │
    └── associativas/                # Tabelas N:N
        └── tb_usuario_has_ref_tipo_usuario/
            └── tb_usuario_has_ref_tipo_usuario.sql
```

O script mestre de deploy (`deploy.sql`), se existir, fica na pasta `deploy/` na raiz do projeto (não dentro de `database/`).

## Separação tabelas

- **1 tabelas/referenciais** — tabelas de domínio estático (tipos, situações, classificações). Não dependem de outras tabelas do modelo.
- **1 tabelas/principais** — tabelas de negócio (cidade, endereco, usuario, produto, historico). Podem referenciar referenciais e outras principais.
- **1 tabelas/associativas** — tabelas de relação N:N (ex.: usuário × tipo de usuário).

## Ordem de dependências

1. **0 banco de dados** → cria o banco e `USE farmacia`
2. **1 tabelas/referenciais** → todas as `ref_*` (inclui **ref_estado**, criada antes de tb_cidade)
3. **1 tabelas/principais/cidade** → `tb_cidade` (depende de ref_estado)
4. **1 tabelas/principais/usuario** → `tb_usuario`
5. **1 tabelas/principais/endereco** → `tb_endereco` (depende de tb_cidade e tb_usuario)
6. **1 tabelas/associativas** → `tb_usuario_has_ref_tipo_usuario` (depende de ref_tipo_usuario e tb_usuario)
7. **1 tabelas/principais/produto** → `tb_produto`
8. **1 tabelas/principais/historico** → `tb_historico`

## Como executar o deploy

Se existir `deploy/deploy.sql` na raiz do projeto:

Na **pasta raiz do repositório** (pasta `farmacia`):

```bash
cd "c:\Users\PC\OneDrive\Documentos\projetos de banco de dados\farmacia"
mysql -u seu_usuario -p < deploy/deploy.sql
```

No cliente MySQL (caminho absoluto; use `/` nos caminhos):

```sql
SOURCE C:/Users/PC/OneDrive/Documentos/projetos de banco de dados/farmacia/deploy/deploy.sql;
```

## Benefícios desta estrutura

- **Pasta tabelas** — deixa explícito que tudo que é tabela está em um só lugar.
- **Referenciais vs principais** — separação clara entre domínio estático e tabelas de negócio.
- **Principais por domínio** — dentro de principais, cada subpasta (usuario, produto, etc.) mantém a organização por projeto.
- **Deploy em ordem** — o `deploy.sql` garante a ordem correta respeitando FKs.
