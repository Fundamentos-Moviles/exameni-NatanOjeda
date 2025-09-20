import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

/*Memorama Examen
* Alumno: Ojeda Ramírez Daniel Natan
* */


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
  void initState(){
    super.initState();
    totalCuadros = filas * columnas;
    if(totalCuadros%2!=0){
      throw Exception("El número de cuadros debe ser par");
    }
    inicializaJuego();
  }

  void inicializaJuego(){
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

  void tocarCuadro(int index) {
    // Bloquear si ya está visible o en espera
    if (visibles[index] || esperando) return;
    setState(() {
      visibles[index] = true;
      if (primerIndice == null) {
        primerIndice = index;
      } else {
        segundoIndice = index;
        if (colores[primerIndice!] == colores[segundoIndice!]) {
          primerIndice = null;
          segundoIndice = null;
          if (visibles.every((v) => v)) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('JUEGO TERMINADO'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      inicializaJuego();
                    },
                    child: const Text('Reiniciar'),
                  ),
                ],
              ),
            );
          }
        } else {
          esperando = true;
          Timer(const Duration(seconds: 1), () {
            setState(() {
              visibles[primerIndice!] = false;
              visibles[segundoIndice!] = false;
              primerIndice = null;
              segundoIndice = null;
              esperando = false;
            });
          });
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memorama - Alumno: Ojeda Ramírez Daniel Natan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: inicializaJuego,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnas,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: totalCuadros,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => tocarCuadro(index),
              child: Container(
                color: visibles[index] ? colores[index] : gris,
              ),
            );
          },
        ),
      ),
    );
  }
}
