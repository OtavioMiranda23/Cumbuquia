    #  Desafio CLI

    Desafio realizado utilizando **Elixir 1.16.2** e **Erlang/OTP 25**.

    ## Como rodar

    Primeiro, será necessário [instalar o Elixir](https://elixir-lang.org/install.html)
    em versão igual ou superior a **1.16**.

    - Para buildar o projeto, use o comando `mix escript.build` na pasta raiz.
    - Para executar, basta escrever o comando `escript desafio_cli`.
    - Executando o binário, sua CLI será executada.


    ## Features

    - **Testes Unitários (ExUnit)** para validação de funcionalidade e prevenção de regressões.
    - **Pattern Matching,  Desconstrução de Lista e Recursão** para processamento eficiente de listas e dados.
    - **Imutabilidade** para garantir segurança e previsibilidade no código.
    - **Typespecs e Dialyzer** para verificação estática de tipos e documentação clara.
    - **Uso de Módulos e Funções Privadas** para modularidade e encapsulamento da lógica.
    - Enumeração e Transformação de Dados com o módulo **Enum e Map**.
    - Separação de Preocupações para uma **arquitetura de código limpa e organizada**.
    - Ferramentas de Qualidade de Código como **Credo** para garantir boas práticas.

    ## Planejamento

    Optei por construir a aplicação obedecendo o seguinte fluxo: 
    - Captação dos dados de entrada -> Numeração para arábico -> Conversão para algarismos romanos
    Procurei demonstrar os dados na tela da mesma maneira que foi solicitada no desafio, ou seja, em colunas, um seguido do outro.
    