#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>

#define SOCKET "socket"

#define MAX 100

struct data{
    char mesg_text[MAX];
    int id;
} info;

int main(int argc, char *argv[])
{
    struct sockaddr_un addr;
    strcpy(addr.sun_path, SOCKET);
    addr.sun_family = AF_UNIX;
     
    int data_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (data_socket < 0) {
        perror("socket");
        exit(1);
    }
       
    int ret = connect (data_socket, (const struct sockaddr *)&addr,sizeof(struct sockaddr_un));

    if (ret < 0) {
        perror("Server Socket failure\n");
        exit(1);
    }

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
    
    while (i<49)
    { 
        for (int j=i;j<i+5;j++)
        {
            strcpy(info.mesg_text,buffer[j]);
            info.id = j;
            write(data_socket, &info, sizeof(info));
            printf("Data Sent { id: %d string: %s }\n",info.id,info.mesg_text);
        }
        read(data_socket, &max, sizeof(int));
        printf("Data Recieved { Highest index: %d }\n", max);
        i = max+1;
    }
    close(data_socket);
    return 0;
}