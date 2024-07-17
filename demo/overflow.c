#include<stdio.h>

int fx(){
    char* x[10];

    gets(x);

    printf("%s", x);
}

  

int main(){
    int x=10, y=20;

    fx();

    return 0;
}