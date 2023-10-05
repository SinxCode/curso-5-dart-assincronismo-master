void main(){

Future myFuture = Future((){           //o tipo Future joga o objeto e ou função que está programado para o final da pilha de execução
                                       //nesse exemplo, (done with main) será printado antes, mesmo que tenha sido escrito depois.
                                       //Ou seja, o Future é uma assincrionia, ele muda a ordem natural (sincrona) da execução.
  print('Going back to the future');
  return 21;
}).then((value) => print('The value is $value')); //o then irá trazer o valor do return no final da fila de execução.

print('Done with main');

}