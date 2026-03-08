# Dicionário de Dados — Farmacia

---

## 1. Principais — tb_produto

| Campo                    | Tipo          | Restrições                                                       | Obrigatório | Descrição                                                           |
|--------------------------|---------------|------------------------------------------------------------------|-------------|---------------------------------------------------------------------|
| id_produto               | bigint        | primary key, unsigned, auto increment                            | Sim         | Identificador automático único do produto.                          |
| fk_classificacao_produto | tinyint       | foreign key → ref_classificacao_produto.id_classificacao_produto | Sim         | Referência à classificação do produto (ex.: medicamento cosmético). |
| fk_tarja_produto         | tinyint       | foreign key → ref_tarja_produto.id_tarja_produto                 | Sim         | Referência à tarja do produto (ex.: vermelha, amarela, sem tarja).  |
| fk_usuario               | char(11)      | foreign key → tb_usuario.cpf_usuario                             | Sim         | Referência ao usuário responsável pelo cadastro do produto.         |
| quantidade_produto       | int           |                                                                  | Sim         | Quantidade em estoque do produto.                                   |
| preco_produto            | decimal(15,2) |                                                                  | Sim         | Preço unitário do produto.                                          |
| data_fabricacao_produto  | date          |                                                                  | Sim         | Data de fabricação do produto.                                      |
| data_validade_produto    | date          |                                                                  | Sim         | Data de validade do produto.                                        |
| nome_produto             | varchar(200)  |                                                                  | Sim         | Nome do produto.                                                    |
| fabricante_produto       | varchar(100)  |                                                                  | Sim         | Nome do fabricante do produto.                                      |
| descricao_produto        | text          |                                                                  | Sim         | Descrição detalhada do produto.                                     |

---

## 2. Principais — tb_usuario

| Campo               | Tipo         | Restrições                                             | Obrigatório | Descrição                                               |
|---------------------|--------------|--------------------------------------------------------|-------------|---------------------------------------------------------|
| cpf_usuario         | char(11)     | primary key                                            | Sim         | CPF do usuário (apenas números, 11 dígitos).            |
| fk_situacao_usuario | tinyint      | foreign key → ref_situacao_usuario.id_situacao_usuario | Sim         | Referência à situação do usuário (ex.: ativo, inativo). |
| fk_genero           | tinyint      | foreign key → ref_genero.id_genero                     | Sim         | Referência ao gênero do usuário.                        |
| nome_usuario        | varchar(45)  |                                                        | Sim         | Nome do usuário.                                        |
| sobrenome_usuario   | varchar(45)  |                                                        | Sim         | Sobrenome do usuário.                                   |
| email_usuario       | varchar(100) | unique                                                 | Sim         | E-mail do usuário (único no sistema).                   |
| senha_usuario       | varchar(255) |                                                        | Sim         | Senha do usuário (armazenada de forma segura).          |
| telefone_usuario    | varchar(19)  | unique                                                 | Sim         | Telefone do usuário (único no sistema).                 |

---

## 3. Principais — tb_cidade

| Campo       | Tipo         | Restrições                                            | Obrigatório | Descrição                                 |
|-------------|--------------|-------------------------------------------------------|-------------|-------------------------------------------|
| id_cidade   | int          | primary key, unsigned, auto increment                 | Sim         | Identificador automático único da cidade. |
| fk_estado   | char(2)      | foreign key → ref_estado.sigla_uf                     | Sim         | Referência ao estado (UF) da cidade.      |
| nome_cidade | varchar(100) | unique com fk_estado (uk_cidade_por_estado)           | Sim         | Nome da cidade.                           |

---

## 4. Principais — tb_endereco

| Campo                | Tipo         | Restrições                            | Obrigatório | Descrição                                   |
|----------------------|--------------|---------------------------------------|-------------|---------------------------------------------|
| id_endereco          | int          | primary key, unsigned, auto increment | Sim         | Identificador automático único do endereço. |
| fk_cidade            | int          | foreign key → tb_cidade.id_cidade     | Sim         | Referência à cidade do endereço.            |
| fk_usuario           | char(11)     | foreign key → tb_usuario.cpf_usuario  | Sim         | Referência ao usuário dono do endereço.     |
| cep_endereco         | char(8)      |                                       | Sim         | CEP (apenas números, 8 dígitos).            |
| logradouro_endereco  | varchar(150) |                                       | Sim         | Logradouro (rua, avenida, etc.).            |
| numero_endereco      | varchar(10)  |                                       | Sim         | Número do endereço.                         |
| complemento_endereco | varchar(50)  |                                       | Não         | Complemento (bloco, apto, etc.).            |
| bairro_endereco      | varchar(100) |                                       | Sim         | Bairro.                                     |

---

## 5. Principais — tb_historico

