//OS Assignment 1
//Question 1 
//calculate average in both sections using threads.
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>  
#include <pthread.h>
#include <fcntl.h> 
#include <string.h>
#include <sys/wait.h>
#include <sys/stat.h>

int sum1[] = {0,0,0,0,0,0};
float n1 = 0;
int sum2[] = {0,0,0,0,0,0};
float n2 = 0;

void *SectionA(void *vargp)
{
    int fd = open("student_record.csv", O_RDONLY);
    int row = 0;
    int column = 0;
    int flag = 0 ;
    char* section = "A";
    struct stat st;
    stat("student_record.csv",&st);
    int size = st.st_size; 
    if(fd!=-1){
        char *c = (char *) calloc(size,sizeof(char));
        read(fd,c,size);
        c[size] = '\0';
        char *data = strtok(c, ",\n");
        while(data!=NULL){ 
            if(column == 1){
                if(!strcmp(data,section)){
                    flag = 1;
                    n1++;
                }
            }
            if(column == 2){
                if(flag){
                    int x = atoi(data);
                    sum1[0] += x;
                }
            }
            if(column == 3){
                if(flag){
                    int x = atoi(data);
                    sum1[1] += x;
                }
            }
            if(column == 4){
                if(flag){
                    int x = atoi(data);
                    sum1[2] += x;
                }
            }
            if(column == 5){
                if(flag){
                    int x = atoi(data);
                    sum1[3] += x;
                }
            }
            if(column == 6){
                if(flag){
                    int x = atoi(data);
                    sum1[4] += x;
                }
            }
            if(column == 7){
                if(flag){
                    int x = atoi(data);
                    sum1[5] += x;
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
    }
    else{
        printf("Error opening file\n");
    }
    close(fd);
}


void *SectionB(void *vargp)
{
    int fd = open("student_record.csv", O_RDONLY);
    int row = 0;
    int column = 0;
    int flag = 0 ;
    char* section = "B";
    struct stat st;
    stat("student_record.csv",&st);
    int size = st.st_size;
    if(fd!=-1){
        char *c = (char *) calloc(size,sizeof(char));
        read(fd,c,size);
        c[size] = '\0';
        char *data = strtok(c, ",\n");
        while(data!=NULL){ 
            if(column == 1){
                if(!strcmp(data,section)){
                    flag = 1;
                    n2++;
                }
            }
            if(column == 2){
                if(flag){
                    int x = atoi(data);
                    sum2[0] += x;
                }
            }
            if(column == 3){
                if(flag){
                    int x = atoi(data);
                    sum2[1] += x;
                }
            }
            if(column == 4){
                if(flag){
                    int x = atoi(data);
                    sum2[2] += x;
                }
            }
            if(column == 5){
                if(flag){
                    int x = atoi(data);
                    sum2[3] += x;
                }
            }
            if(column == 6){
                if(flag){
                    int x = atoi(data);
                    sum2[4] += x;
                }
            }
            if(column == 7){
                if(flag){
                    int x = atoi(data);
                    sum2[5] += x;
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
    }
    else{
        printf("Error opening file\n");
    }
    close(fd);
}

int main()
{
    pthread_t thread_id1,thread_id2;

    printf("Thread 1 to Calculate Average in Section A\n");
    if(pthread_create(&thread_id1, NULL, SectionA, NULL) != 0){
        printf("Error Creating Thread\n");
        return 1;
    }
    if(pthread_join(thread_id1, NULL) != 0){
        printf("Error Joining Thread\n");
        return 2;
    }
    printf("After Thread 1\n");
    
    printf("Thread 2 to Calculate Average in Section B\n");
    if(pthread_create(&thread_id2, NULL, SectionB, NULL) != 0){
        printf("Error Creating Thread\n");
        return 1;
    }
    if(pthread_join(thread_id2, NULL) != 0){
        printf("Error Joining Thread\n");
        return 2;
    }
    printf("After Thread 2\n\n");
    
    printf("Average in section A:\n");
    if(n1 == 0){
        printf("No students in section A\n");
    }
    else{
        for(int i = 0;i<6;i++){
            float avg = sum1[i] / n1;
            printf("Assignment %d: %.2f \n",i+1,avg);
        }
    } 
    printf("\nAverage in section B:\n");
    if(n2 == 0){
        printf("No students in section B\n"); 
    }
    else{
        for(int i = 0;i<6;i++){
            float avg = sum2[i] / n2;
            printf("Assignment %d: %.2f \n",i+1,avg);
        }
    } 
    printf("\nAverage in section A and B:\n");
    if((n1+n2) == 0){
        printf("No students in section A and B\n"); 
    }
    else{
        for(int i = 0;i<6;i++){
            float avg = (sum1[i]+sum2[i])/(n1+n2);
            printf("Assignment %d: %.2f \n",i+1,avg);
        } 
    }   
    exit(0);
}