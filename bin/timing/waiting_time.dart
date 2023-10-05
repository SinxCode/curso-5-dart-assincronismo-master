class BotClock {

  //criando método de espera
  Future clock(int seconds){
    return Future.delayed(Duration(seconds: seconds));
    
  }


}