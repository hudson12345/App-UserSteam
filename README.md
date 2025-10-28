# Perfis Steam

## Sobre o Aplicativo

O Perfis Steam é um aplicativo mobile desenvolvido em Flutter para Android. Ele permite aos usuários buscar e ver informações de perfis da Steam, incluindo detalhes do usuário e uma lista dos jogos que ele possui.

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

* É preciso uma **chave de API (API Key)**, obtida da Steam, para fazer requisições. Essa chave é enviada como parâmetro `key` nas URLs das APIs.

### Endpoints Utilizados:

1.  **`ISteamUser/GetPlayerSummaries/v0002/`**
    * **Função:** Busca detalhes do perfil do usuário.
    * **Parâmetros:** `key`, `steamids` (ID do usuário).
    * **Dados de Retorno:** `personaname`, `avatarfull`, `personastate`, `communityvisibilitystate`, `lastlogoff`, `profileurl`.

2.  **`IPlayerService/GetOwnedGames/v0001/`**
    * **Função:** Lista os jogos que um usuário possui (só os 4 primeiros).
    * **Parâmetros:** `key`, `steamid`, `include_appinfo=1` para obter nomes e imagem dos jogos.
    * **Dados de Retorno:** `appid`, `name`, `playtime_forever`, `img_icon_url`, `rtime_last_played`.
  
### Fluxo do Aplicativo:
