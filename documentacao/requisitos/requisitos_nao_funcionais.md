# Requisitos Não Funcionais

## 1. Objetivo

Documentar requisitos não funcionais (RNF) do sistema de farmácia. Um requisito não funcional descreve **como o sistema deve se comportar** — qualidades, limitações, restrições técnicas e atributos de qualidade que não descrevem uma funcionalidade específica, mas sim características de desempenho, segurança, disponibilidade, etc.

## 2. Escopo

Este documento cobre:
- Segurança e autenticação
- Performance e escalabilidade
- Disponibilidade e recuperação
- Integridade de dados
- Usabilidade
- Conformidade e governança

---

## 3. Requisitos Não Funcionais Principais

### RNF1: Autenticação e Autorização (Segurança)

**Descrição:** O sistema deve validar identidade e controlar permissões com segurança.

**Critérios de Aceitação:**
- Exigir login com email/CPF e senha.
- Armazenar senhas com hash (ex.: bcrypt) com salt aleatório.
- Implementar autenticação multifatorial (MFA) para Administrador e Auditor.
- Expirar sessão após inatividade de 30 minutos.
- Registrar todas as tentativas de login falhas (log de segurança).
- Bloquear conta após 5 tentativas falhas consecutivas (liberar após 24h ou por admin).
- Suportar RBAC (Role-Based Access Control) com permissões por perfil.
- Não permitir acesso direto a dados sensíveis (ex.: CPF, senhas) para usuários sem autorização.

**Métricas:**
- Tempo de resposta de autenticação: < 1 segundo
- Cobertura de auditoria de login: 100%

---

### RNF2: Criptografia de Dados em Trânsito e em Repouso

**Descrição:** Dados sensíveis devem ser protegidos de interceptação e acesso não autorizado.

**Critérios de Aceitação:**
- Usar HTTPS/TLS 1.2+ para todas as conexões web.
- Criptografar dados sensíveis em repouso (CPF, dados bancários, histórico médico) usando AES-256.
- Selecionar e usar certificados SSL válidos, renovados automaticamente.
- Nunca armazenar senhas em texto plano.
- Criptografar backups com chave independente.

**Métricas:**
- 100% de dados sensíveis em repouso criptografados.
- Certificado SSL válido em 100% das conexões.

---

### RNF3: Integridade e Consistência de Dados

**Descrição:** O sistema deve garantir que dados críticos permaneçam íntegros e consistentes.

**Critérios de Aceitação:**
- Manter relacionamentos referenciados corretamente (FK constraints).
- Implementar transações ACID para operações críticas (vendas, ajuste de estoque).
- Executar checksum periódico em tabelas críticas (detectar corrupção).
- Manter logs imutáveis com append-only para auditoria (histórico nunca deve ser deletado retroativamente).
- Validar integridade de imports de dados (soma de valores, contagem de registros).
- Recuperar de falhas parciais (ex.: queda durante venda = reverter tudo ou nada).

**Métricas:**
- Taxa de anomalias detectadas: 0 em produção (mensal).
- Tempo para detectar inconsistência: < 24 horas.

---

### RNF4: Performance e Responsividade

**Descrição:** O sistema deve responder rapidamente às solicitações do usuário.

**Critérios de Aceitação:**
- Tempo de resposta para consultas simples (ex.: listar produtos): < 1 segundo.
- Tempo de resposta para relatórios (ex.: vendas mensais): < 5 segundos (até 10K registros).
- Tempo de resposta para consulta de estoque: < 500 ms.
- Capacidade de processar 100 operações simultâneas (vendas/movimentações).
- Indexar corretamente campos de busca frequente (SKU, CPF, data).
- Implementar cachê em camada de aplicação para dados que mudam raro (ex.: classificações, produtos).
- Paginação obrigatória em listagens com mais de 100 registros.

**Métricas:**
- P95 de latência para transação de venda: < 2 segundos.
- P99 de latência para relatório: < 10 segundos.
- Throughput: >= 50 transações por segundo.

---

### RNF5: Disponibilidade e Recuperação de Desastres

**Descrição:** O sistema deve estar disponível e recuperável em caso de falhas.