| Campo                            | Tipo      | Restrições                                               | Obrigatório | Descrição                                                              |
|----------------------------------|-----------|----------------------------------------------------------|-------------|------------------------------------------------------------------------|
| id_historico                     | bigint    | primary key, unsigned, auto increment                    | Sim         | Identificador automático único do histórico.                           |
| fk_alteracao                     | tinyint   | foreign key → ref_alteracao.id_alteracao                 | Sim         | Referência ao tipo de alteração do histórico.                          |
| fk_tipo_movimentacao             | tinyint   | foreign key → ref_tipo_movimentacao.id_tipo_movimentacao | Sim         | Referência ao tipo de movimentação (entrada/saída).                    |
| fk_produto                       | bigint    | foreign key → tb_produto.id_produto                      | Sim         | Referência ao produto que foi movimentado.                             |
| fk_usuario                       | char(11)  | foreign key → tb_usuario.cpf_usuario                     | Sim         | Referência ao usuário que realizou a movimentação.                     |
| quantidade_historico             | int       |                                                          | Sim         | Quantidade em estoque no momento do registro (ou após a movimentação). |
| quantidade_movimentada_historico | int       |                                                          | Sim         | Quantidade movimentada (entrada ou saída) neste registro.              |
| data_hora_historico              | timestamp |                                                          | Sim         | Data e hora em que o histórico foi registrado.                         |

---

## 6. Referenciais — ref_estado

| Campo       | Tipo         | Restrições                            | Obrigatório | Descrição                                                |
|-------------|--------------|---------------------------------------|-------------|----------------------------------------------------------|
| sigla_uf    | char(2)      | primary key                           | Sim         | Sigla da UF (estado) — ex.: SP, RJ.                     |
| nome_estado | varchar(50)  | unique                                | Sim         | Nome do estado.                                          |

---

## 7. Referenciais — ref_alteracao

| Campo          | Tipo        | Restrições                            | Obrigatório | Descrição                                               |
|----------------|-------------|---------------------------------------|-------------|---------------------------------------------------------|
| id_alteracao   | tinyint     | primary key, unsigned, auto increment | Sim         | Identificador automático único do tipo de alteração.    |
| nome_alteracao | varchar(45) | unique                                | Sim         | Nome do tipo de alteração no histórico de movimentação. |

---

## 8. Referenciais — ref_classificacao_produto

| Campo                      | Tipo        | Restrições                            | Obrigatório | Descrição                                                       |
|----------------------------|-------------|---------------------------------------|-------------|-----------------------------------------------------------------|
| id_classificacao_produto   | tinyint     | primary key, unsigned, auto increment | Sim         | Identificador automático único da classificação.                |
| nome_classificacao_produto | varchar(45) | unique                                | Sim         | Nome da classificação do produto (ex.: medicamento, cosmético). |

---

## 9. Referenciais — ref_genero

| Campo       | Tipo        | Restrições                            | Obrigatório | Descrição                                 |
|-------------|-------------|---------------------------------------|-------------|-------------------------------------------|
| id_genero   | tinyint     | primary key, unsigned, auto increment | Sim         | Identificador automático único do gênero. |
| nome_genero | varchar(45) | unique                                | Sim         | Nome do gênero.                           |

---

## 10. Referenciais — ref_situacao_usuario

| Campo                 | Tipo        | Restrições                            | Obrigatório | Descrição                                          |
|-----------------------|-------------|---------------------------------------|-------------|----------------------------------------------------|
| id_situacao_usuario   | tinyint     | primary key, unsigned, auto increment | Sim         | Identificador automático único da situação.        |
| nome_situacao_usuario | varchar(45) | unique                                | Sim         | Nome da situação do usuário (ex.: ativo, inativo). |

---

## 11. Referenciais — ref_tarja_produto

| Campo              | Tipo        | Restrições                            | Obrigatório | Descrição                                                     |
|--------------------|-------------|---------------------------------------|-------------|---------------------------------------------------------------|
| id_tarja_produto   | tinyint     | primary key, unsigned, auto increment | Sim         | Identificador automático único da tarja.                      |
| nome_tarja_produto | varchar(45) | unique                                | Sim         | Nome da tarja do produto (ex.: vermelha, amarela, sem tarja). |

---

## 12. Referenciais — ref_tipo_movimentacao

| Campo                  | Tipo        | Restrições                            | Obrigatório | Descrição                                               |
|------------------------|-------------|---------------------------------------|-------------|---------------------------------------------------------|
| id_tipo_movimentacao   | tinyint     | primary key, unsigned, auto increment | Sim         | Identificador automático único do tipo de movimentação. |
| nome_tipo_movimentacao | varchar(45) | unique                                | Sim         | Nome do tipo de movimentação (ex.: entrada, saída).     |

---

## 13. Referenciais — ref_tipo_usuario

| Campo             | Tipo        | Restrições                            | Obrigatório | Descrição                                                            |
|-------------------|-------------|---------------------------------------|-------------|----------------------------------------------------------------------|
| id_tipo_usuario   | tinyint     | primary key, unsigned, auto increment | Sim         | Identificador automático único do tipo de usuário.                   |
| nome_tipo_usuario | varchar(45) | unique                                | Sim         | Nome do tipo/perfil do usuário (ex.: admin, farmacêutico, vendedor). |

---

## 14. Associativa — tb_usuario_has_ref_tipo_usuario

| Campo                            | Tipo     | Restrições                                                             | Obrigatório | Descrição                             |
|----------------------------------|----------|------------------------------------------------------------------------|-------------|---------------------------------------|
| ref_tipo_usuario_id_tipo_usuario | tinyint  | primary key (composta), foreign key → ref_tipo_usuario.id_tipo_usuario | Sim         | Referência ao tipo/perfil do usuário. |
| tb_usuario_cpf_usuario           | char(11) | primary key (composta), foreign key → tb_usuario.cpf_usuario           | Sim         | Referência ao usuário.                |

**Nota:** Tabela associativa N:N entre usuário e tipo de usuário (um usuário pode ter vários perfis e um perfil pode estar em vários usuários).
