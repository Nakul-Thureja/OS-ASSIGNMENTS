#include<stdio.h>
#include"ques2.h"
int A_function(){
    printf("Executing Function A\n");
    unsigned long long number = 65ULL;
    //should print A
    B_function(number);
    printf("Back to function A");
}