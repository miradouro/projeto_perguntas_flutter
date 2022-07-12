import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns!";
    } else if (pontuacao < 12) {
      return "muito bom!";
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return "Nivel Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 40))),
        ElevatedButton(
          onPressed: reiniciarQuestionario,
          child: Text("Reiniciar", style: TextStyle(fontSize: 20),),
        )
      ],
    );
  }
}
