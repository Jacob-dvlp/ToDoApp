
# Todo List App

Este é um aplicativo de Todo List desenvolvido em Flutter, projetado para ajudar os usuários a gerenciar suas tarefas diárias. Ele foi criado utilizando a arquitetura Clean Architecture e implementa testes de unidade, testes de widget e testes de integração para garantir a qualidade e a confiabilidade do código.

## Funcionalidades

- **Gerenciamento de Tarefas:** Adicione, edite e exclua tarefas.
- **Filtragem de Tarefas:** Filtre tarefas por concluídas e não concluídas.
- **Autenticação:** Login com Firebase Authentication.
- **Armazenamento Local:** As tarefas são armazenadas localmente utilizando Sqflite.
- **Arquitetura Limpa:** O aplicativo segue os princípios da Clean Architecture para garantir um código modular, testável e de fácil manutenção.
- **Testes:** Testes de unidade, widget e integração foram implementados para garantir a funcionalidade e a estabilidade do aplicativo.

## Tecnologias Utilizadas

- **Flutter:** Desenvolvimento multiplataforma.
- **Clean Architecture:** Organização do código em camadas separadas de domínio, dados e apresentação.
- **Sqflite:** Armazenamento local de dados.
- **Firebase Authentication:** Autenticação de usuários.
- **Cubit (Bloc):** Gerenciamento de estado utilizando Cubit do pacote bloc.

## Pacotes Utilizados

- **[firebase_core: ^3.3.0](https://pub.dev/packages/firebase_core)**
- **[flutter_bloc: ^8.1.6](https://pub.dev/packages/flutter_bloc)**
- **[bloc: ^8.1.4](https://pub.dev/packages/bloc)**
- **[equatable: ^2.0.5](https://pub.dev/packages/equatable)**
- **[dartz: ^0.10.1](https://pub.dev/packages/dartz)**
- **[firebase_auth: ^5.1.4](https://pub.dev/packages/firebase_auth)**
- **[get_it: ^7.7.0](https://pub.dev/packages/get_it)**
- **[flutter_svg: ^2.0.10+1](https://pub.dev/packages/flutter_svg)**
- **[meta: ^1.12.0](https://pub.dev/packages/meta)**
- **[top_snackbar_flutter: ^3.1.0](https://pub.dev/packages/top_snackbar_flutter)**
- **[either_dart: ^1.0.0](https://pub.dev/packages/either_dart)**
- **[sqflite: ^2.3.3](https://pub.dev/packages/sqflite)**
- **[path: ^1.9.0](https://pub.dev/packages/path)**
- **[path_provider: ^2.1.4](https://pub.dev/packages/path_provider)**
- **[flutter_slidable: ^3.1.1](https://pub.dev/packages/flutter_slidable)**
- **[bloc_test: ^9.1.7](https://pub.dev/packages/bloc_test)**
- **[integration_test:](https://pub.dev/packages/integration_test)**
- **[build_runner: ^2.4.11](https://pub.dev/packages/build_runner)**
- **[mockito: ^5.4.4](https://pub.dev/packages/mockito)**

## Estrutura do Projeto

O projeto segue uma estrutura baseada na Clean Architecture:

- **domain:** Contém as entidades, repositórios e casos de uso.
- **data:** Implementação dos repositórios, fontes de dados locais (Sqflite) e remotas (Firebase Auth).
- **presentation:** Contém as telas, widgets e lógica de apresentação (Cubit).
- **test:** Testes de unidade, widget e integração.

## Como Executar

1. Clone este repositório.
2. Execute `flutter pub get` para instalar as dependências.
3. Configure o Firebase no seu projeto seguindo [as instruções](https://firebase.flutter.dev/docs/overview).
4. Execute o comando `flutter run` para iniciar o aplicativo.

## Testes

- **Testes de Unidade:** Execute `flutter test` para rodar os testes de unidade.
- **Testes de Widget:** Os testes de widget estão localizados na pasta `test/`.
- **Testes de Integração:** Execute `flutter test integration_test` para rodar os testes de integração.

