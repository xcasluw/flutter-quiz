import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        { 'texto': 'Preto', 'pontuacao': 10 },
        { 'texto': 'Vermelho', 'pontuacao': 7 },
        { 'texto': 'Verde', 'pontuacao': 5 },
        { 'texto': 'Branco', 'pontuacao': 3 }
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        { 'texto': 'Coelho', 'pontuacao': 3 },
        { 'texto': 'Cobra', 'pontuacao': 5 },
        { 'texto': 'Elefante', 'pontuacao': 7 },
        { 'texto': 'Leão', 'pontuacao': 10 }
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        { 'texto': 'Maria', 'pontuacao': 7 },
        { 'texto': 'João', 'pontuacao': 10 },
        { 'texto': 'Léo', 'pontuacao': 3 },
        { 'texto': 'Pedro', 'pontuacao': 10 }
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada 
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder
            )
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
   _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
