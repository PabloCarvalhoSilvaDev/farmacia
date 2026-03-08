# Requisitos Funcionais

## 1. Objetivo

Documentar todos os requisitos funcionais (RF) do sistema de farmácia. Um requisito funcional descreve **o que o sistema deve fazer** — as ações, processos e operações que o sistema precisa suportar para atender às necessidades de negócio.

## 2. Escopo

Este documento cobre funcionalidades de:
- Gestão de usuários e perfis
- Gestão de produtos e catálogo
- Gestão de estoques
- Registro de movimentações e histórico
- Relatórios operacionais
- Rastreabilidade e auditoria

## 3. Requisitos Funcionais Principais

### RF1: Gerenciamento de Usuários

**Descrição:** O sistema deve permitir criar, ler, atualizar e deletar (CRUD) usuários com diferentes perfis.

**Critérios de Aceitação:**
- Registrar usuário com nome completo, CPF, email, telefone e senha.
- Atribuir tipo de usuário (Farmacêutico, Atendente, Administrador, Gestor, Auditor).
- Definir situação do usuário (Ativo, Inativo, Suspenso).
- Permitir atualização de dados cadastrais.
- Registrar data/hora de último login.
- Suportar múltiplos tipos por usuário (tabela associativa `usuario_has_ref_tipo_usuario`).

**Entidades envolvidas:** `usuario`, `ref_tipo_usuario`, `ref_situacao_usuario`, `usuario_has_ref_tipo_usuario`

---

### RF2: Gerenciamento de Produtos

**Descrição:** O sistema deve permitir registrar e manter um catálogo de produtos com atributos comerciais e regulatórios.

**Critérios de Aceitação:**
- Registrar produto com SKU único, nome, descrição.
- Informar preço de venda e custo.
- Classificar produto por tipo (classificação farmacêutica, ex.: genérico, similar, referência).
- Identificar se é de tarja (vermelha, preta) ou venda livre.
- Manter estoque atual.
- Permitir ativação/inativação de produtos.
- Rastrear quando o produto foi criado e quem criou.

**Entidades envolvidas:** `produto`, `ref_classificacao_produto`, `ref_tarja_produto`

---

### RF3: Gerenciamento de Estoque

**Descrição:** O sistema deve registrar e controlar o estoque de cada produto em tempo real.

**Critérios de Aceitação:**
- Atualizar quantidade em estoque a cada movimentação.
- Permitir ajustes manuais com justificativa (ex.: perda, quebra).
- Alertar quando estoque cai abaixo de nível crítico configurável.
- Calcular estoque mínimo e máximo por produto.
- Suportar consulta de histórico de estoque por período.
- Gerar relatório de produtos com ruptura (estoque zerado).

**Entidades envolvidas:** `produto`, `historico`

---

### RF4: Registro de Movimentações e Histórico

**Descrição:** O sistema deve registrar toda operação que impacte no negócio (vendas, entradas, devoluções, ajustes).

**Critérios de Aceitação:**
- Registrar venda com produto, quantidade, preço unitário, data/hora.
- Vincular venda ao usuário que a registrou (atendente/farmacêutico).
- Registrar tipo de movimentação (venda, entrada, devolução, ajuste de estoque, perda, quebra).
- Manter referência a documentos externos (NF, RCP, nota de credibilidade).
- Permitir observações/comentários por operação.
- Garantir que registros são imutáveis após confirmação (append-only).

**Entidades envolvidas:** `historico`, `ref_tipo_movimentacao`, `usuario`, `produto`

---

### RF5: Rastreabilidade e Auditoria

**Descrição:** O sistema deve registrar e permitir consulta de quem fez o quê e quando, para fins de auditoria e compliance.

**Critérios de Aceitação:**
- Manter campos `created_by`, `created_at`, `updated_by`, `updated_at` em todas as tabelas críticas.
- Registrar todas as operações em log de auditoria com timestamp.
- Permitir filtrar operações por usuário, período, tipo de operação.
- Gerar relatório de acessos não autorizados ou suspeitos.
- Manter histórico imutável por no mínimo 5 anos.

**Entidades envolvidas:** Todas (adição de campos de auditoria), `historico`

---

### RF6: Relatórios Operacionais Básicos

**Descrição:** O sistema deve gerar relatórios para suporte às decisões cotidianas.

**Critérios de Aceitação:**
- Relatório de vendas por dia/semana/mês (valor e quantidade).
- Relatório de estoque crítico e produtos em ruptura.
- Relatório de movimentações por tipo (entrada, venda, devolução).
- Relatório de vendas por atendente/farmacêutico.
- Relatório de produtos mais vendidos.
- Permitir filtrar por período, categoria, produto ou usuário.
- Exportar relatórios em CSV ou impressão direta.

