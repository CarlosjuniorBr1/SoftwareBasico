#include <stdio.h>



void dump(void *addr, int n) {

  unsigned char *p = (unsigned char *)addr;

  while (n--) {

    printf("%p - %02x\n", p, *p);

    p++;

  }

}

int main(void) {

  short s = -3;

  int i = -151;

  char c = 150;

  printf("dump de s: %d\n", s);

  dump(&s, sizeof(s));



  printf("\ndump de i: %d\n", i);

  dump(&i, sizeof(i));



  printf("\ndump de c: %d\n", c);

  dump(&c, sizeof(c));



  return 0;
  }