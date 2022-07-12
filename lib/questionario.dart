import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  Questionario({
    required this.perguntaSelecionada,
    required this.responder,
    required this.perguntas,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()["resposta"]
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]["texto"].toString()),
        ...respostas
            .map((resp) => Resposta(resp["texto"].toString(),
                () => responder(int.parse(resp["nota"].toString()))))
            .toList(),
      ],
    );
  }
}
