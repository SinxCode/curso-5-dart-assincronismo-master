import 'dart:io';

import 'questions/time_questions.dart';

void main() async {
  String sinxBot = 'SinxBot:\n';
  var a = true;
  String usuario = '';

  print('-- Iniciando o SinxBot, aguarde..--');

  print('SinxBot:\n Oi :) \n Como posso ajudar?');
try{
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    if (usuario.contains('bye') ||
        usuario.contains('Bye') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(sinxBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    } else {
      print(sinxBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(sinxBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);
}catch (e){
  print(e);
} 

  print('--Encerrando SinxBot--');
}