import 'package:calculator_app/view/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Demo',
      home: const Calculator(),
      theme: ThemeData(useMaterial3: false),
    );
  }
}
