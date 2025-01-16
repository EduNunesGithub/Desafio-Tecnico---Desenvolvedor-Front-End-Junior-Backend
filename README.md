# Projeto Rails API

Este é um projeto de API desenvolvido com Ruby on Rails. O objetivo deste projeto é fornecer uma API robusta que possa ser utilizada para gerenciar dados relacionados a veículos e empresas. A API inclui funcionalidades de CRUD, validações e relacionamento entre modelos.

## Tecnologias Utilizadas

- Ruby 3.1.4
- Rails 7.1.5
- SQLite3 (Padrão do rails)
- Faker (para dados de exemplo)
- Kaminari (para paginação)
- Swagger Api e Swagger UI (para docuemntação automática da API)

## Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas em sua máquina:

- [Ruby](https://www.ruby-lang.org/en/documentation/): Para rodar o ambiente Rails.
- [Rails](https://rubyonrails.org/): Para desenvolvimento e execução do projeto.
- [Swagger](https://swagger.io/): Para documentação das APIs desenvolvidas

### Instalação do Ruby (caso necessário)

1. Baixe e instale o Ruby através do [site oficial](https://www.ruby-lang.org/en/documentation/).
2. Após instalar, verifique se está funcionando corretamente rodando:

```bash
ruby -v
```

## Lista de comandos do Setup:
Rodar essa lista de comandos em sequeência para que seja possível utilizar a aplicação:

- **`bundle install`**: Instala todas as dependências Ruby listadas no `Gemfile`.
- **`yarn install`**: Instala todas as dependências JavaScript listadas no `package.json`.
- **`rails db:create db:migrate db:seed`**: Cria o banco de dados, aplica as migrações e popula com os dados de exemplo.
- **`rails g rswag:install`**: Instala as dependências do swagger
- **`rswag:specs:swaggerize`**: Cria a documentação da api com o swagger
- **`rails s`**: Inicia o servidor Rails em `localhost:3000` para desenvolvimento local.