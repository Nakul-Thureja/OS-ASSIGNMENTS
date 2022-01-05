#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

#define MAX 100

struct data{
    char mesg_text[MAX];
    int id;
} info;

int main()
{
    int fd;
    char * myfifo = "/tmp/myfifo";
    mkfifo(myfifo, 0666);
    
    char buffer[50][10]; 
    char *str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for(int i=0;i<50;i++){
        for(int j=0;j<4;j++){
            buffer[i][j] = str[random()%52];
        }
        buffer[i][4] = '\0';
    }
    int i = 0;
    int max = -1;
    
    while (i<50)
    {   
        fd = open(myfifo, O_WRONLY);
        for(int j=i;j<i+5;j++){
            strcpy(info.mesg_text,buffer[j]);
            info.id = j;
            write(fd,&info,sizeof(info));
            printf("Data Sent { id: %d string: %s }\n",info.id,info.mesg_text);
        }
        close(fd);
        fd = open(myfifo, O_RDONLY); 
        read(fd, &max, sizeof(int));
        printf("Data Recieved { Highest index: %d }\n", max);
        close(fd);
        i=max+1;
    }

    return 0;
}