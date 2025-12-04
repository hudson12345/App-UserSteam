import 'package:flutter/material.dart';
import 'package:flutter_responsivity_widget/flutter_responsivity_widget.dart';
import 'package:perfil_steam/classes/appBar.dart';
import 'package:perfil_steam/pages/perfil.dart';
import 'creditos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final respo = Responsive(context);
    return Scaffold(
      appBar: Appbar(nome: "Perfil Steam"),
      backgroundColor: Color.fromARGB(255, 35, 72, 147),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 60,
                    width: respo.wp(80),
                    child: TextField(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        hintText: "Digite o ID do perfil",
                        iconColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(width: 0, color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(width: 0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    height: 40,
                    width: respo.wp(50),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Perfil()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(210, 74, 73, 73),
                        elevation: null,
                      ),
                      child: Text(
                        "Pesquisar",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
                width: respo.wp(60),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Creditos()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                    side: BorderSide(color: Colors.white, width: 4),
                  ),
                  child: Text(
                    "Créditos da API",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
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
