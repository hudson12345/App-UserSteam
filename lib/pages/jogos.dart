import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_responsivity_widget/flutter_responsivity_widget.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:perfil_steam/classes/appBar.dart';
import 'package:perfil_steam/classes/listaJogos.dart';
import 'package:perfil_steam/pages/homePage.dart';

class Jogos extends StatefulWidget {
  final String steamId;

  const Jogos({super.key, required this.steamId});

  @override
  State<Jogos> createState() => _JogosState();
}

class _JogosState extends State<Jogos> {
  bool carregando = true;
  String? mensagemErro;

  @override
  void initState() {
    super.initState();
    buscarJogos();
  }

  Future<void> buscarJogos() async {
    final url = Uri.parse(
        "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=$steamApiKey&steamid=${widget.steamId}&include_appinfo=1&format=json");

    try {
      final response = await http.get(url);
      
      listajogos.clear(); // Limpa lista antiga

      if (response.statusCode == 200) {
        final dados = jsonDecode(response.body);

        // Verifica se existe a lista de jogos (se for privado, games vem nulo ou vazio)
        if (dados['response'] != null && dados['response']['games'] != null) {
          List todosJogos = dados['response']['games'];
          
          int quantidade = todosJogos.length > 10 ? 10 : todosJogos.length;

          if (quantidade == 0) {
             setState(() {
              mensagemErro = "Este usuário não possui jogos ou a biblioteca está oculta.";
              carregando = false;
            });
            return;
          }

          for (int i = 0; i < quantidade; i++) {
            var jogo = todosJogos[i];
            
            String appId = jogo['appid'].toString();
            String urlImagem = "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/$appId/header.jpg";

            int horasJogadas = (jogo['playtime_forever'] / 60).round();
            
            String dataJogado = "Desconhecido";
            if(jogo['rtime_last_played'] != null && jogo['rtime_last_played'] != 0){
               var date = DateTime.fromMillisecondsSinceEpoch(jogo['rtime_last_played'] * 1000);
               dataJogado = DateFormat('dd/MM/yyyy').format(date);
            }

            listajogos.add(Listajogos(
              nome: jogo['name'],
              img: urlImagem,
              data: dataJogado,
              horas: horasJogadas,
            ));
          }
        } else {
          setState(() {
            mensagemErro = "Não foi possível adquirir a lista de jogos.\n(O perfil ou a biblioteca podem ser privados)";
          });
        }
      }
    } catch (e) {
      setState(() {
        mensagemErro = "Erro de conexão: $e";
      });
    }

    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final respo = Responsive(context);
    final pc = respo.isTablet;
    
    return Scaffold(
      appBar: Appbar(nome: "Jogos"),
      backgroundColor: Color.fromARGB(255, 35, 72, 147),
      body: carregando 
          ? Center(child: CircularProgressIndicator(color: Colors.white)) 
          // Se tiver erro, mostra o texto, senão mostra a lista
          : mensagemErro != null 
              ? Center(
                  child: Text(
                    mensagemErro!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : Scrollbar( 
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: listajogos.length,
                    itemBuilder: (context, index) {
                      final jogo = listajogos[index];
                      return Container(
                        color: Color.fromARGB(255, 40, 81, 163),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        child: !pc
                                            ? Image.network(
                                                jogo.img,
                                                height: 100, 
                                                width: respo.wp(45),
                                                fit: BoxFit.cover, 
                                                errorBuilder: (context, error, stackTrace) {
                                                  return Container(
                                                    height: 100, width: respo.wp(45),
                                                    color: Colors.black26,
                                                    child: Icon(Icons.broken_image, color: Colors.white),
                                                  );
                                                },
                                              )
                                            : Image.network(
                                                jogo.img,
                                                height: 150,
                                                width: respo.wp(35),
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Jogado pela ultima vez:",
                                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            jogo.data,
                                            style: TextStyle(color: Color.fromARGB(255, 146, 146, 146), fontSize: 14),
                                          ),
                                          Text(
                                            "Jogou por:",
                                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "${jogo.horas} Horas",
                                            style: TextStyle(color: Color.fromARGB(255, 146, 146, 146), fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                    child: Row(
                                      children: [
                                        !pc ? SizedBox(width: respo.wp(2)) : SizedBox(width: respo.wp(15)),
                                        Flexible(
                                          child: Text(
                                            jogo.nome,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 4,
                              child: ColoredBox(color: const Color.fromARGB(255, 117, 117, 117)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}