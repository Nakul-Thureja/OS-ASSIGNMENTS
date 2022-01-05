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

time_t returnTimestamp(){
    uint64_t ticks; 
    long unsigned r1,r2;
    asm volatile("rdtsc" : "=a" (r1), "=d" (r2));       //using asm volatile to get ticks using rdtsc instructions 
    ticks = (((uint64_t)r1) | (((uint64_t)r2) << 32));  
    time_t time = ticks/1796;                          //dividing the ticks by processor frequency 
    return time;
}

void sigterm_Handler(int signo, siginfo_t *info, void *extra) 
{
    key_t key = ftok("database",30);
    int shmid = shmget(key,1024,0666|IPC_CREAT);
    char *str = (char*) shmat(shmid,(void*)0,0);
    time_t temp = returnTimestamp();
    sprintf(str,"%sSignal Sent by E2(ST)\n",asctime(localtime(&temp)));
    shmdt(str);
    union sigval val;
    sigqueue(S1,SIGTERM,val);
}

void sigalrm_Handler(){
    sleep(1);
    union sigval val;
    sigqueue(getpid(),SIGTERM,val);
}

int main(int argc, char *argv[]){
    S1 = atoi(argv[1]);
    
    //Defining the SIGALRM Handler in E2
    struct sigaction signal1;
    signal1.sa_flags = SA_RESTART; 
    signal1.sa_sigaction = &sigalrm_Handler;

    if (sigaction(SIGALRM, &signal1, NULL) == -1) {
        perror("Error in SIGALRM Handler of E2(ST)");
        exit(1);
    }
    
    //Defining the SIGTERM Handler in E2
    struct sigaction signal2;
    signal2.sa_flags = SA_SIGINFO; 
    signal2.sa_sigaction = &sigterm_Handler;

    if (sigaction(SIGTERM, &signal2, NULL) == -1) { 
        perror("Error in SIGALRM Handler of E2(ST)");
        exit(1);
    }

    //Using setitimer to send SIGALRM
    struct itimerval interval;
    interval.it_value.tv_sec =  1;
    interval.it_value.tv_usec = 0;	
    interval.it_interval = interval.it_value;
    
    if (setitimer(ITIMER_REAL,&interval,NULL) == -1) {
        perror("Error in setitimer() of E2(ST)");
        exit(1);
    }
   
    while(1);
    return 0;
}