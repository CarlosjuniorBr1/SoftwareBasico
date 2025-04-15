#include <stdio.h>
#include <math.h>

#define getsig(i)        ((i)>>31 & 1)

#define getexp(i)        ((i)>>23 & 0xff)

#define getfrac(i)       ((i) & 0x7fffff)

#define makefloat(s,e,f) ( (((s) & 1) << 31) | (((e) & 0xff) << 23) | ((f) & 0x7fffff) )


typedef union {

  float f;

  unsigned int i;

} U;

int main(){
    U u;
    u.f = 42.1875;
    
    unsigned int s = getsig(u.i);
    unsigned int e = getexp(u.i);
    unsigned int f = getfrac(u.i);
    
   unsigned int v  =  e ^ 0x27;
   unsigned int m  = v << ('T'/6);
   f = f & m;

   u.i   = makefloat(s, e, f);
    printf("%f\n", u.f);
    return 0;
    

}