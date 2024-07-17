#include<stdio.h>

int main(){
    int x = 10;
    // int* p = 1682036476;
    int *p = &x;
    printf("&x= %d,  x = %d ", &x, *p);

}