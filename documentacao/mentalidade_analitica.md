# Mentalidade Analítica: Relações, Atributos e Papéis de Stakeholders

## 1. Objetivo

Documentar a **mentalidade analítica** do sistema de farmácia, mapeando as relações entre stakeholders, seus papéis, responsabilidades, necessidades de dados e métricas de interesse. Uma mentalidade analítica forte garante que cada decisão é apoiada por dados confiáveis, métricas claras e insights acionáveis.

## 2. Escopo

- Identificação de stakeholders (internos e externos)
- Definição de papéis e responsabilidades
- Atributos e dados necessários por stakeholder
- Perguntas de negócio que cada um precisa responder
- KPIs (Key Performance Indicators) e métricas associadas
- Relacionamentos entre stakeholders

---

## 3. Stakeholders Principais

### 3.1 Farmacêutico (Operacional)

**Papel:** Responsável pelo controle farmacêutico, autorização de vendas controladas e garantia de compliance.

**Responsabilidades:**
- Validar dispensação de medicamentos de tarja.
- Revisar movimentações suspeitas (ex.: grande quantidade em curto tempo).
- Garantir conformidade com normas ANVISA.
- Revisar e autorizar ajustes de estoque.
- Treinamento de atendentes sobre produtos e protocolos.

**Atributos Necessários no Sistema:**
- `usuario_id`: Identificador único
- `nome`: Nome completo
- `registro_profissional`: Número do registro no CRF (Conselho Regional de Farmácia)
- `turno`: Período de trabalho (manhã, tarde, noite)
- `especialidade`: Farmacoterapia, cosmetologia, etc.
- `contato`: Email, telefone
- `permissoes`: Autorizar venda de tarja, ajustar estoque, gerar relatórios de auditoria

**Perguntas de Negócio (O que precisa responder diariamente?):**
- Quantas dispensas controladas ocorreram hoje e estão corretas?
- Há diferenças entre inventário físico e sistema? (Reconciliação)
- Quais produtos estão com estoque crítico?
- Há padrões suspeitos de venda (ex.: mesmo cliente, múltiplos produtos de tarja)?
- Quais atendentes tiveram maior taxa de erros nesta semana?

**KPIs e Métricas:**
- Número de dispensas controladas autorizadas (diário, semanal, mensal)
- Taxa de discrepâncias de estoque (%)
- Tempo médio de atendimento por operação (minutos)
- Número de alertas de atividade suspeita (diário)
- Taxa de conformidade com protocolos ANVISA (%)
- Quantidade de ajustes de estoque por semana

**Critério de Sucesso:** Farmacêutico consegue identificar e corrigir 95%+ das divergências no prazo de 24h.

---

### 3.2 Atendente / Caixa (Operacional)

**Papel:** Realizar registro de vendas, atualizar estoque e emitir comprovantes.

**Responsabilidades:**
- Registrar venda no sistema (produto, quantidade, valor).
- Confirmar estoque antes de venda.
- Emitir recibo de venda.
- Reportar problemas de estoque ao farmacêutico.
- Anotar observações em operações especiais.

**Atributos Necessários no Sistema:**
- `usuario_id`: Identificador único
- `nome`: Nome completo
- `nivel_acesso`: Junior, Sênior, Operador
- `posto_atendimento`: Caixa 1, Caixa 2, Balcão, etc.
- `data_admissao`: Para análise de tenure
- `permissoes`: Registrar vendas, consultar estoque, emitir recibo

**Perguntas de Negócio (O que precisa fazer diariamente?):**
- Qual é o estoque atual do produto X?
- Quanto foi vendido de cada produto hoje? (para reconciliação de caixa)
- Como faço recibo de uma venda?
- Quem é responsável por este erro de caixa?

**KPIs e Métricas:**
- Vendas por atendente (valor, quantidade, número de transações)
- Ticket médio (valor médio de venda)
- Taxa de erros de registro (%, detectado em auditoria)
- Tempo médio de transação (segundos)
- Número de produtos consultados por sessão (trending)
- Horas trabalhadas vs. vendas geradas (produtividade)

