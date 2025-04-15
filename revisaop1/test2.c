#include <stdio.h>

void dump(void *addr, int n) {
    unsigned char *p = (unsigned char *)addr;
    while (n--) {
        printf("%p - %02x\n", (void *)p, *p);
        p++;
    }
}

struct Data {
    char a[2][4];
    char *b;
    long c;
};

struct Data data = {0};

int main() {
    short *ptr = (short*)&data;
    // printf("end: %p\n", (void*)ptr);

    data.a[1][2] = 0xAA;

    data.b = (char *)&data.b;
    // printf("end: %p\n", (void*)&data.b);

    data.b = data.b - 2;
    // printf("end: %p\n", (void*)&data.b);
    
    printf("------------------------------\n");

    // printf("%d\n", ptr[3]); // Corrigido: faltava ponto e vírgula

    data.c = (long)data.b[0] ^ (long)ptr[3];

    dump(&data, sizeof(data));
    return 0;
}
