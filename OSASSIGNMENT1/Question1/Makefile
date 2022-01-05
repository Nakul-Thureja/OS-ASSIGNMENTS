all: assemblyA assemblyB partA partB final 
assemblyA:ques1A.c 
	 gcc ques1A.c -S 
assemblyB:ques1B.c 
	 gcc ques1B.c  -S -lpthread

partA : ques1A.S
	gcc -c ques1A.S -o ques1A.o
partB : ques1B.S 
	gcc -c ques1B.S -o ques1B.o -lpthread

final:
	gcc ques1A.o -o ques1A
	gcc ques1B.o -o ques1B -lpthread

