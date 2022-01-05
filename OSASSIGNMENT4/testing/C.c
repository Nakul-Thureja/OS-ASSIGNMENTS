#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <time.h>

int main(){
    while(1){
        sleep(1);
        char p[8];
        long res = syscall(448,p);
        printf("reader %ld\n",res);
        printf("%s\n",p);
    }        
    return 0;
}