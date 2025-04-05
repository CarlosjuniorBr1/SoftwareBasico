#include <stdio.h>

unsigned char rotate_left(unsigned char x, int n){
    unsigned char aux; 
    unsigned char mask = 0x80;

    for(int i = 0; i < n; i++){
        aux = x & mask;
        aux = aux >> 7;
        x = x << 1;
        x = x | aux;
    }

    return x;
}

int main(){
    
    unsigned char x = 0x61;
    printf("%x\n", rotate_left(x, 1) );
    return 0; 
}