**Critérios de Aceitação:**
- Manter uptime de 99.5% em produção (máx. ~3.6h de parada por mês).
- Executar backups automáticos diários (preferencialmente incremental).
- Manter 3 gerações de backup (diário, semanal, mensal).
- Testar restauração de backup mensalmente.
- RTO (Recovery Time Objective): <= 4 horas.
- RPO (Recovery Point Objective): <= 1 hora (máx. 1 hora de dados perdidos).
- Possuir plano de continuidade de negócio documentado.
- Suportar failover automático ou manual para servidor standby.

**Métricas:**
- Tempo para restauração completa: testado mensalmente.
- Ocorrências de falha catastrófica: 0 por trimestre.

---

### RNF6: Escalabilidade

**Descrição:** O sistema deve suportar crescimento sem degradação significativa de performance.

**Critérios de Aceitação:**
- Arquitetura deve suportar 1.5x do volume de dados esperado em 2 anos.
- Capacidade de adicionar cópias de leitura sem interrupção.
- Particionamento de dados (sharding) se volume de histórico exceder 100GB.
- Armazenamento separado para dados históricos (arquivamento após 5 anos).
- Suportar adição de novos módulos/funcionalidades sem refatoração completa.

**Métricas:**
- Taxa de crescimento de dados monitorada mensalmente.
- Teste de carga com 2x do volume esperado: sucesso em < 3 meses.

---

### RNF7: Usabilidade

**Descrição:** O sistema deve ser fácil de usar para usuários com diferentes níveis técnicos.

**Critérios de Aceitação:**
- Interface limpa e intuitiva (design responsivo, mobile-friendly).
- Menus e botões com ícones e rótulos claros em português.
- Suporte a atalhos de teclado para operações frequentes.
- Validação de entrada clara com mensagens de erro amigáveis.
- Tempo de treinamento máximo de 4 horas para novo atendente.
- Documentação em vídeo/texto para procedimentos críticos.
- Modo "escuro" opcional para reduzir fadiga visual.

**Métricas:**
- Taxa de sucesso em tarefa comum (venda): >= 95% sem suporte.
- NPS (Net Promoter Score) para usabilidade: >= 50.

---

### RNF8: Manutenibilidade e Suporte

**Descrição:** O sistema deve ser fácil de manter e evoluir.

**Critérios de Aceitação:**
- Código deve ser versionado em Git com histórico claro.
- Documentação técnica atualizada (arquitetura, banco de dados, APIs).
- Logs estruturados e centralizados para troubleshooting rápido.
- Alertas configuráveis para eventos críticos (queda de performance, falhas, warnings).
- Documentação de deployment e rollback para cada versão.
- Ciclo de release máximo de 2 semanas.
- Suportar patch de segurança sem downtime da operação.

**Métricas:**
- Tempo médio de resposta a bug crítico: 4 horas.
- Tempo para fazer deploy: < 30 minutos.
- Cobertura de código com testes: >= 70%.

---

### RNF9: Conformidade Legal e Regulatória

**Descrição:** O sistema deve atender a requisitos legais e regulatórios da farmácia.

**Critérios de Aceitação:**
- Estar em conformidade com Lei Geral de Proteção de Dados (LGPD).
- Registrar todas as operações de vendas controladas conforme exigência da ANVISA.
- Reter logs de auditoria por no mínimo 5 anos.
- Suportar consultas de órgãos reguladores (ANVISA, Receita Federal).
- Implementar controles para detecção de fraude e operações suspeitas.
- Ter política de privacidade clara e consentimento do usuário registrado.
- Permitir direito ao esquecimento (LGPD): anonimizar dados após retenção legal.

**Métricas:**
- 0 auditagens falhas por conformidade por ano.
- Tempo para resposta a requerimento legal: <= 2 dias úteis.

---

### RNF10: Compatibilidade e Padrões

**Descrição:** O sistema deve usar tecnologias e padrões aceitos (evitar vendor lock-in).

**Critérios de Aceitação:**
- Banco de dados: SQL padrão (suportar migração para PostgreSQL, MySQL, SQL Server).
- API: REST com padrão OpenAPI 3.0 documentado.
- Formato de dados: JSON para APIs, CSV para exportação.
- Formato aberto para relatórios: PDF com dados estruturados.
- Suportar integração com sistemas de terceiros (ex.: ERP, NF-e) via API ou webhook.
- Evitar dependências de software proprietário onde possível (favor open source).

**Métricas:**
- Compatibilidade com 2+ SGBDs: testada a cada versão.
- Documentação de API: 100% em OpenAPI 3.0.

---

