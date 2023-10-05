import 'dart:async';

void main()async{

  //Criando uma função Stream, nela utilizamos async* que nos diz que o objeto ficará aberto até decidirmos fecha-lo.
  Stream myStream(int interval, [int? maxCount]) async*{ //entre chaves é um parâmetro opcional

    int i = 1;
    while(i !=maxCount){

      print('Counting $i');
      await Future.delayed(Duration(seconds: interval));
      
      yield i++;   //para uma função de tipo Stream não se utiliza return, mas sim yield

    }

    print('The Stream is Over.');
  }

   var sinxStream = myStream(1,10).asBroadcastStream(); //Broadcast permite que vários objetos possam ouvir a stream
   StreamSubscription mySubscriber = sinxStream.listen((event) { // para chamar uma função stream, é necessário que haja algum objeto para ouvir a stream
                                                                    // essa é a sintaxe para chamar uma função stream.
   
   if (event.isEven) {
     print('This number is Even');
   }

   }, onError: (e){print('An error happened');},
      onDone: (){print('Subscriber is gone');}        //Também é possível tratar erros na chamada do evento.
   );
    
    sinxStream.map((event) => 'Subscriber 2 watching: $event').listen((print)); //tbm é uma forma de assistir a stream

     await Future.delayed(Duration(seconds: 3)); //pausa a inscrição (ouvinte)
     mySubscriber.pause();
     print('Stream paused.');
     
     await Future.delayed(Duration(seconds: 3)); //retoma a inscrição (ouvinte)
     mySubscriber.resume();
     print('Stream resumed.');

     await Future.delayed(Duration(seconds: 3));//cancela a inscrição (ouvinte)
     mySubscriber.cancel();
     print('Stream canceled.');                                                                   



  print('Main is over');

}