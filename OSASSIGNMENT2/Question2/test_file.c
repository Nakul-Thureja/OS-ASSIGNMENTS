#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>
#include <stdlib.h>

#define SYS_kernel_2d_memcpy 448

int main()
{
    int r = 3, c = 3; //Taking number of Rows and Columns
    float **ptr1;
    int count = 1;

    ptr1 = (float **)malloc((r) * sizeof(float*)); //Dynamically Allocating Memory
    
    for (int i = 0; i < r; i++)
    {
        float* ptr = (float *)malloc((c) * sizeof(float));
        for(int j=0;j<c;j++){
            ptr[j] = count + 0.5754;
            count++;
        }     
        ptr1[i] = ptr; 
    }
    
    printf("Source Matrix: \n");
    for (int i = 0; i < r; i++)
    {
        for(int j = 0;j<c;j++){
            printf("%f ", ptr1[i][j]);
        }
        printf("\n");
    }
    
    float **ptr2;
    ptr2 = (float **)malloc((r) * sizeof(float*));
    for(int i=0;i<r;i++){
        ptr2[i] = (float *)malloc((c) * sizeof(float));
    }
    
    long res = syscall(SYS_kernel_2d_memcpy,ptr1,ptr2,r,c);
    
    printf("\nMatrix After Copying\n");
    for (int i = 0; i < r; i++)
    {
        for(int j = 0;j<c;j++){
            printf("%f ", ptr2[i][j]);
        }
        printf("\n");
    }
    printf("System call returned %ld.\n", res);
    return res;
}