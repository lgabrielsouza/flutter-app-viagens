import 'package:flutter/material.dart';

import '../widgets/imagem_destino.dart';
import '../widgets/botoes_viagem.dart';
import '../widgets/pessoas_encontradas.dart';

class ViagensScreen extends StatelessWidget {
  const ViagensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Viagens',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImagemDestino(),
            const SizedBox(height: 15),
            const BotoesViagem(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                'O Coliseu é um dos monumentos mais '
                'famosos de Roma, na Itália. '
                'Construído durante o Império Romano, '
                'era utilizado para espetáculos públicos '
                'e combates de gladiadores. '
                'Atualmente, é um dos principais pontos '
                'turísticos do mundo e representa '
                'a história e a cultura romana.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const PessoasEncontradas(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
