import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      "texto": "Qual é sua cor favorita?",
      "resposta": [
        {"texto": "Vermelho", "nota": 10},
        {"texto": "Verde", "nota": 5},
        {"texto": "Branco", "nota": 1},
      ]
    },
    {
      "texto": "Qual é seu animal favorito??",
      "resposta": [
        {"texto": "Coelho", "nota": 10},
        {"texto": "Cobra", "nota": 8},
        {"texto": "Elefante", "nota": 5},
        {"texto": "Leão", "nota": 1},
      ]
    },
    {
      "texto": "Qual é seu instrutor favorito??",
      "resposta": [
        {"texto": "Maria","nota": 10},
        {"texto": "João","nota": 8},
        {"texto": "Leo","nota": 5},
        {"texto": "Pedro","nota": 3},
        {"texto": "Mateus","nota": 1},
      ]
    },
    {
      "texto": "Qual é sua comida favorita??",
      "resposta": [
        {"texto": "Pizza", "nota": 10},
        {"texto": "hamburguer", "nota": 1},
      ]
    }
  ];

  void responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += nota;
      });
    }
    print(_perguntaSelecionada);
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState((){
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Perguntas", style: TextStyle(fontSize: 30)),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                responder: responder,
                perguntas: _perguntas)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
