#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define SYS_delay_vruntime 449

void func(){
    long long int i = 0;
    long long int sum = 0;
    for(int i=0;i<500000000;i++){
        sum += i;
    }
}
int main(){
    pid_t pid = fork();
    if(pid == -1){
        perror("fork");
        exit(1);
    }
    else if(pid == 0){
        char* args[] = {"./e2",NULL};
        execv("./e2",args);    
    }
    else{
        char* args[] = {"./e2",NULL};
        execv("./e1",args);
    }
    return 0;
}