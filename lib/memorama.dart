import 'dart:math';

import 'package:flutter/material.dart';

class Memorama extends StatefulWidget {
  const Memorama({super.key});

  @override
  State<Memorama> createState() => _MemoramaState();
}

class _MemoramaState extends State<Memorama> {
  int filas = 4;
  int columnas = 5;
  late int totalCuadros;
  late List<Color> colores;
  late List<bool> visibles;
  int? primerIndice;
  int? segundoIndice;
  final Color gris = Colors.grey;
  bool esperando = false;

  void inicializaJuego(){
    totalCuadros = filas * columnas;
    if(totalCuadros%2==0){
      throw Exception("El número de cuadros debe ser par");
    }
    final Random random = Random();
    List<Color> baseColores = List.generate(totalCuadros ~/ 2, (index) {
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    });

    colores = List.from(baseColores);
    colores.addAll(baseColores);
    colores.shuffle();

    visibles = List.generate(totalCuadros, (index) => false);

    primerIndice = null;
    segundoIndice = null;
    esperando = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
