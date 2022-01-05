#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<signal.h>
#include<sys/ipc.h>
#include<sys/shm.h>
#include<sys/wait.h>
#include<time.h>

//SIGTERM Handler of S1
void handler(int signal_number, siginfo_t *info, void *extra) 
{  
    key_t key = ftok("database",30);
    int shmid = shmget(key,1024,0666|IPC_CREAT);
    char *data = (char*) shmat(shmid,(void*)0,0);
    printf("\n%s",data);
    shmdt(data);
    shmctl(shmid,IPC_RMID,NULL);
}


int  main(int argc , char* argv[])
{
    pid_t S1 = fork();
    pid_t SR,ST;

    if(S1 == -1){
        perror("Error in Creating S1 Process");
        exit(1);
    }

    if(S1 == 0)
    {   
        //Defining the SIGTERM Handler in E2
        struct sigaction signal;
        signal.sa_flags = SA_SIGINFO; 
        signal.sa_sigaction = &handler;
        if (sigaction(SIGTERM, &signal, NULL) == -1) { 
            perror("Error in SIGTERM Handler of S1");
            exit(1);
        }
        while(1);
    }
        
    else{
        char str[20] = {'0'};
        sprintf(str, "%d", S1); 
        
        SR = fork();

        if(SR == -1){
            perror("Error in Creating SR Process");
            return 1;
        }
        else if(SR == 0){
            char *args[] = { "./E1",str, NULL };
            execv(args[0], args);
        }
        else{
            ST = fork();
            
            if(ST == -1){
                perror("Error in Creating S1 Process");
                exit(1);
            }
            else if(ST == 0){
                char *args[] = { "./E2",str, NULL };
                execv(args[0], args);
            }
        }
    }
    sleep(20);
    //Killing all the child processes
    kill(S1,SIGKILL);   
    kill(SR,SIGKILL);
    kill(ST,SIGKILL);
    return 0;
}
       