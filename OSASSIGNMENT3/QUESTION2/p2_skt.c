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
      
    int connection_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (connection_socket == -1) {
        perror("Socket");
        exit(EXIT_FAILURE);
    }
    
    printf("Socket Initialized\n");   
    int ret = bind(connection_socket,(const struct sockaddr *)&addr,sizeof(struct sockaddr_un));

    if (ret < 0) {
        perror("Error in Bind Call");
        exit(1);
    }

    printf("Socket Binded\n");
   
    ret = listen(connection_socket, 1);
    
    if (ret < 0) {
        perror("Error in listen Call");
        exit(1);
    }
    
    int i = 0;
    int max = -1;
    int data_socket = accept(connection_socket, NULL, NULL);
    
    while(i<50) {
        for (int j = 0; j < 5; j++)
        {
            read(data_socket, &info, sizeof(info));
            printf("Data Recieved { id: %d string: %s }\n",info.id,info.mesg_text);
            if(info.id > max) max = info.id;
        }
        
        write(data_socket, &max, sizeof(int));
        printf("Data Sent { Highest index: %d }\n", max);
        i = max + 1;
    }
    close(data_socket);

    
    close(connection_socket);
    printf("Socket Closed\n");

    unlink(SOCKET);
    exit(EXIT_SUCCESS);
}