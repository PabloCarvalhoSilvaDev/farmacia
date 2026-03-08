# Regras de Negócio

Este documento centraliza as políticas, restrições e fluxos que regem o funcionamento
do sistema da farmácia. As regras aqui descritas devem ser implementadas por meio
de validações no banco de dados (constraints, triggers), lógica de aplicação e
procedimentos operacionais.

> **Importante:** a mentalidade analítica (arquivo `mentalidade_analitica.md`) trata
> de stakeholders e métricas; ela não substitui este documento.

## Estrutura sugerida

1. **Validações de integridade**
   - Obrigatoriedade de campos
   - Valores permitidos (enumerados)
   - Restrições entre tabelas (ex.: não permitir venda se estoque zerado)

2. **Fluxos operacionais**
   - Como uma venda é realizada passo a passo
   - Processo de estorno/cancelamento
   - Movimentação de estoque (entrada, saída, ajuste)

3. **Políticas de autorização**
   - Quem pode autorizar venda de tarja? (farmacêutico com permissão `autoriza_tarja`)
   - Limites de desconto por nível de usuário

4. **Regras de conformidade**
   - Registro obrigatório de receita para produtos controlados
   - Tempo de retenção de histórico (ex.: 5 anos)

5. **Dados mestres e referenciais**
   - Regras de nomeação e manutenção (ex.: apenas administradores podem
     cadastrar `ref_tarja_produto`)

6. **Outras regras**
   - Cálculo de preço final (preço base + impostos)
   - Gatilhos automáticos (ex.: enviar alerta se estoque < mínimo)


## Como utilizar

- Atualize este arquivo sempre que uma nova política for definida ou alterada.
- Referencie-o em treinamentos operacionais e em diagramas de arquitetura.
- Use-o como fonte para criar constraints e testes automatizados.


---

*Versão:* 1.0 | *Data:* 28 de fevereiro de 2026