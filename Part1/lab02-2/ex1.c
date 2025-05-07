// Escreva uma função is_little() que retorne 1 se a memória tem organização little-endian e 0 caso seja big-endian.
// Dica: Você pode “quebrar” o sistema de tipos para inspecionar isoladamente os bytes de um valor inteiro de qualquer tamanho…

#include <stdio.h>

int is_little(){

    int num = 1;

    return *((char*)&num) == 1;

}

void teste(){

}

int main(){

  if (is_little())

    printf("Little-endian\n");

  else

    printf("Big-endian\n");
  return 0;
}