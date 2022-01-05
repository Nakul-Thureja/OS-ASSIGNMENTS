
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
    char buffer[50][10]; 
    char *str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for(int i=0;i<50;i++){
        for(int j=0;j<4;j++){
            buffer[i][j] = str[random()%52];
        }
        buffer[i][4] = '\0';
    }

    key_t key;
    int msgid;
  
    
    key = ftok("progfile", 65);
    msgid = msgget(key, 0666 | IPC_CREAT);
    message1.mesg_type = 1;
   
    int i = 0;
    while(i<50){
        for(int j=i;j<i+5;j++){;
            strcpy(message1.info.mesg_text,buffer[j]);
            message1.info.id = j;
            msgsnd(msgid, &message1, sizeof(message1), 0);
            printf("Data Sent { id: %d string: %s }\n",message1.info.id,message1.info.mesg_text);
        }     
        msgrcv(msgid, &message2, sizeof(message2), 2, 0);
        printf("Data Recieved { Highest index: %d }\n", message2.info.id);
        i = message2.info.id + 1;
    }
    return 0;
}