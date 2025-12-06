// listaJogos.dart
class Listajogos {
  String nome;
  String img;
  String data; // Data da ultima vez jogado
  int horas; // Total de horas

  Listajogos({
    required this.nome,
    required this.img,
    required this.data,
    required this.horas,
  });
}

// Lista vazia inicialmente, para ser preenchida com a API
List<Listajogos> listajogos = [];