import 'package:flutter/material.dart';
import 'package:perfil_steam/classes/appBar.dart';

class Creditos extends StatelessWidget {
  const Creditos({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: Appbar(nome: "Créditos",),
        backgroundColor: Color.fromARGB(255, 35, 72, 147),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "API fornecida por:",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Steam Web API (Valve Corp).",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 146, 146, 146),
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Endpoints Utilizados:",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "ISteamUser/GetPlayerSummaries/v0002",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 146, 146, 146),
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      "IPlayerService/GetOwnedGames/v0001",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 146, 146, 146),
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Documentação oficial:",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "https://developer.valvesoftware.com/wiki/Steam_Web_API",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 146, 146, 146),
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
