#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define SYS_delay_vruntime 448

int main(){
    long res = syscall(SYS_delay_vruntime,getpid(),10000);    
    int tick1 = clock();
    long long int i = 0;
    long long int sum = 0;
    for(int i=0;i<500000000;i++){
        sum += i;
    }
    
    int tick2 = clock();
    double time = ((double)(tick2 - tick1)*1000)/CLOCKS_PER_SEC;
    printf("%f time with system call\n",time);
    return 0;
}