**Critério de Sucesso:** Registro de 99.5%+ de vendas sem erros, tempo de transação < 3 minutos.

---

### 3.3 Administrador do Sistema (TI/DBA)

**Papel:** Manter infraestrutura, segurança, backups e performance do sistema.

**Responsabilidades:**
- Garantir disponibilidade do sistema (uptime 99.5%+).
- Executar e testar backups diários.
- Gerenciar permissões e autenticação.
- Monitorar performance e alertas de falha.
- Aplicar patches de segurança.
- Documentar arquitetura e runbooks.

**Atributos Necessários no Sistema:**
- `usuario_id`: Identificador único
- `nome`: Nome completo
- `email`: Para notificações de alerta
- `ultimo_login`: Auditoria de acesso
- `permissoes`: Acesso total (super-admin), logs, configurações

**Perguntas de Negócio (O que precisa monitorar?):**
- O sistema está online? (heartbeat/health check)
- Houve quedas de performance nas últimas 24h?
- Quando foi o último backup bem-sucedido?
- Há alertas de segurança ou tentativas de acesso não autorizado?
- Quanto de espaço em disco ainda temos?
- Qual é o crescimento de dados por mês?

**KPIs e Métricas:**
- Uptime (%)
- Tempo médio de resposta às operações críticas (ms)
- Taxa de falhas de backup (%)
- MTTR (Mean Time To Recovery) em minutos
- Número de alertas de segurança por semana
- Capacidade de armazenamento utilizada (%)
- Número de usuários simultâneos (pico)

**Critério de Sucesso:** 99.5%+ uptime, 0 backup failures por semana, MTTR < 30 minutos.

---

### 3.4 Gestor / Proprietário (Negócio)

**Papel:** Tomar decisões estratégicas baseadas em análise de vendas, rentabilidade e operação.

**Responsabilidades:**
- Definir políticas de preço, promoção e estoque.
- Analisar rentabilidade por período, produto, categoria.
- Decidir sobre investimentos em marketing, estoque, expansão.
- Acompanhar KPIs de negócio diariamente.
- Revisar conformidade regulatória.

**Atributos Necessários no Sistema:**
- `usuario_id`: Identificador único
- `nome`: Nome completo
- `nivel_decisao`: Gerente, Diretor, Proprietário
- `area_responsavel`: Matriz, Filial A, Filial B, etc.
- `permissoes`: Visualizar relatórios, análises, exportar dados

**Perguntas de Negócio (O que precisa responder diariamente/semanalmente?):**
- Quanto faturamos ontem/esta semana/este mês?
- Qual foi a margem de lucro por período?
- Quais produtos têm melhor e pior desempenho?
- Qual é o giro de estoque por categoria?
- Há produtos em ruptura (falta de estoque)?
- Como se compara com período anterior (YoY, MoM)?
- Qual é a sazonalidade de vendas?
- Qual é a rentabilidade por cliente/fornecedor?

**KPIs e Métricas:**
- Faturamento diário, semanal, mensal (R$)
- Margem de lucro bruta e líquida (%)
- Ticket médio (R$)
- Número de transações por período
- Giro de estoque por categoria (vez/mês)
- Taxa de ruptura de estoque (%)
- Crescimento YoY e MoM (%)
- Rentabilidade por produto top 10 (%)
- Custo médio de aquisição vs. preço de venda

**Critério de Sucesso:** Relatórios operacionais gerados diariamente, decisões tomadas com base em dados 95%+ do tempo.

---

### 3.5 Fornecedor (Externo)

**Papel:** Fornecer produtos com qualidade, prazo e conformidade.

**Responsabilidades:**
- Entregar produtos no prazo acordado.
- Garantir qualidade e integridade dos produtos.
- Manter documentação de conformidade (laudos, certificados).

**Atributos Necessários no Sistema:**
- `fornecedor_id`: Identificador único
- `nome`: Razão social
- `contato`: Email, telefone, gerente de contas
- `endereco`: Localização
- `prazo_medio_entrega`: Dias entre pedido e recebimento
- `taxa_conformidade`: % de pedidos sem problemas (histórico)
- `categorias_fornecidas`: Quais tipos de produtos fornece

