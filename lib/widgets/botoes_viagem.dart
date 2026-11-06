import 'package:flutter/material.dart';

class BotoesViagem extends StatefulWidget {
  const BotoesViagem({super.key});

  @override
  State<BotoesViagem> createState() => _BotoesViagemState();
}

class _BotoesViagemState extends State<BotoesViagem> {
  bool queroIr = false;
  bool jaFui = false;

  void mensagem(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  Widget criarBotao(
    IconData icone,
    String titulo,
    VoidCallback acao,
  ) {
    return Expanded(
      child: InkWell(
        onTap: acao,
        child: Column(
          children: [
            Icon(
              icone,
              color: Colors.lightBlue,
              size: 28,
            ),
            const SizedBox(height: 5),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        criarBotao(
          queroIr ? Icons.location_on : Icons.location_on_outlined,
          'Quero Ir',
          () {
            setState(() {
              queroIr = !queroIr;
            });
            mensagem('Interesse atualizado!');
          },
        ),
        criarBotao(
          jaFui ? Icons.check_circle : Icons.block,
          'Já Fui',
          () {
            setState(() {
              jaFui = !jaFui;
            });
            mensagem('Visita atualizada!');
          },
        ),
        criarBotao(
          Icons.share,
          'Compartilhar',
          () {
            mensagem('Compartilhar Coliseu');
          },
        ),
        criarBotao(
          Icons.star,
          'Avaliações',
          () {
            mensagem('Avaliações do Coliseu');
          },
        ),
      ],
    );
  }
}
