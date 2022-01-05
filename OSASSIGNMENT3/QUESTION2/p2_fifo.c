#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
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
    int i = 0;
    int max = -1;
    while (i<50)
    {
        fd = open(myfifo,O_RDONLY);
        for(int j=0;j<5;j++){
            read(fd, &info, sizeof(info));
            printf("Data Recieved { id: %d string: %s }\n",info.id,info.mesg_text);
            if(info.id > max) max = info.id;
        }
        close(fd);
        i = max + 1;
        fd = open(myfifo,O_WRONLY);
        write(fd, &max, sizeof(int));
        printf("Data Sent { Highest index: %d }\n", max);
        close(fd);
    }
    return 0;
}