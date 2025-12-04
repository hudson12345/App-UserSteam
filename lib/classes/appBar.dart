import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String nome;

  const Appbar({required this.nome});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        nome,
        style: TextStyle(color: Colors.white, fontSize: 32),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(210, 74, 73, 73),
              Color.fromARGB(220, 74, 73, 73),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
