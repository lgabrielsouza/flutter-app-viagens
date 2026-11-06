import 'package:flutter/material.dart';

class PessoasEncontradas extends StatefulWidget {
  const PessoasEncontradas({super.key});

  @override
  State<PessoasEncontradas> createState() => _PessoasEncontradasState();
}

class _PessoasEncontradasState extends State<PessoasEncontradas> {
  bool mostrarPessoas = true;

  // Lista de usuários fictícios
  final List<Map<String, dynamic>> usuarios = [
    {
      'nome': 'Lucas Silva',
      'idade': 25,
      'cidade': 'Recife - PE',
      'profissao': 'Desenvolvedor',
      'interesses': 'Tecnologia e viagens',
      'foto': 'assets/images/lucas.jpg',
    },
    {
      'nome': 'Mariana Costa',
      'idade': 28,
      'cidade': 'João Pessoa - PB',
      'profissao': 'Arquiteta',
      'interesses': 'Arte e arquitetura',
      'foto': 'assets/images/mariana.jpg',
    },
    {
      'nome': 'Rafael Oliveira',
      'idade': 31,
      'cidade': 'São Paulo - SP',
      'profissao': 'Engenheiro',
      'interesses': 'História e cultura',
      'foto': 'assets/images/rafael.jpg',
    },
    {
      'nome': 'Beatriz Santos',
      'idade': 23,
      'cidade': 'Salvador - BA',
      'profissao': 'Designer',
      'interesses': 'Fotografia e turismo',
      'foto': 'assets/images/beatriz.jpg',
    },
  ];

  // Função para abrir o perfil do usuário
  void mostrarPerfil(Map<String, dynamic> usuario) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          title: Center(
            child: Text(
              usuario['nome'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fotografia do usuário
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: AssetImage(
                      usuario['foto'],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),

                // Idade
                Row(
                  children: [
                    const Icon(
                      Icons.cake,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Idade: ${usuario['idade']} anos',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Cidade
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Cidade: ${usuario['cidade']}',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Profissão
                Row(
                  children: [
                    const Icon(
                      Icons.work,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Profissão: ${usuario['profissao']}',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Interesses
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Interesses: ${usuario['interesses']}',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Botão para fechar o perfil
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Fechar',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Título da seção
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Pessoas Encontradas',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Botão de filtro
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.filter_alt,
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      setState(() {
                        mostrarPessoas = !mostrarPessoas;
                      });
                    },
                  ),
                  const Text(
                    'Filtrar',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Lista de pessoas encontradas
        if (mostrarPessoas)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              children: usuarios.map((usuario) {
                return Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),

                    // Abre o perfil individual
                    onTap: () {
                      mostrarPerfil(usuario);
                    },

                    child: Column(
                      children: [
                        // Fotografia do usuário
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: AssetImage(
                            usuario['foto'],
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Primeiro nome
                        Text(
                          usuario['nome'].split(' ')[0],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 4),

                        // Cidade
                        Text(
                          usuario['cidade'].split(' - ')[0],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

        const SizedBox(height: 20),
      ],
    );
  }
}
