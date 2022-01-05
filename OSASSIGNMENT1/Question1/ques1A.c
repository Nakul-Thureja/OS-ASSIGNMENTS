//OS Assignment 1
//Question 1 
//calculate average in both sections using fork system call
#include <fcntl.h> 
#include <stdio.h> 
#include <string.h>
#include <unistd.h> 
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/stat.h>

void calculateAverage(char* section){
    int fd = open("student_record.csv", O_RDONLY);
    struct stat st;
    stat("student_record.csv",&st);
    int sum[] = {0,0,0,0,0,0};
    int size = st.st_size;    
    if(fd!=-1){
        char *c = (char *) calloc(size,sizeof(char));
        read(fd,c,size);
        c[size] = '\0';
        char* token;
        char *data = strtok(c, ",\n");
        int row = 0;
        int column = 0;
        int flag = 0 ;
        int num = 0;
        while(data!=NULL){ 
            if(column == 1){
                if(!strcmp(data,section)){
                    flag = 1;
                    num++;
                }
            }
            if(column == 2){
                if(flag){
                    int x = atoi(data);
                    sum[0] += x;
                }
            }
            if(column == 3){
                if(flag){
                    int x = atoi(data);
                    sum[1] += x;
                }
            }
            if(column == 4){
                if(flag){
                    int x = atoi(data);
                    sum[2] += x;
                }
            }
            if(column == 5){
                if(flag){
                    int x = atoi(data);
                    sum[3] += x;
                }
            }
            if(column == 6){
                if(flag){
                    int x = atoi(data);
                    sum[4] += x;
                }
            }
            if(column == 7){
                if(flag){
                    int x = atoi(data);
                    sum[5] += x;
                }
            }
            data = strtok(NULL,",\n");
            column++;
            if(column%8==0){
                column=0;
                flag = 0;
                row++;
            }
        }
        printf("Average in section %s:\n",section);
        if(num == 0){
            printf("No students in section %s\n",section);
            return;
        }
        for(int i = 0;i<6;i++){
            float avg = (float)sum[i] / num;
            printf("Assignment %d: %.2f \n",i+1,avg);
        }
    }
    else{
        printf("Error opening file\n");
    }
    close(fd);
}

int main()
{    
    int pid = fork();
    if(pid == -1){
        printf("Error Creating process");
        return 1;
    }
    if(pid == 0){
        printf("Child Process started with process id (%d) \n",getpid());
        calculateAverage("A");
        exit(0);
    }
    int pid_res = waitpid(pid,NULL,0);
    printf("Parent Process waited for child process with ID (%d) \n",pid_res);
    printf("\nParent Process started with process id (%d) \n",getpid());
    calculateAverage("B");
    return 0;
}