import 'dart:io';

import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

void main() async {
  String sinxBot = 'SinxBot:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock().sinxBotStream(1,11);
  var subscriber = myStream.listen((event){
    print('              SinxBot is activated for $event seconds');
  },
  onDone: () {
    print('SinxBot is finishing its work, ask the last question');
    a = false; //para ficar no looping
  },);

  print('-- Iniciando o SinxBot, aguarde..--');
  await BotClock().clock(3); //Utilizando método de espera

  print('SinxBot:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('bye') ||
        usuario.contains('Bye') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(sinxBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
     await BotClock().clock(2);
      TimeQuestions(usuario).timeQuestion();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    } else {
     await BotClock().clock(2);
      print(sinxBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(sinxBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);


  print('--Encerrando SinxBot--');
}
