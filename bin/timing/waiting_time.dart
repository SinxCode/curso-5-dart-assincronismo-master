class BotClock {

  //criando método de espera
  Future clock(int seconds){
    return Future.delayed(Duration(seconds: seconds));
    
  }

  Stream sinxBotStream(int interval, [int? maxCount]) async*{ //entre chaves é um parâmetro opcional

    int i = 1;
    while(i !=maxCount){

      print('$i');
      await Future.delayed(Duration(seconds: interval));
      
      yield i++;   //para uma função de tipo Stream não se utiliza return, mas sim yield

    }

    print('A stream terminou!.');
  }
 

}