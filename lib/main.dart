import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Amarelo', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 5},
        {'texto': 'Gato', 'pontuacao': 3},
        {'texto': 'Camelo', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual seu hobby  favorito?',
      'respostas': [
        {'texto': 'Academia', 'pontuacao': 10},
        {'texto': 'Jogar Fortnite', 'pontuacao': 5},
        {'texto': 'Volei', 'pontuacao': 3},
        {'texto': 'Basquete', 'pontuacao': 1},
      ],
    }
  ];
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _renicarQuestionario() {
    setState(() {
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
          backgroundColor: Colors.purple[900],
          title: const Text(
            'Perguntas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          elevation: 10,
          shadowColor: Colors.purpleAccent,
          toolbarHeight: 70, // default is 56
          toolbarOpacity: 0.5,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponde: _responder)
            : Resultado(_pontuacaoTotal, _renicarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
