#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<signal.h>
#include<sys/ipc.h>
#include<sys/shm.h>
#include<sys/wait.h>
#include<time.h>
#include<sys/time.h>
#include<stdint.h>

pid_t S1;

int returnRandom(){
    int rand_num;
    asm volatile("rdrand %%rax":"=r"(rand_num));    //using asm volatile to get random number using rdrand
    return rand_num;
}

void sigalrm_Handler(){
    key_t key = ftok("database",30);
    int shmid = shmget(key,1024,0666|IPC_CREAT);
    char *str = (char*) shmat(shmid,(void*)0,0);
    int random_no = returnRandom();
    sprintf(str,"%u \nSignal Sent by E1(SR)\n",random_no);
    shmdt(str);
    union sigval val;
    sigqueue(S1,SIGTERM,val);
}

int main(int argc, char *argv[]){
    S1 = atoi(argv[1]);

    //Defining the SIGALRM Handler in E1
    struct sigaction signal1;
    signal1.sa_flags = SA_RESTART; 
    signal1.sa_sigaction = &sigalrm_Handler;

    if (sigaction(SIGALRM, &signal1, NULL) == -1) {
        perror("Error in SIGALRM Handler of E1(SR)");
        exit(1);
    }
    
    //Using setitimer to send SIGALRM
    struct itimerval interval;
    interval.it_value.tv_sec =  1;
    interval.it_value.tv_usec = 0;	
    interval.it_interval = interval.it_value;
    
    if (setitimer(ITIMER_REAL,&interval,NULL) == -1) {
        perror("Error in setitimer() of E1(SR)");
        exit(1);
    }

    while(1);
    return 0;
}

