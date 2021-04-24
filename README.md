# README
INSTALAÇÃO DE GEMS:
Para instalar todas as gems do projeto, execute o comando "bundle install" no terminal. Você pode ver quais as gems que são usadas, no arquivo "Gemfile".

=======================================================================================================================================================

CONFIGURAÇÃO DE BANCO DE DADOS:
Crie um arquivo ".env" baseado no ".env.example" presente no projeto. Informe o usuario e senha de seu banco de dados nas respectivas variaveis POSTGRES_USERNAME e POSTGRES_PASSWORD

=======================================================================================================================================================

EXECUÇÃO NO SERVIDOR:
Para rodar a aplicação no servidor, digite "rails s". Se quiser passar o número de uma porta, digite "rails s -p numerodaporta". Ex: "rails s -p 8081"

=======================================================================================================================================================

ENDPOINTS:

Cadastrar um usuário:
POST: "/auth"
request body: {
                "name": "John Doe",
                "email": "johndoe@example.com",
                "password": "123456789"
              }

-------------------------------------------------------------------------------------------------------------------------------------------------------

Login:
POST: "/auth/sign_in"
request body: {
                "email": "johndoe@example.com",
                "password": "123456789"
              }

-------------------------------------------------------------------------------------------------------------------------------------------------------

Logout:
DELETE: "/auth/sign_out"

-------------------------------------------------------------------------------------------------------------------------------------------------------

Cadastrar um local:
POST: "/places"
request body: {
                "place": {
                    "name": "São Paulo",
                    "lat": -23.517304087332068, 
                    "lng": -46.63105393831187,
                    "user_id": 1
                }
              }

-------------------------------------------------------------------------------------------------------------------------------------------------------

Cadastrar uma avaliação para um local:
POST: "/reviews"
request body: {
                "review": {
                    "rating": "ok",
                    "comment": "lorem ipsum text",
                    "user_id": 1
                    "place_id": 2
                }
              }

-------------------------------------------------------------------------------------------------------------------------------------------------------

Visualizar perfil do usuário logado:
GET: "/users/id"

-------------------------------------------------------------------------------------------------------------------------------------------------------

Visualizar as avaliações de um local:
GET: "/reviews/id"

-------------------------------------------------------------------------------------------------------------------------------------------------------

Carregar lista de locais cadastrados:
GET: "/places"

-------------------------------------------------------------------------------------------------------------------------------------------------------

Editar email e senha do usuário logado:
PUT: "/users/id"
request body: {
                "user": {
                    "email": "janedoe@example.com",
                    "password": "novasenha123",
                    "name": "Jane Doe"
                }
              }
