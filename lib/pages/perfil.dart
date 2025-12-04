import 'package:flutter/material.dart';
import 'package:perfil_steam/classes/appBar.dart';
import 'package:perfil_steam/pages/jogos.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(nome: "Nome Usuário"),
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
                    "https://wallpapers.com/images/hd/best-profile-pictures-wqm0z83avja0y31c.jpg",
                    fit: BoxFit.cover,
                    scale: 1,
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              Text(
                "Nome Usuário",
                style: TextStyle(
                  color: Color.fromARGB(255, 146, 146, 146),
                  fontSize: 24,
                ),
              ),
              Text(
                "Status",
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 161, 57),
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
                      "Perfil público",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
                width: double.infinity,
                child: ColoredBox(color: Colors.white),
              ),
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
                          "25/10/2025 16:59",
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
              SizedBox(
                height: 2,
                width: double.infinity,
                child: ColoredBox(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.link,
                              color: Color.fromARGB(255, 146, 146, 146),
                            ),
                            // SizedBox(width: 5),
                            Text(
                              "Link do Perfil",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "https://steamcommunity.com/profiles/76561198789100608/",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 31, 89),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
                width: double.infinity,
                child: ColoredBox(color: Colors.white),
              ),
              SizedBox(height: 10),
              Container(
                height: 40,
                width: 160,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Jogos()),
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
