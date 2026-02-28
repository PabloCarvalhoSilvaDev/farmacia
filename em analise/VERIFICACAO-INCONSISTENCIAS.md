# Verificação de inconsistências nos documentos

Data da verificação: fevereiro/2025.  
**Última revisão:** fevereiro/2026.

---

## Resumo

| Documento | Status | Ação realizada |
|-----------|--------|----------------|
| **README.md** | Desatualizado | Incluir `ref_estado` em referenciais; principais usam `tb_*.sql` na pasta (sem subpasta `ddl/`). |
| **ANALISE-ORGANIZACAO.md** | Ver revisão | Diagrama cita `ddl/` nas principais; na prática não há subpasta `ddl/` em cidade/, endereco/, etc. |
| **dicionario_dados_word.md** | Inconsistente | tb_cidade no dicionário usa `uf_cidade`; DDL usa `fk_estado` + `ref_estado`. Falta documentar `ref_estado`. |
| **farmacia.sql** | Desatualizado | Dump usa `uf_cidade` em tb_cidade e não inclui `ref_estado`; DDL em `database/` usa `ref_estado` + `fk_estado`. |

---

## 1. README.md (documentacao/)

**Problemas encontrados (já corrigidos):**

- Estrutura de pastas não refletia a real:
  - Dizia `00_bootstrap/` → real é `0 banco de dados/`
  - Dizia `tabelas/` → real é `1 tabelas/`
  - Referenciais: README mostrava `referenciais/ddl/ref_*.sql` (arquivos planos); na prática cada ref tem sua pasta (ex.: `ref_alteracao/ref_alteracao.sql`) sem subpasta `ddl/`
  - Principais: dizia `localizacao/` → real é `cidade/`; `tb_endereco` está em `endereco/`, não em `usuario/`
  - Tabela associativa estava listada dentro de `usuario/`; na prática fica em `1 tabelas/associativas/`
- Deploy: README citava `database/deploy.sql`; o projeto usa (ou usará) `deploy/deploy.sql` na raiz.

**Correções aplicadas:** Estrutura de pastas, ordem de dependências e instruções de deploy foram reescritas para bater com a estrutura atual do repositório.

---

## 2. ANALISE-ORGANIZACAO.md

**Problema encontrado (já corrigido):**

- A tabela associativa estava descrita com subpasta `ddl/`:
  - Antes: `tb_usuario_has_ref_tipo_usuario/ddl/tb_usuario_has_ref_tipo_usuario.sql`
  - Real: `tb_usuario_has_ref_tipo_usuario/tb_usuario_has_ref_tipo_usuario.sql` (arquivo direto na pasta da tabela, sem `ddl/`).

**Correção aplicada:** Diagrama de estrutura atualizado para mostrar que a associativa não usa `ddl/`.

---

## 3. dicionario_dados_word.md

**Observações:**

- **Nome do projeto:** Título usa "Pharmastock"; o banco se chama **farmacia**. Manter assim é válido (projeto vs nome do banco).
- **tb_cidade, tb_endereco, tb_historico:** O dicionário **já inclui** essas três tabelas (seções 3, 4 e 5). A afirmação anterior de que faltavam estava desatualizada.
- **Inconsistência crítica (revisão 2026):** O dicionário descreve **tb_cidade** com campo `uf_cidade` (char(2)), sem FK. Já o DDL em `database/tabelas/principais/cidade/tb_cidade.sql` usa **`fk_estado`** (char(2)) com FK para **ref_estado(sigla_uf)**. A tabela **ref_estado** existe no projeto mas **não está documentada** no dicionário. É necessário alinhar: ou atualizar o dicionário para ref_estado + fk_estado (recomendado), ou reverter o DDL para uf_cidade.

---

## 4. Nomenclatura: Pharmastock vs farmacia

- **farmacia** — nome do banco de dados (já padronizado em todos os scripts SQL).
- **Pharmastock** — aparece como nome do projeto/sistema em:
  - README.md (título)
  - ANALISE-ORGANIZACAO.md (título)
  - dicionario_dados_word.md (título)
  - ANALISE cita "pharmastock - modelo fisico.png/svg" em documentacao/

Decisão de negócio: manter "Pharmastock" como nome do projeto/sistema e "farmacia" como nome do banco é válido. Se quiser tudo como "Farmacia", basta substituir "Pharmastock" nesses títulos.

---

## 5. farmacia.sql (dump)

- Banco e `USE` estão como `farmacia`.
- **Inconsistência:** O dump em `documentacao/farmacia.sql` define **tb_cidade** com `uf_cidade` (char(2)), sem tabela `ref_estado`. Os DDLs em `database/` definem **ref_estado** e **tb_cidade** com `fk_estado` → ref_estado. O dump está desatualizado em relação ao modelo atual (ref_estado + fk_estado).

---

## 6. Revisão 2026 — Outras inconsistências

- **README / ANALISE:** A estrutura documentada diz que as tabelas principais ficam em `cidade/ddl/tb_cidade.sql`, `endereco/ddl/tb_endereco.sql`, etc. Na prática, os arquivos estão em `cidade/tb_cidade.sql`, `endereco/tb_endereco.sql` (sem subpasta `ddl/`). A documentação está incorreta.
- **ref_estado:** Existe em `database/tabelas/referenciais/ref_estado/ref_estado.sql` e é dependência de tb_cidade. O README não lista ref_estado na seção de referenciais; a ordem de deploy deve criar ref_estado antes de tb_cidade.
- **Pasta documentacao:** O nome da pasta de requisitos está como `requsitos` (typo); o correto seria `requisitos`.

---

## Recomendações futuras

1. **Deploy:** Se `deploy/deploy.sql` for criado ou movido, manter o README e a ANALISE referenciando o caminho correto (`deploy/deploy.sql`). Incluir **ref_estado** antes de tb_cidade na ordem de execução.
2. **Dicionário:** Alinhar com o DDL: documentar **ref_estado** e alterar **tb_cidade** para usar `fk_estado` → ref_estado (em vez de `uf_cidade`).
3. **farmacia.sql:** Regenerar o dump a partir do modelo atual (com ref_estado e tb_cidade.fk_estado) ou marcar explicitamente como “dump legado”.
4. **README/ANALISE:** Corrigir caminhos das principais para `cidade/tb_cidade.sql` (sem `ddl/`) ou passar a usar de fato a subpasta `ddl/` nos arquivos.
5. **Referenciais:** A ANALISE já recomenda padronizar referenciais com subpasta `ddl/`. Ao fazer essa mudança, atualizar README e ANALISE de novo.
