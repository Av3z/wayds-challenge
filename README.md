# Wayds Challenge

> Projeto Flutter desenvolvido para demonstrar arquitetura limpa, modularização e baixo acoplamento de dependências.

---

## Como rodar o projeto

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/Av3z/wayds-challenge.git
   cd wayds-challenge
   ```
2. **Instale as dependências:**
   ```sh
   flutter pub get
   ```
3. **Execute o app:**
   ```sh
   flutter run
   ```
   > Recomenda-se rodar em um emulador/dispositivo Android ou iOS.

4. **Rodar os testes:**
   ```sh
   flutter test
   ```

---

## Principais dependências utilizadas

- **flutter_modular**: Gerenciamento de rotas e injeção de dependências de forma modular.
- **shared_preferences**: Persistência simples de dados localmente, usada para cache.
- **http**: Requisições HTTP para consumir a API Rick and Morty.
- **equatable**: Facilita comparação de objetos (usado nos models).
- **flutter_test**: Framework de testes para widgets e lógica.
- **mockito**: Utilizado para criar mocks em testes unitários e de integração.

### Por que essas dependências?
- **Modularização**: O `flutter_modular` permite separar responsabilidades e facilita testes/mudanças.
- **Persistência**: `shared_preferences` é leve e suficiente para cache simples.
- **HTTP**: O pacote `http` é padrão para consumir APIs REST.
- **Equatable**: Evita boilerplate em comparações de objetos.
- **Mockito**: Permite criar testes mais robustos e isolados, simulando dependências sem precisar de implementações reais.

---

## Sobre o gerenciamento de estado

**Não foi utilizado nenhum gerenciador de estado externo (Provider, Bloc, Riverpod, etc).**

> O projeto utiliza diretamente `Stream` para atualização de dados e UI.

**Motivo:**
- O objetivo foi deixar o projeto o mais independente possível de frameworks e bibliotecas externas, focando em princípios da Clean Architecture.
- Usar `Stream` diretamente reduz acoplamento, facilita testes e torna o código mais próximo do Dart puro.
- O padrão de gerenciamento de estados foi inspirado na estrutura do Bloc, utilizando eventos e estados, mas sem a dependência do pacote Bloc, apenas o pattern.
- Isso permite que o projeto seja facilmente adaptado para outros gerenciadores de estado no futuro, se necessário.

---

## Estrutura e arquitetura

- **Clean Architecture**: Separação clara entre camadas de domínio, dados e apresentação.
- **Baixo acoplamento**: Dependências mínimas, facilitando manutenção e evolução.
- **Testes**: Cobertura de testes para lógica e widgets.
- **Cache com expiração**: Implementado via SharedPreferences para otimizar requisições.

---

## Demo

<p align="center">
   <img src="rick-and-morty.gif" alt="Demo do app" width="320" />
</p>

> Veja acima uma demonstração do funcionamento do app.
