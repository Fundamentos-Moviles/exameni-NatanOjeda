import 'package:flutter/material.dart';
import 'memorama.dart';


void main() {
  runApp(const MyApp());
}
//Clase sin estado
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Memorama - Ojeda Ramírez Daniel Natan',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Memorama()
    );
  }
}
