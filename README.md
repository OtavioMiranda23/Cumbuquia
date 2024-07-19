#  Desafio CLI

Desafio realizado utilizando **Elixir 1.16.2** e **Erlang/OTP 25**.

## Como rodar

O build da aplicação já foi feito, tratando-se do arquivo `desafio_cli`. É apenas necessário rodar o comando `escript desafio_cli`.

## Instruções Gerais

Caso seja preciso fazer um novo build, além de ter instalado [instalar o Elixir](https://elixir-lang.org/install.html)
em versão igual ou superior a **1.16**,  é necessário: <br>

- Para buildar o projeto, use o comando `mix escript.build` na pasta raiz.
- Para executar, basta escrever o comando `escript desafio_cli`.
- Executando o binário, a CLI será executada.


## Features

- **Testes Unitários (ExUnit)** para validação de 
funcionalidade e prevenção de regressões.  <br>

- **Pattern Matching,  Desconstrução de Lista e Recursão** para processamento eficiente de listas e dados.
- **Imutabilidade** para garantir segurança e previsibilidade no código. <br>

- **Typespecs e Dialyzer** para verificação estática de tipos e documentação clara. <br>

- **Uso de Módulos e Funções Privadas** para modularidade e encapsulamento da lógica. <br>

- Enumeração e Transformação de Dados com o módulo **Enum e Map**. <br>

- Separação de Preocupações para uma **arquitetura de código limpa e organizada**. <br>

- Ferramentas de Qualidade de Código como **Credo** para garantir boas práticas. <br>

- **Versionamento**, obedecendo Conventional Commits.

## Planejamento

Optei por construir a aplicação obedecendo o seguinte fluxo: 
- Captação dos dados de entrada -> Numeração para arábico -> Conversão para algarismos romanos  <br>

Procurei demonstrar os dados na tela da mesma maneira que foi solicitada no desafio, ou seja, em colunas, um seguido do outro.
