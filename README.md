# ana_base_app

Front-end do aplicativo da Ana (multi tela)

# O projeto está dividido na seguinte estrutura:

- **ana_base_app:** Responsável por rodar a aplicação. Único que conhece todos os Micro Apps da aplicação.
- **flutter_dependencies:** Mantém centralizadas todas as dependências dos Micro Apps.
- **flutter_core:** Mantém tudo que é compartilhado entre os Micro Apps (Widgets, entities, infra, etc).

## **1. Arquitetura do projeto**

O projeto é dividido em packages, onde cada package implementa um Micro App, que segue a Clean Architecture.

Estrutura básica de pastas para os Micro Apps. Pode variar de acordo com a necessidade. Esta estrutura deve ser espelhada nos testes:

```
/lib
  /domain
    /entities
    /usecases
    /repositories
  /data
    /datasources
    /models
    /repositories
  /infrastructure
  /presentation
    /i18n
    /views
    /widgets
  <main>.dart
```

### 1.1 Camadas

#### **Domain**

Essa camada é o core do Microapp. É onde são implementadas as entities e usecases, contendo, respectivamente, as regras
de negócio corporativas e regras de negócio da aplicação.

Nessa camada estarão definidas as ‘interfaces’ da camada data.

Deve-se ter muito cuidado ao trabalhar nessa camada... Ela deve ter o mínimo de dependências externas possível. Quando necessário adicionar algum package externo aqui, devem ser tomadas certas precauções, como:

- verificar o **real benefício** da sua utilização
- verificar o número de contribuintes desse package
- verificar se recebe atualizações constantemente
- verificar a sua popularidade/likes no pub.dev

#### **Data**

Na camada Data serão realizadas as chamadas a datasources locais ou externos e o tratamento dos dados de envio/recebimento por meio dos Repositories.

O tratamento dos dados, quando necessário, deve ser feito em classes "Model" específicas. Essas classes devem saber as
características dos dados sendo enviados ou recebidos (parse de JSON, parse de Model para Entity e vice-versa).

A comunicação com datasources externos/locais não será feita diretamente. Deve ser por ‘interface’ adapters. A
implementação dessa ‘interface’ (HttpClient, por exemplo) será recebida no repository através do seu constructor.

A definição dessas ‘interfaces’ adapters será localizada na própria camada data, por se tratar de uma dependência para a
sua execução. A sua implementação, no entando, deve ser feita em outra camada.

#### **Presentation**

Essa camada é responsável por tudo que tange a parte visual do App.

Nessa camada são definidos basicamente:

- Views/Components:
  - UI/componentes criados com Flutter
- Validations:
  - Form validations utilizados nas views
- Internationalization:
  - Classes para aplicação de i18n

#### **Main**

Essa camada está representada na estrutura acima como o arquivo `<main>.dart`. Nesse arquivo é feita toda a composição dos módulos/Micro Apps.

Isso significa que a camada Main conhece todas as outras camadas e será a responsável por montar toda a estrutura necessária para executar o Micro App. É essa camada que, por exemplo, fará a instanciação dos usecases e os injetará nos presenters.

Nesse projeto, essa camada é montada com a utilização do package flutter_modular.

Normalmente esse arquivo receberá o nome do Micro App que ele representa, por exemplo, para o Micro App de Onboarding existirá um arquivo `meutrabalho_mobile.dart` na pasta raiz do App.

### 1.3 Adicionando Micro Apps

Um Micro App pode ser adicionado através do comando:

```bash
flutter create -t package meu_rh
```

As únicas dependências que o Micro App pode ter são:

- local package: core
- local package: dependencies
- local package: test_dependencies
- dev_dependencies

Exemplo:

```yaml
  flutter_core:
    git:
      url: git@github.com:Nasajon/flutter_core.git
      ref: main # branch name

  flutter_dependencies:
    git:
      url: git@github.com:Nasajon/flutter_dependencies.git
      ref: main # branch name

dev_dependencies:
  flutter_test:
    sdk: flutter

  test_dependencies:
    path: ../test_dependencies

  flutter_lints: ^1.0.4
```

Cada Micro App deve seguir uma padronização:

1. Deve conter um arquivo `analysis_options.yaml` com as regras de análise/formatação do código. Mais detalhes na
   seção "Padronização e boas práticas".
2. Deve conter a dev dependency do [slang_build_runner](https://pub.dev/packages/slang_build_runner) e o
   arquivo `build.yaml` com as configurações de i18n, de acordo com
   a [documentação oficial do slang.](https://pub.dev/packages/slang)
3. Fazer sua própria injeção do `HttpAdapter` com os interceptors específicos.

Após sua criação, basta adicionar o novo package como dependência no `ana_base_app`.

```yaml
dependencies:
  #...

  ### MICRO APPS ###
  meutrabalhoapp:
    git:
      url: git@github.com:Nasajon/meutrabalho_mobile.git
      ref: development # branch name
```

## **2. Setup**

Configurações do projeto (quase todas obrigatórias).

### 2.1 Lefthook

Utilizado para configurar Git Hooks no projeto. Realiza algumas checagens antes de commits ou pushes.

Documentação com manual de instalação [aqui.](https://github.com/evilmartians/lefthook/blob/master/docs/full_guide.md)

Após a instalação, acessar a raiz do projeto e executar:

```bash
lefthook install -f
```

### 2.3 Scripts

Para facilitar algumas ações rotineiras, como por exemplo a execução de testes, foi criado um script para auxiliar na execução de algums comandos em todos os Micro Apps.

Basta executar o arquivo `scripts.sh` para ter acesso à lista de comandos disponíveis.

Alguns comandos requerem a instalação de programas adicionais, como por exemplo coverage e lcov:

```bash
pub global activate coverage
brew install lcov
```

Para instalar o lcov no Windows utilizar

```bash
choco install lcov
```

Após clonar o projeto e rodar o script acima, pode ser executado um pub get através desse script:

```bash
./scripts.sh --get
```

Para mais comandos úteis:

```bash
./scripts.sh --help
```

## **3. Executando o projeto**

Para executar, levar em consideração os flavors `dev`, `hml` e `prod`.

Cada flavor possui um arquivo de configurações dentro da pasta `base_app/.env`.

Executar sempre da seguinte maneira:

```bash
cd base_app
flutter run -t lib/main_<flavor>.dart --flavor <flavor>
```

## **4. Padronização e boas práticas**

Projeto configurado com o package [Flutter Lints](https://pub.dev/packages/flutter_lints).

As regras foram centralizadas no pacote `core`, no arquivo `linter_rules.yaml`.  
Cada package deve possuir um arquivo `analysis_options.yaml` com uma estrutura básica referenciando o package core (e podendo conter regras específicas):

```yaml
include: package:core/linter_rules.yaml
# Regras específicas do módulo abaixo do include...
```

### 4.1 Commits

Deve ser mantida uma padronização quanto às mensagens de commits. Deve-se seguir o padrão especificado em [Conventional Commits.](https://www.conventionalcommits.org/pt-br/v1.0.0/)

É obrigatório sempre ter um tipo na mensagem de commit.  
_Essa validação é feita automaticamente pelo Lefthook no momento do commit._

```
<tipo>[escopo opcional]: <descrição>

[corpo opcional]

[rodapé(s) opcional(is)]
```

Prefixos aceitos: build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test