**Perguntas de Negócio:**
- Qual foi o desempenho de entrega do fornecedor X?
- Há qualidade constante?
- Qual é o lead time médio?
- Há fornecedores alternativos para categoria Y?

**KPIs e Métricas:**
- Taxa de on-time delivery (%)
- Taxa de qualidade (produtos recebidos sem defeito, %)
- Lead time médio (dias)
- Número de pedidos por período
- Valor total de compras (R$)
- Taxa de reclamações (%)
- Responsividade a comunicações (horas para responder)

**Critério de Sucesso:** 95%+ de entregas no prazo, 99%+ de qualidade, lead time < 5 dias.

---

### 3.6 Analista de Dados / BI (Analítico)

**Papel:** Criar relatórios, dashboards, previsões e insights para apoiar decisões.

**Responsabilidades:**
- Mapear requisitos analíticos de negócio.
- Criar e manter pipelines de dados (ETL).
- Desenvolver relatórios, KPIs e dashboards.
- Fazer análises exploratórias e previsões.
- Comunicar insights para stakeholders.

**Atributos Necessários no Sistema:**
- `usuario_id`: Identificador único
- `nome`: Nome completo
- `area_atuacao`: Vendas, Estoque, Financeiro, Marketing
- `ferramentas_habeis`: SQL, Python, Tableau, Power BI, etc.
- `permissoes`: Acesso a dados, criar views, exportar para BI

**Perguntas de Negócio (O que precisa fazer?):**
- Como extrair dados de histórico de vendas para análise?
- Quais são os produtos mais rentáveis?
- Há padrões de sazonalidade? Quando é a melhor época para promover?
- Pode fazer previsão de demanda para os próximos 3 meses?
- Qual é a correlação entre preço e quantidade vendida?
- Podemos segmentar clientes por padrão de compra?
- Qual é a estrutura de dados exata para relatório de auditoria?

**KPIs e Métricas:**
- Acurácia de previsões (MAPE < 15%)
- Tempo para gerar novo relatório (horas)
- Qualidade dos dados: completude (% de não-nulos), consistência
- Número de insights acionáveis por semana
- Tempo para responder a dúvida ad-hoc (horas)
- Taxa de utilização de dashboards (% usuários ativos)

**Critério de Sucesso:** Previsões com 85%+ de acurácia, dashboards atualizados diariamente, 0 dados faltando ou inconsistentes.

---

### 3.7 Auditor / Compliance (Governança)

**Papel:** Verificar rastreabilidade, conformidade regulatória e detecção de fraudes.

**Responsabilidades:**
- Revisar registros de vendas controladas para ANVISA.
- Auditar operações críticas (deletar, modificar histórico).
- Detectar padrões suspeitos (ex.: múltiplas tentas de acesso, grandes movimentações).
- Documentar conformidade e relatórios para reguladores.
- Investigar e resolver anomalias.

**Atributos Necessários no Sistema:**
- `usuario_id`: Identificador único
- `nome`: Nome completo
- `permissoes_auditoria`: Acesso a logs imutáveis, dados históricos
- `area_especialidade`: Farmácia, Financeiro, LGPD, etc.
- `contato_regulador`: Se necessário comunicar achados

**Perguntas de Negócio (O que precisa auditar?):**
- Há registro completo de todas as vendas?
- Métodos de venda controlada estão corretos (ex.: receita informada)?
- Há tentativas de alterar histórico ou deletar registros?
- Quem acessou dados sensíveis nos últimos 30 dias e quando?
- Há padrões suspeitos (ex.: grande venda sem receptor registrado)?
- Está completo o armazenamento de dados por 5 anos?
- Há política de LGPD sendo respeitada?

**KPIs e Métricas:**
- Número de inconformidades detectadas por trimestre
- Tempo médio de investigação por anomalia (dias)
- Taxa de resolução de achados (%)
- Conformidade geral com reguladores (%)
- Tempo para responder a requerimento legal (horas)
- Número de auditorias bem-sucedidas (%)
- Cobertura de logs de auditoria (% de operações críticas registradas)