### RNF11: Observabilidade e Monitoramento

**Descrição:** O sistema deve ser observável para detecção de problemas e otimização.

**Critérios de Aceitação:**
- Logs centralizados com níveis (DEBUG, INFO, WARN, ERROR).
- Métricas de negócio: número de vendas, valor, erros (enviadas a ferramenta de monitoring).
- Tracing distribuído para seguir requisição através da arquitetura.
- Dashboard de health check mostrando status de dependências (BD, cache, APIs externas).
- Alertas automáticos para anomalias (taxa de erro > 5%, latência > 10s, estoque crítico).

**Métricas:**
- Alertas respondidos em <= 15 minutos.
- Dashboard disponível 99% do tempo.

---

### RNF12: Localização e Internacionalização

**Descrição:** O sistema deve suportar pt-BR com possibilidade de expansão.

**Critérios de Aceitação:**
- Todos os textos em português (Brasil).
- Suporte a formatação local: data (DD/MM/YYYY), moeda (R$), números (x.xxx,xx).
- Documentação pode estar em português ou inglês.
- Arquitetura preparada para traduções futuras (chaves de string, não hard-coded).

---

## 4. Matriz de Requisitos Não Funcionais vs. Funções

| RNF | RF1 | RF2 | RF3 | RF4 | RF5 | RF6 | RF7 | RF8 | Crítico? |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|----------|
| RNF1 (Autenticação) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | SIM |
| RNF2 (Criptografia) | ✓ | ✗ | ✗ | ✗ | ✓ | ✗ | ✗ | ✗ | SIM |
| RNF3 (Integridade) | ✗ | ✗ | ✓ | ✓ | ✓ | ✗ | ✗ | ✗ | SIM |
| RNF4 (Performance) | ✗ | ✗ | ✓ | ✓ | ✗ | ✓ | ✗ | ✗ | SIM |
| RNF5 (Disponibilidade) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | SIM |
| RNF6 (Escalabilidade) | ✗ | ✗ | ✗ | ✓ | ✓ | ✗ | ✗ | ✗ | NÃO |
| RNF7 (Usabilidade) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | SIM |
| RNF8 (Manutenibilidade) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | SIM |
| RNF9 (Conformidade) | ✗ | ✗ | ✗ | ✓ | ✓ | ✗ | ✗ | ✗ | SIM |
| RNF10 (Compatibilidade) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | NÃO |
| RNF11 (Observabilidade) | ✗ | ✗ | ✗ | ✗ | ✓ | ✗ | ✗ | ✗ | SIM |
| RNF12 (Localização) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | SIM |

---

## 5. Priorização (MoSCoW)

- **MUST (Críticos):** RNF1, RNF2, RNF3, RNF4, RNF5, RNF7, RNF8, RNF9, RNF11, RNF12
- **SHOULD (Importantes):** RNF6, RNF10
- **COULD (Desejável):** Melhorias adicionais de performance
- **WON'T (Fora do escopo):** Suporte a idiomas além de pt-BR em v1.0

---

## 6. Testes de Validação

Cada RNF deve ter testes automatizados:

| RNF | Tipo de Teste | Exemplo |
|-----|---------------|---------|
| RNF1 | Teste de segurança | Tentar login com senha inválida 6x → conta bloqueada |
| RNF2 | Teste de criptografia | Verificar hash de senha em banco → não é texto plano |
| RNF3 | Teste de integridade | Violar FK constraint → falha esperada |
| RNF4 | Teste de performance | Load test com 100 usuários simultâneos → P95 < 2s |
| RNF5 | Teste de DR | Restaurar backup em 4 horas → sucesso |
| RNF7 | Teste de usabilidade | Novo usuário fazer venda em < 5 min → sucesso |

---

## 7. Métricas de Sucesso (SLAs)

| Métrica | Target | Frequência de Verificação |
|---------|--------|---------------------------|
| Uptime | 99.5% | Mensal |
| Latência P95 (venda) | < 2s | Diária |
| Taxa de erro | < 0.5% | Diária |
| MTTR (tempo para reparo) | < 30 min | Mensal |
| Cobertura de testes | >= 70% | A cada build |
| Auditoria conformidade | 0 falhas | Semestral |

---

**Versão:** 1.0 | **Data:** 21 de fevereiro de 2026 | **Revisão obrigatória:** Anualmente ou após mudança de arquitetura
