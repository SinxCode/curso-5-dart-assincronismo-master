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
throw Exception();
return 12;

}

myFutureFunc().then((value) => print('My function value is $value')).onError((error, stackTrace) => print('An Error accurred')).whenComplete(() => print('The future is over')); //chamando a função
//a função "on error" serve para tratarmos erro
//a função whenComplete acontece dps que o tempo esperado termine, independente se tem erro ou não assim como um finally.

Future<int>myFutureErrorFunc(int a, int b)async{

try{

  if (a > b) {
    throw Exception();
  }

  print('I have a functional Function');
  await Future.delayed(Duration(seconds: 5));
  return 42;

}
catch(e){

  print('An Error occurred: $e');
  return 42;

}

finally{

print('The Future is Finally Over');

}
}

myFutureErrorFunc(1, 2).then((value) => print('The Value is $value'));
print('Done with main');

}