**Critério de Sucesso:** 0 inconformidades não resolvidas, 100% de auditoria reguladora bem-sucedida.

---

## 4. Matriz de Stakeholders vs. Dados

| Stakeholder | Usa Dados de | Precisa de | Frequência |
|-------------|--------------|-----------|-----------|
| Farmacêutico | Histórico, Estoque, Usuário | Alertas, Relatório de conformidade, Auditoria diária | Real-time, Diário |
| Atendente | Produto, Estoque | Consulta de estoque, Recibo | Real-time |
| Admin Sistema | Logs, Métricas de performance | Health check, Alertas de falha, Relatório de uptime | Real-time |
| Gestor | Histórico, Produto, Estoque | Dashboard de vendas, Relatório financeiro, Previsões | Diário, Semanal |
| Fornecedor | Pedidos, Histórico de entrega | KPI de desempenho | Mensal |
| Analista BI | Histórico, Produto, Usuário, Estoque | Dados limpos, Views analíticas, Documentação | Contínuo |
| Auditor | Histórico (completo), Usuário, Logs | Logs imutáveis, Rastreabilidade, Relatórios de conformidade | Sob demanda, Periódico |

---

## 5. Relacionamentos Entre Stakeholders (Quem depende de quem?)

```
┌─────────────────────────────────────────────────────────────┐
│                      FARMACÊUTICO                            │
│  (Valida e autoriza operações críticas)                     │
└──────────┬──────────────────────┬─────────────────────────┬──┘
           │                      │                         │
           v                      v                         v
   ┌─────────────────┐   ┌──────────────────┐   ┌─────────────────┐
   │   ATENDENTE     │   │  ADMINISTRADOR   │   │   AUDITORIA     │
   │ (Registra venda)│   │  (Mantém sistema)│   │ (Verifica tudo) │
   └────────┬────────┘   └─────────┬────────┘   └────────┬────────┘
            │                      │                      │
            └──────────┬───────────┴──────────┬───────────┘
                       v                      v
            ┌──────────────────────┬─────────────────────┐
            │   HISTÓRICO (Central)│                     │
            │  (Movimentações)     │                     │
            └──────────┬───────────┴──────────────┐──────┘
                       │                         │
        ┌──────────────v──────────────┐  ┌───────v──────────┐
        │   GESTOR / PROPRIETÁRIO     │  │  ANALISTA BI     │
        │ (Toma decisões estratég.)   │  │ (Faz previsões)  │
        └─────────────────────────────┘  └──────────────────┘
```

---

## 6. Perguntas-chave por Stakeholder (Mentalidade Analítica)

### Farmacêutico

- ✓ Quantas operações de tarja ocorreram hoje?
- ✓ Há discrepâncias entre esperado e observado?
- ✓ Quais são os alertas de atividade suspeita agora?
- ✓ Qual é o status de conformidade com ANVISA?

### Atendente

- ✓ Qual é o estoque em tempo real do produto X?
- ✓ Qual foi o total de vendas do meu turno?
- ✓ Como gero recibo corretamente?

### Gestor

- ✓ Qual é o faturamento de hoje vs. esperado?
- ✓ Quais categorias têm melhor ROI?
- ✓ Há quantidade de estoque adequada ou há ruptura?
- ✓ Como foi o crescimento YoY?

### Analista BI

- ✓ Qual é a qualidade dos dados históricos?
- ✓ Há correlação entre preço e demanda?
- ✓ Como fazer previsão para próximos 3 meses?
- ✓ Qual é a estrutura exata das tabelas?

### Auditor

- ✓ Há registro completo de todas as operações?
- ✓ Quem access dados sensíveis e quando?
- ✓ Há tentativas de alterar registros históricos?
- ✓ Está tudo em conformidade com reguladores?

---

## 7. Modelo de Dados para Mentalidade Analítica

```
┌─────────────┐         1         N  ┌──────────────┐
│  USUARIO    ├────────────────────────┤  HISTORICO   │
│ (stakeholder)│                       │(rastreamento)│
└─────────────┘                        └──────────────┘
      │                                      │
      │ N                                1   │
      │                                      │
      └─────┬──────────────┬──────────────┬──┘
            │              │              │
      ┌─────v──┐    ┌──────v────┐    ┌───v──────┐
      │ PERFIL │    │ PRODUTO   │    │TIPO_MOV  │
      │(Re)    │    │(commodity)│    │(evento)  │
      └────────┘    └───────────┘    └──────────┘
```

