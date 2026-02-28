# Análise da organização do projeto (Pharmastock)

## Estrutura atual

```
farmacia/
├── database/
│   ├── 0 banco de dados/
│   │   └── ddl/
│   │       └── 01_create_database.sql
│   └── 1 tabelas/
│       ├── associativas/
│       │   └── tb_usuario_has_ref_tipo_usuario/
│       │       └── tb_usuario_has_ref_tipo_usuario.sql   (sem subpasta ddl/)
│       ├── principais/
│       │   ├── cidade/       → ddl/tb_cidade.sql
│       │   ├── endereco/     → ddl/tb_endereco.sql
│       │   ├── historico/    → ddl/tb_historico.sql
│       │   ├── produto/      → ddl/tb_produto.sql
│       │   └── usuario/      → ddl/tb_usuario.sql
│       └── referenciais/
│           ├── ref_alteracao/           → ref_alteracao.sql (sem subpasta ddl/)
│           ├── ref_classificacao_produto/
│           ├── ref_genero/
│           ├── ref_situacao_usuario/
│           ├── ref_tarja_produto/
│           ├── ref_tipo_movimentacao/
│           └── ref_tipo_usuario/
├── deploy/
│   └── deploy.sql
└── documentacao/
    ├── farmacia.pdf, farmacia.sql, README.md
    └── pharmastock - modelo fisico.png/svg
```

---

## Pontos positivos

| Aspecto | Comentário |
|--------|------------|
| **Separação tabelas** | Pasta `1 tabelas` agrupa tudo que é tabela; referência vs principal vs associativa fica claro. |
| **Uma pasta por tabela** | Cada tabela tem sua pasta (ex.: `cidade/`, `ref_alteracao/`), o que facilita achar DDL (e futuramente DML) por entidade. |
| **Ordem numérica** | `0 banco de dados` e `1 tabelas` indicam ordem de execução (bootstrap → tabelas). |
| **Associativas à parte** | Tabela N:N em `associativas/` deixa explícito que é relação, não entidade principal. |
| **Documentação centralizada** | `documentacao/` com modelo, PDF e README. |
| **Deploy separado** | Pasta `deploy/` com script mestre fora do `database/` (reproduzível). |

---

## Inconsistências e riscos

### 1. Referenciais sem subpasta `ddl/`

- **Principais e associativas:** têm `ddl/nome_tabela.sql`.
- **Referenciais:** arquivo direto na pasta da tabela (`ref_alteracao/ref_alteracao.sql`), sem `ddl/`.

**Impacto:** convenção diferente entre referenciais e demais tabelas; scripts e ferramentas que assumem “sempre `ddl/`” quebram nas ref.

**Sugestão:** padronizar com `referenciais/ref_alteracao/ddl/ref_alteracao.sql` (e igual para as outras ref_*).

---

### 2. Nomes de pasta com espaço

- `0 banco de dados` e `1 tabelas` contêm espaço.

**Impacto:** em linha de comando e em alguns clientes MySQL, `SOURCE` com caminhos com espaço pode exigir aspas ou dar erro, dependendo do ambiente.

**Sugestão:** trocar para `0_banco_de_dados` e `1_tabelas` (ou `00_bootstrap` e `01_tabelas`) para evitar problemas em scripts e deploy.

---

### 3. Deploy desatualizado em relação às pastas

O `deploy/deploy.sql` estava referenciando:

- `00_bootstrap` em vez de `0 banco de dados`
- `database/tabelas/` em vez de `database/1 tabelas/`
- `referenciais/ddl/ref_*.sql` em vez de `referenciais/ref_*/ref_*.sql`
- `principais/localizacao` (e tb_cidade) em vez de `principais/cidade`
- `principais/usuario` para tb_endereco e tb_usuario_has_ref_tipo_usuario, que na verdade estão em `principais/endereco` e `associativas/`
- Ausência da tabela associativa no deploy

**Impacto:** o script de deploy não refletia a estrutura real e falharia ao rodar.

**Sugestão:** o `deploy.sql` foi ajustado para bater exatamente com a estrutura atual (caminhos e ordem de execução). Se renomear pastas (ex.: tirar espaços), atualize de novo o deploy.

---

### 4. Ordem de execução das tabelas

A ordem correta por dependência de FKs é:

1. Referenciais (todas)
2. `tb_cidade`
3. `tb_usuario`
4. `tb_endereco` (depende de tb_cidade e tb_usuario)
5. `tb_usuario_has_ref_tipo_usuario` (depende de ref_tipo_usuario e tb_usuario)
6. `tb_produto` (depende de tb_usuario e ref_*)
7. `tb_historico` (depende de tb_produto, tb_usuario e ref_*)

O deploy deve seguir essa ordem; o script corrigido já respeita isso.

---

## Resumo das recomendações

1. **Imediato:** usar o `deploy.sql` atualizado que acompanha esta análise (caminhos e ordem alinhados à estrutura real).
2. **Convenção:** padronizar referenciais com subpasta `ddl/` (ex.: `referenciais/ref_alteracao/ddl/ref_alteracao.sql`).
3. **Nomes de pasta:** evitar espaços; preferir `0_banco_de_dados` e `1_tabelas` (ou `00_bootstrap` e `01_tabelas`).
4. **Futuro:** ao adicionar views, functions, procedures e triggers, criar pastas na ordem: functions → views → procedures → triggers e referenciá-las no deploy nessa ordem.
5. **DML:** quando houver dados iniciais, usar `dml/` dentro da pasta de cada tabela (ex.: `cidade/dml/seed.sql`).

---

## Conclusão

A organização está alinhada com a ideia de projeto baseado em domínio e tabelas (referenciais, principais, associativas), com ordem numérica e deploy separado. Os principais ajustes são: **padronizar referenciais com `ddl/`**, **renomear pastas para não usar espaço** e **manter o deploy sempre sincronizado com a estrutura real**. Com o deploy corrigido e essas convenções, a base fica consistente e fácil de evoluir.
