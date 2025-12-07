# Perfil Steam

## Integrantes
- **Hudson Araujo Barreiro**
- **Enzo Luciano**

## Sobre o Aplicativo

O Perfis Steam é um aplicativo mobile desenvolvido em Flutter para Android. Ele permite que os usuários busquem e vejam informações de perfis da Steam, incluindo detalhes do usuário e uma lista dos jogos que ele possui.

## Funcionalidades Principais

* **Pesquisa de Perfil:** Busca perfis Steam usando o Steam ID de 64 bits.
* **Detalhes do Perfil:** Mostra a foto, nome, status (online/offline), visibilidade do perfil e a ultima vez que o usuário esteve online.
* **Lista de Jogos:** Mostra os 4 primeiros jogos que o usuário possui, com imagem, nome, tempo total jogado e a data da última vez que o jogo foi jogado.
* **Créditos da API:** Uma seção que informa sobre as APIs utilizadas.

## Steam Web API

O aplicativo consome a Steam Web API para obter os dados.

### Documentação Oficial:

* [https://partner.steamgames.com/doc/webapi/ISteamUser](https://partner.steamgames.com/doc/webapi/ISteamUser)
* [https://partner.steamgames.com/doc/webapi/IPlayerService](https://partner.steamgames.com/doc/webapi/IPlayerService)

### URL Base da API:

* `http://api.steampowered.com/`

### Autenticação:

* É preciso uma **chave de API (API Key)**, para fazer requisições. Essa chave é enviada como parâmetro `key` nas URLs das APIs.
* A API key do repositório foi revogada e não funciona, sendo necessário troca-la para funcionar.

### Como Rodar:

Devido às restrições de segurança de navegadores ao acessar a API da Steam diretamente, o projeto não funcionará se você apenas apertar F5 ou der o run padrão, pois a API da steam foi feita para servidores conversarem entre si, não para navegadores.

* É preciso utilizar esse comando `flutter run -d chrome --web-browser-flag "--disable-web-security"`, que desliga a segurança do navegador contra CORS (Cross-Origin Resource Sharing).


### Endpoints Utilizados:

1.  **`ISteamUser/GetPlayerSummaries/v0002/`**
    * Busca detalhes do perfil do usuário.
    * **Parâmetros:** `key`, `steamids` (ID do usuário).
    * **Dados de Retorno:**
       * `personaname` - String: O nome de exibição (username) do jogador.
       * `avatarfull` - String: A URL completa da imagem de avatar do usuário (184x184px).
       * `personastate` - Number(JSON)/int(Dart): O status atual do usuário (0 - Offline, 1 - Online, 2 - Busy, 3 - Away, 4 - Snooze, 5 - looking to trade, 6 - looking to play, e se o perfil for privado, será sempre 0).
       * `communityvisibilitystate` - Number(JSON)/int(Dart): Mostra a visibilidade do perfil (1: Privado, 3: Público).
       * `lastlogoff` - Number(JSON)/int(Dart): O timestamp Unix da última vez que o usuário esteve online.
       * `profileurl` - String: A URL completa para o perfil da Comunidade Steam do usuário.

2.  **`IPlayerService/GetOwnedGames/v0001/`**
    * Lista os jogos que um usuário possui (só os 4 primeiros).
    * **Parâmetros:** `key`, `steamid`, `include_appinfo=1` para obter nomes e imagem dos jogos.
    * **Dados de Retorno:**
       * `appid` - Number(JSON)/int(Dart): O identificador único do jogo na Steam.
       * `name` - String: O título do jogo.
       * `playtime_forever` - Number(JSON)/int(Dart): O tempo total que o usuário jogou este jogo, em minutos.
       * `img_icon_url` - String: O hash da URL completa do ícone do jogo..
       * `rtime_last_played` - Number(JSON)/int(Dart): O timestamp Unix da última vez que o usuário jogou este jogo.

  
### Fluxo do Aplicativo:

<img width="843" height="722" alt="Screenshot 2025-10-27 221709" src="https://github.com/user-attachments/assets/688bc1de-ff0f-45f8-bc34-deb2d2d15d49" />

### Link do Figma:

* [**Figma**](https://www.figma.com/design/Sx7GLDPfDfecRhYXeTA5Da/AppAPI?node-id=0-1&t=BE5jitiHRgEvnU2v-1)


## Telas da Aplicação na Wiki:

* [**Tela Inicial**](https://github.com/hudson12345/App-UserSteam/wiki/Tela-Inicial)
* [**Tela de Perfil**](https://github.com/hudson12345/App-UserSteam/wiki/Perfil)
* [**Tela de Jogos**](https://github.com/hudson12345/App-UserSteam/wiki/Jogos)
* [**Tela de Créditos**](https://github.com/hudson12345/App-UserSteam/wiki/Créditos)
