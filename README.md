# Perfil Steam

## Integrantes
- **Hudson Araujo Barreiro**
- **Enzo Luciano**

## Sobre o Aplicativo

O Perfil Steam é um aplicativo mobile desenvolvido em Flutter para Android.  
Ele permite que os usuários busquem e visualizem informações de perfis da Steam, incluindo detalhes básicos do usuário e sua lista de jogos.

## Funcionalidades Principais

* **Pesquisa de Perfil:** Busca perfis Steam usando o Steam ID de 64 bits.
* **Detalhes do Perfil:** Mostra avatar, nome, status (online/offline/ocupado), visibilidade e última vez online.
* **Lista de Jogos:** Lista os jogos do usuário (a tela mostra todos os jogos retornados, começando pelos que possuem registro de jogatina).
* **Créditos da API:** Tela dedicada às informações sobre a API utilizada.

## Steam Web API

O aplicativo utiliza a Steam Web API para obter os dados.

### Documentação Oficial:

* https://partner.steamgames.com/doc/webapi/ISteamUser  
* https://partner.steamgames.com/doc/webapi/IPlayerService

### URL Base da API:

* `http://api.steampowered.com/`

### Autenticação:

* É necessário utilizar uma **API Key** da Steam.
* A key é enviada no parâmetro `key` nas requisições.
* A key presente no repositório é apenas demonstrativa e já foi revogada — substitua pela sua.

### Como Rodar:

Devido às restrições CORS ao acessar a Steam Web API via navegador, é necessário rodar com a flag: `flutter run -d chrome --web-browser-flag="--disable-web-security"`

### Endpoints Utilizados

#### 1. **ISteamUser/GetPlayerSummaries/v0002/**
* Traz informações do perfil.
* **Parâmetros:** `key`, `steamids`
* **Retorno principal:**
  - `personaname` — Nome do usuário
  - `avatarfull` — URL do avatar
  - `personastate` — Status (0–6)
  - `communityvisibilitystate` — Público ou privado
  - `lastlogoff` — Última vez online
  - `profileurl` — Link do perfil na Steam

#### 2. **IPlayerService/GetOwnedGames/v0001/**
* Lista os jogos do usuário.
* **Parâmetros:** `key`, `steamid`, `include_appinfo=1`
* **Retorno principal:**
  - `appid`
  - `name`
  - `playtime_forever`
  - `img_icon_url`
  - `rtime_last_played`

### Fluxo do Aplicativo:

<img width="843" height="722" alt="Fluxo do App" src="https://github.com/user-attachments/assets/688bc1de-ff0f-45f8-bc34-deb2d2d15d49" />

### Link do Figma: 
* [**Figma**](https://www.figma.com/design/Sx7GLDPfDfecRhYXeTA5Da/AppAPI?node-id=0-1&t=BE5jitiHRgEvnU2v-1)

## Telas da Aplicação na Wiki: 
* [**Tela Inicial**](https://github.com/hudson12345/App-UserSteam/wiki/Tela-Inicial)
* [**Tela de Perfil**](https://github.com/hudson12345/App-UserSteam/wiki/Perfil)
* [**Tela de Jogos**](https://github.com/hudson12345/App-UserSteam/wiki/Jogos)
* [**Tela de Créditos**](https://github.com/hudson12345/App-UserSteam/wiki/Créditos)
