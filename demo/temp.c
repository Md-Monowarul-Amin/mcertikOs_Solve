#include<stdio.h>
struct S
{
    int num;
    int val;
    /* data */
};

void print_struct(struct S *st){
    int x = st->num;
    int y = st->val;

    printf("x: %d, y: %d \n",x, y);
}


int main(){
    // int x = 10;
    // // int* p = 1682036476;
    // int *p = &x;
    // printf("&x= %d,  x = %d ", &x, *p);
    struct S temp_num;
    temp_num.num = 1;
    temp_num.val = 10;

    print_struct(&temp_num);

    return 0;
}