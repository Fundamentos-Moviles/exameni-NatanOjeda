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

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
