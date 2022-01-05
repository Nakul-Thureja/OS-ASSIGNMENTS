#include<stdio.h>
#include<sys/ipc.h>
#include<sys/msg.h>
#include<stdlib.h>
#include<string.h>

#define MAX 100

struct mesg_buffer {
    long mesg_type;
    struct data{
        char mesg_text[MAX];
        int id;
    } info;
} message1,message2;
  
int main()
{
    key_t key = ftok("progfile", 65);
    int msgid = msgget(key, 0666 | IPC_CREAT);
    int max = -1;
    message2.mesg_type = 2;
    int i = 0;
    if (msgid == -1) 
    {
        perror("Error in creating queue");
        exit(1);
    }
    while(i<50){
        for(int j=0;j<5;j++){
            msgrcv(msgid, &message1, sizeof(message1), 1, 0);
            printf("Data Recieved { id: %d string: %s }\n",message1.info.id,message1.info.mesg_text);
            if(message1.info.id > max){
                max = message1.info.id;
            }
        }  
        message2.info.id = max;
        if(msgsnd(msgid, &message2, sizeof(message2), 0)==-1){
            perror("Error in message sending -- p2");
            exit(2);
        }
        printf("Data Sent { Highest index: %d }\n", max);
        i = max + 1;
    }
    msgctl(msgid, IPC_RMID, NULL);
    return 0;
}