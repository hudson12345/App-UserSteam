import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:perfil_steam/classes/appBar.dart';
import 'package:perfil_steam/pages/homePage.dart';
import 'package:perfil_steam/pages/jogos.dart';
import 'package:url_launcher/url_launcher.dart';

class Perfil extends StatefulWidget {
  final String steamId;

  const Perfil({super.key, required this.steamId});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String nomeUsuario = "Carregando...";
  String avatarUrl = "https://wallpapers.com/images/hd/best-profile-pictures-wqm0z83avja0y31c.jpg";
  String status = "Verificando...";
  String visibilidade = "...";
  String profileUrl = "...";
  String ultimoLogin = "...";
  Color corStatus = Colors.grey;

  @override
  void initState() {
    super.initState();
    carregarPerfil();
  }

  Future<void> carregarPerfil() async {
    final url = Uri.parse(
        "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=$steamApiKey&steamids=${widget.steamId}");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final dados = jsonDecode(response.body);
        
        // Verifica se a lista de jogadores não está vazia
        if (dados['response']['players'].isNotEmpty) {
          final player = dados['response']['players'][0];

          setState(() {
            nomeUsuario = player['personaname'];
            avatarUrl = player['avatarfull'];
            profileUrl = player['profileurl'];

            int estado = player['personastate'];
            if (estado == 0) {
              status = "Offline";
              corStatus = Colors.grey;
            } else if (estado == 1) {
              status = "Online";
              corStatus = Color.fromARGB(255, 29, 161, 57);
            } else {
              status = "Jogando/Ocupado";
              corStatus = const Color.fromARGB(255, 60, 165, 250);
            }

            if (player['communityvisibilitystate'] == 3) {
              visibilidade = "Perfil Público";
            } else {
              visibilidade = "Perfil Privado";
            }

            if (player['lastlogoff'] != null) {
              var date = DateTime.fromMillisecondsSinceEpoch(player['lastlogoff'] * 1000);
              ultimoLogin = DateFormat('dd/MM/yyyy HH:mm').format(date);
            }
          });
        }
      }
    } catch (e) {
      print("Erro: $e");
    }
  }

  // Função para abrir o link
  Future<void> abrirLink() async {
    if (profileUrl != "...") {
      final Uri url = Uri.parse(profileUrl);
      if (!await launchUrl(url)) {
        throw Exception('Não foi possível abrir $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(nome: nomeUsuario),
      backgroundColor: Color.fromARGB(255, 35, 72, 147),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 29, 91),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    avatarUrl,
                    fit: BoxFit.cover,
                    scale: 1,
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              Text(
                nomeUsuario,
                style: TextStyle(
                  color: Color.fromARGB(255, 146, 146, 146),
                  fontSize: 24,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  color: corStatus,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color.fromARGB(255, 146, 146, 146),
                    ),
                    SizedBox(width: 5),
                    Text(
                      visibilidade,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2, width: double.infinity, child: ColoredBox(color: Colors.white)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: Color.fromARGB(255, 146, 146, 146),
                    ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        Text(
                          "Última vez online",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          ultimoLogin,
                          style: TextStyle(
                            color: Color.fromARGB(255, 146, 146, 146),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2, width: double.infinity, child: ColoredBox(color: Colors.white)),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.link,
                          color: Color.fromARGB(255, 146, 146, 146),
                        ),
                        Text(
                          "Link do Perfil (Toque para abrir)",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: abrirLink,
                      child: Text(
                        profileUrl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          decoration: TextDecoration.underline, 
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2, width: double.infinity, child: ColoredBox(color: Colors.white)),
              SizedBox(height: 10),
              SizedBox(
                height: 40,
                width: 160,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Jogos(steamId: widget.steamId)),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(210, 74, 73, 73),
                  ),
                  child: Text(
                    "Jogos",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}