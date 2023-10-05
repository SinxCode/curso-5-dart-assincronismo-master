void main(){

Future myFuture = Future((){           //o tipo Future joga o objeto e ou função que está programado para o final da pilha de execução
                                       //ele aguarda uma informação.
                                       //nesse exemplo, (done with main) será printado antes, mesmo que tenha sido escrito depois.
                                       //Ou seja, o Future é uma assincrionia, ele muda a ordem natural (sincrona) da execução.
  print('Going back to the future');
  return 21;
}).then((value) => print('The value is $value')); //o then irá trazer o valor do return no final da fila de execução.

Future.delayed(Duration(seconds: 5)); //Esse objeto delayed funciona como o sleep no python.

//criando função do tipo Future retornando um int
Future<int>myFutureFunc()async{

print('I have a function in the Future');
await Future.delayed(Duration(seconds: 5)); //Irá esperar 5 segundos antes de printar 12
return 12;

}

myFutureFunc().then((value) => print('My function value is $value')); //chamando a função


print('Done with main');

}