import 'package:flutter/material.dart';
import 'screens/viagens_screen.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Viagens',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const ViagensScreen(),
    );
  }
}
