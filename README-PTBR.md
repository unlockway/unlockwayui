# 🥘 Healthy Meal Manager Mobile App (TCC Project)

![Unlockway Logo](./.github/assets/unlockway_logo.png)

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white) ![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=Android&logoColor=white)

> Acesse a versão em [Inglês](./README.md)

Este projeto foi desenvolvido durante a faculdade como parte de um projeto de integração interdisciplinar (TCC). O aplicativo móvel Healthy Meal Manager é um aplicativo Flutter fácil de usar, projetado para ajudar os usuários a gerenciar suas rotinas de refeições saudáveis ​​e receber notificações oportunas. O aplicativo se conecta a uma API de back-end robusta construída com Spring Boot, que lida com planejamento de refeições, dados do usuário e notificações.

O aplicativo móvel é desenvolvido usando Flutter e Dart, garantindo uma experiência multiplataforma suave e responsiva para usuários de Android e iOS. Ele segue práticas modernas de desenvolvimento e integra-se perfeitamente à API de back-end para gerenciamento de dados. O aplicativo apresenta uma interface de usuário intuitiva, projetada com a usabilidade em mente e aproveita a rica biblioteca de widgets do Flutter para oferecer uma experiência refinada.

Para desenvolvimento, o aplicativo é testado tanto em dispositivos físicos quanto em emuladores do Android Studio. Ele usa autenticação baseada em JWT para se comunicar com segurança com o back-end, garantindo a proteção dos dados do usuário. O aplicativo foi projetado para ser escalonável e de fácil manutenção, facilitando a adição de novos recursos ou melhorias no futuro.

> Acesse o protótipo do Layout construído no Figma clicando [aqui](https://www.figma.com/design/eVCIm7PVUYjDSV6PrifbAG/Fatec---Projeto-Integrador%3A-Unlockway?node-id=0-1&t=JH2hcRXH9DhEu4BF-1)

## Pré-requisitos

Antes de começar, certifique-se de ter o seguinte instalado:

- **Flutter SDK**: Instale o SDK do Flutter

- **Android Studio**: Instale o Android Studio

- **Java Development Kit (JDK)**: Instale o JDK

- **Git**: Instale o Git

## Instruções de configuração

1. **Clone os repositórios**
   Primeiro, clone o repositório da UI do Unlockway:

```sh
    git clone https://github.com/unlockway/unlockway_api_v2.git
    cd unlockway_api_v2
    # Siga o README da API para configurações adicionais
```

Em seguida, clone o repositório da API Unlockway e siga seu README para obter instruções de configuração:

```sh
    git clone https://github.com/unlockway/unlockwayui
    cd unlockwayui
```

2. **Configure seu dispositivo**
   Você pode usar um dispositivo físico ou criar um dispositivo virtual usando o Android Studio:

- **Dispositivo físico**: ative o modo de desenvolvedor e a depuração USB no seu dispositivo Android.

- **Dispositivo Virtual**: Siga a ![Documentação do AVD do Android Studio](https://developer.android.com/studio/run/managing-avds) para criar e configurar um emulador.

## Running the Application

1. **Inicie o servidor API**
   Navegue até o repositório da API e inicie o servidor:

```sh
   cd unlockway_api_v2
# Siga o README da API para iniciar o servidor
```

2. **Execute o aplicativo Flutter**
   Navegue de volta para o repositório da UI do Unlockway e execute o aplicativo:

```sh
   cd ../unlockwayui
   flutter pub get
   flutter run
```

## Como contribuir

1. **Dê fork no repositório**

2. **Crie uma nova branch:**

   ```sh
   git checkout -b feature/nome-de-sua-feature
   ```

3. **Faça suas mudanças e comite elas:**

   ```sh
   git commit -m "Sua mensagem"
   ```

4. **Faça push na branch:**

   ```sh
   git push origin feature/nome-de-sua-feature
   ```

5. **Crie um Pull Request**

### Contribuidores

| ![Victor H. Silva](https://github.com/vickttor.png) | ![Bruno Pequeno](https://github.com/bruno-pequeno.png) | ![Daniel Vieira](https://github.com/DanielVieira2828.png) | ![Felipe Thaylan](https://github.com/ThaylanFe.png) | ![João Zavisas](https://github.com/Zavisas.png) |
| :-------------------------------------------------: | :----------------------------------------------------: | :-------------------------------------------------------: | :-------------------------------------------------: | :---------------------------------------------: |
|   [Victor H. Silva](https://github.com/vickttor)    |   [Bruno Pequeno](https://github.com/bruno-pequenor)   |   [Daniel Vieira](https://github.com/DanielVieira2828)    |   [Felipe Thaylan](https://github.com/ThaylanFe)    |   [João Zavisas](https://github.com/Zavisas)    |
