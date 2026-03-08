# Manual de Inicialização do Projeto

Este documento descreve, passo a passo, como baixar o projeto pelo terminal, conectar-se ao servidor MySQL e executar o script de deploy (`deploy.sql`).

---

## 1. Pré-requisitos

- Git instalado ([https://git-scm.com/](https://git-scm.com/)).
- MySQL Server 8.0 (ou compatível) instalado no Windows.
- Acesso ao terminal (CMD).
- Credenciais de usuário MySQL (por exemplo, `root` e senha).

> **Nota:** o projeto presume que você tenha permissões para criar bancos de dados e tabelas.

---

## 2. Clonar o repositório

Abra um prompt CMD (Command Prompt) e execute os comandos abaixo para clonar o repositório para sua máquina:

```cmd
cd "C:\Users\SeuUsuario\Documentos"

git clone https://github.com/PabloCarvalhoSilvaDev/farmacia.git

cd farmacia
```

> **Dica:** ajuste o caminho conforme sua organização de pastas.

---

## 3. Preparar o script de deploy

O arquivo `deploy/deploy.sql` coordena a criação do banco e de todas as tabelas na ordem certa. Certifique-se de que o caminho está correto e atualizado (em trabalhos futuros o script pode ser automatizado no `Iniciar o projeto.bat`).

---

## 4. Executar o deploy via linha de comando

Ainda na raiz do projeto (`farmacia`), no prompt CMD, execute:

```cmd
cd deploy

"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p < deploy.sql
```

Digite a senha quando solicitado. O comando cria o banco `farmacia` e importa todas as tabelas.

### Alternativa: dentro do cliente MySQL

Você também pode entrar no cliente e carregar o script manualmente:

```cmd
cd "C:\Users\SeuUsuario\Documentos\farmacia\deploy"

"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p
```

Digite a senha. Dentro do prompt do MySQL, execute:

```sql
SOURCE deploy.sql;
``` 

> **Importante:** use barras `/` no caminho dentro do cliente (Windows aceita). O `SOURCE` deve terminar com `;`.

#### Problemas comuns

- **`mysql` não é reconhecido:** o executável não está no `PATH`. use o caminho completo (como acima) ou adicione `C:\Program Files\MySQL\MySQL Server 8.0\bin` à variável de ambiente `PATH`.
- **Erro ao abrir o arquivo `deploy.sql`:** verifique se você está no diretório correto antes de executar `SOURCE` ou use o caminho absoluto. Lembre-se de que o comando `SOURCE` só funciona dentro do prompt do MySQL.
- **Caminho com espaços:** envolva em aspas ou use barras `/` dentro do prompt. Por exemplo:
  ```sql
  SOURCE "C:/Users/PC/OneDrive/Documentos/farmacia/deploy/deploy.sql";
  ```

---

## 5. Verificar se o deploy foi bem-sucedido

No prompt do MySQL, execute:

```sql
USE farmacia;
SHOW TABLES;
```

Você deve ver a lista de tabelas criadas.

---

## 6. Próximos passos

- Adicione seeds, procedures e demais objetos se necessário.
- Configure scripts de backup e rotina de migrações.
- Documente alterações no `docs/` ou no README.

Boa sorte com o projeto! 🚀
