#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<semaphore.h>
#include<pthread.h>
#include<string.h>

#define N 5
#define Left(n) n
#define Right(n) (n+1) % N

sem_t forks[N];
sem_t bowl;
int meals[N] = {0};

void take_fork(int phno);
void eat(int phno);
void leave_fork(int phno);
void* philosopher(void* n);

int main()
{
	pthread_t Philosophers[5];
	printf("There are 5 Philosophers named as 0,1,2,3,4\n");
	sem_init(&bowl,0,4);
    for(int i=0;i<N;i++){
		sem_init(&forks[i],0,1);
	}
	for(int i=0;i<N;i++){
		int *tno = calloc(1,sizeof(int));
		memcpy(tno, &i, sizeof(int));
		pthread_create(&Philosophers[i],NULL,philosopher,(void *)tno);
	}
	for(int i=0;i<N;i++){
		pthread_join(Philosophers[i],NULL);
	}
}

void take_fork(int phno){
	int left = Left(phno);
    int right = Right(phno);
	printf("Philosopher %d tries to take a bowl\n",phno);
	sem_wait(&bowl);
	printf("Philosopher %d takes a bowl\n",phno);
  	printf("Philosopher %d tries to take the left(%d) fork\n",phno,left);
	sem_wait(&forks[left]);
	printf("Philosopher %d takes the left(%d) fork\n",phno,left);
	printf("Philosopher %d tries to take the right(%d) fork\n",phno,right);
	sem_wait(&forks[right]);
	printf("Philosopher %d takes the right(%d) fork\n",phno,right);
}

void eat(int phno)
{
    printf("Philosopher %d begins to eat with forks %d and %d from a bowl\n",phno,Left(phno),Right(phno));
	meals[phno]++;
	sleep(2);
}

void leave_fork(int phno){
	int left = Left(phno);
    int right = Right(phno);
	printf("Philosopher %d has finished %d meal\n",phno,meals[phno]);
	sem_post(&bowl);
	printf("Philosopher %d leaves the bowl\n",phno);
	sem_post(&forks[right]);
    printf("Philosopher %d leaves the right(%d) fork\n",phno,right);
	sem_post(&forks[left]);
	printf("Philosopher %d leaves the left(%d) fork\n",phno,left);
}

void * philosopher(void * n)
{
	int phno = *(int *)n;
	while(meals[phno]<10){
		printf("Philosopher %d wants to eat\n",phno);
		take_fork(phno);
		eat(phno);
		leave_fork(phno);
	}
}
