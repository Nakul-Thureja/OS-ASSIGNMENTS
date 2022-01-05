#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <fcntl.h> 

int main(){
    while(1){
        sleep(1);
        char c[8];
        int fd;
        if ((fd = open("/dev/urandom", O_RDONLY)) == -1){
            perror("Error in opening file");
            return 1;
        }
        read(fd,c,8*sizeof(char));
        close(fd);
        printf("%s\n",c);
        long res1 = syscall(449,c);
        printf("Writer %ld \n",res1);
    }        
    return 0;
}