**Entidades envolvidas:** `historico`, `produto`, `usuario`, `ref_classificacao_produto`

---

### RF7: Gerenciamento de Endereços e Localização

**Descrição:** O sistema deve permitir registrar endereços associados a usuários (ex.: lojas, franquias).

**Critérios de Aceitação:**
- Registrar endereço com rua, número, complemento, bairro, CEP.
- Associar cidade e estado.
- Permitir múltiplos endereços por usuário (ex.: escritório, loja principal, filial).
- Validar CEP contra base de dados de cidades.

**Entidades envolvidas:** `endereco`, `cidade`, `usuario`

---

### RF8: Controle de Acesso por Papel (RBAC)

**Descrição:** O sistema deve restringir operações conforme o perfil/tipo do usuário.

**Critérios de Aceitação:**
- Farmacêutico: visualizar vendas, autorizar dispensas controladas, consultar alertas de estoque.
- Atendente: registrar vendas, consultar estoque, emitir recibos.
- Administrador: gerenciar usuários, ajustar permissões, realizar backups.
- Gestor: visualizar relatórios gerenciais, analisar vendas, definir políticas.
- Auditor: consultar logs de auditoria, gerar relatórios de compliance, acessar histórico imutável.

**Entidades envolvidas:** `usuario`, `ref_tipo_usuario`, regritas em lógica de aplicação

---

### RF9: Alertas e Notificações

**Descrição:** O sistema deve notificar stakeholders sobre eventos críticos.

**Critérios de Aceitação:**
- Alertar quando estoque de produto crítico cai abaixo do mínimo.
- Notificar sobre tenta de acesso não autorizado.
- Avisar sobre movimentações suspeitas (ex.: grande quantidade em curto tempo).
- Suportar notificações por email ou SMS.

**Entidades envolvidas:** `historico`, `produto`, lógica de eventos

---

### RF10: Geração de Documentos

**Descrição:** O sistema deve gerar documentos legais e comerciais.

**Critérios de Aceitação:**
- Emitir recibo de venda com dados do cliente, produto, valor, farmacêutico responsável.
- Gerar cupom fiscal eletrônico (integração futura).
- Gerar relatório de vendas controladas para ANVISA.

**Entidades envolvidas:** `historico`, `usuario`, `produto`, `ref_tarja_produto`

---

## 4. Fluxos de Negócio Principais

### Fluxo: Venda de Produto Simples
1. Atendente consulta estoque do produto.
2. Atendente registra venda (quantidade, preço, data).
3. Sistema vincula venda ao atendente e atualiza estoque.
4. Sistema emite recibo.
5. Se estoque atinge nível crítico, gera alerta para gestor/farmacêutico.

### Fluxo: Venda de Produto de Tarja
1. Cliente apresenta receita.
2. Farmacêutico autoriza a venda.
3. Sistema registra venda com referência à receita.
4. Sistema registra tipo de tarja na movimentação.
5. Sistema gera relatório para ANVISA.

### Fluxo: Entrada de Estoque
1. Receber NF do fornecedor.
2. Inserir manual ou integração de dados (produto, quantidade, NF).
3. Sistema atualiza estoque.
4. Sistema registra movimentação com tipo "entrada".

---

## 5. Priorização de Implementação (MoSCoW)

- **MUST (Crítico):** RF1 (Usuários), RF2 (Produtos), RF3 (Estoque), RF4 (Movimentações), RF5 (Auditoria)
- **SHOULD (Importante):** RF6 (Relatórios), RF8 (RBAC), RF9 (Alertas)
- **COULD (Desejável):** RF7 (Endereços), RF10 (Documentos)
- **WON'T (Fora do escopo atual):** Integração com sistemas de terceiros, cupom fiscal eletrônico completo

---

## 6. Dependências e Relacionamentos

- RF1 depende de criação das referências (tipo_usuario, situacao_usuario)
- RF3 depende de RF4 (movimentações devem alimentar estoque)
- RF5 depende de todas as demais (auditoria é transversal)
- RF6 depende de RF4 (relatórios usam histórico)
- RF8 depende de RF1 (tipos de usuário devem estar definidos)

---

## 7. Sucesso e Validação

Um requisito é considerado atendido quando:
- Todos os critérios de aceitação são implementados e testados.
- Testes unitários e de integração cobrem 80%+ do código.
- Usuários finais conseguem executar manualmente o fluxo esperado.
- Documentação de uso está atualizada.

---

**Versão:** 1.0 | **Data:** 21 de fevereiro de 2026 | **Revisão obrigatória:** A cada mudança de escopo
