import 'package:flutter/material.dart';
import 'package:flutter_responsivity_widget/flutter_responsivity_widget.dart';
import 'package:perfil_steam/classes/appBar.dart';
import 'package:perfil_steam/classes/listaJogos.dart';

class Jogos extends StatelessWidget {
  const Jogos({super.key});

  @override
  Widget build(BuildContext context) {
    final respo = Responsive(context);
    final pc = respo.isTablet;
    return Scaffold(
      appBar: Appbar(nome: "Jogos"),
      backgroundColor: Color.fromARGB(255, 35, 72, 147),
      body: ListView.builder(
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: !pc
                                ? Image.network(
                                    jogo.img,
                                    height: 120,
                                    width: respo.wp(45),
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    jogo.img,
                                    height: 185,
                                    width: respo.wp(35),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jogado pela ultima vez:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                jogo.data,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Jogou por:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "${jogo.horas} Horas",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 146, 146, 146),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Row(
                          children: [
                            !pc
                                ? SizedBox(width: respo.wp(2))
                                : SizedBox(width: respo.wp(15)),
                            Text(
                              jogo.nome,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
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
                  child: ColoredBox(
                    color: const Color.fromARGB(255, 117, 117, 117),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