### Atributos Críticos para Análise

- **Usuario:** `usuario_id`, `nome`, `ref_tipo_usuario_id`, `created_at`, `ultimo_login`
- **Historico:** `historico_id`, `usuario_id`, `produto_id`, `quantidade`, `preco_unitario`, `data_hora`, `tipo_movimentacao`, `created_by`, `created_at`
- **Produto:** `produto_id`, `nome`, `sku`, `preco_venda`, `preco_custo`, `estoque_atual`, `ref_classificacao_produto_id`, `ref_tarja_produto_id`
- **Referências:** Manter todas para análise por categoria, tarja, tipo de usuário

---

## 8. KPIs Essenciais (Dashboard Mínimo)

| Área | KPI | Fórmula | Atualização | Responsável |
|------|-----|---------|-------------|-------------|
| Vendas | Faturamento diário | SUM(historico.preco_unitario * quantidade) onde tipo='venda' | Real-time | Gestor |
| Vendas | Ticket médio | Faturamento / Número de transações | Diário | Gestor |
| Estoque | Produtos em ruptura | COUNT(produto) onde estoque_atual = 0 | Real-time | Farmacêutico |
| Estoque | Giro de estoque | Custo de vendas / Estoque médio | Mensal | Gestor |
| Compliance | Conformidade ANVISA | % de vendas controladas com receita registrada | Diário | Auditor |
| Operação | Uptime do sistema | Tempo online / Tempo total | Contínuo | Admin |
| Qualidade | Taxa de erro | Número de correções / Total de operações | Diário | Admin |

---

## 9. Modelo de Maturidade Analítica

| Nível | Característica | Ferramentas | Exemplo |
|-------|----------------|-----------|---------|
| L1 (Descritivo) | Relatar o que aconteceu | Relatórios simples em Excel | "Vendemos R$ 5K ontem" |
| L2 (Diagnóstico) | Entender por que aconteceu | SQL queries, Dashboards | "Vendemos 5K porque houve promoção no sábado" |
| L3 (Preditivo) | Prever o que vai acontecer | ML, séries temporais | "Esperamos venda de R$ 6K no próximo sábado se houver promoção similar" |
| L4 (Prescritivo) | Recomendar o que fazer | IA, otimização | "Recomendamos promoção em categorias X e Y para maximizar margem" |

**Meta:** Atingir L2-L3 em 6 meses, L4 em 12 meses.

---

## 10. Governança de Dados

### Qualidade de Dados

- **Completude:** 100% dos campos obrigatórios preenchidos
- **Consistência:** Dados alinham com regras de negócio (ex.: estoque nunca negativo)
- **Acurácia:** Dados conferem com fonte de verdade (ex.: inventário físico vs. sistema)
- **Tempestividade:** Atualização em tempo real para dados críticos

### Propriedade de Dados

- **Camadas:**
  - Operacional: Atendente / Farmacêutico (escreve)
  - Analítica: Analista BI (lê, transforma)
  - Governança: Auditor (valida)

- **Responsabilidades:**
  - Farmacêutico: Qualidade de histórico crítico
  - Admin: Backup, disponibilidade
  - Analista BI: Transformação e documentação
  - Auditor: Conformidade e rastreabilidade

---

## 11. Próximos Passos

1. **Validar com stakeholders:** Apresentar este mapa e coletar feedback.
2. **Priorizar KPIs:** Definir top 5 KPIs por stakeholder para MVP.
3. **Desenhar dashboards:** Mockups de visualizações essenciais.
4. **Definir SLAs:** Frequência de atualização, acurácia esperada.
5. **Começar coleta:** Alimentar repositório de KPIs com dados históricos.

---

**Versão:** 1.0 | **Data:** 21 de fevereiro de 2026 | **Próxima revisão:** Trimestral ou após mudança de negócio
