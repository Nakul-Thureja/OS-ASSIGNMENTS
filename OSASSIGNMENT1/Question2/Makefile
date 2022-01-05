all: ques2  A_function C_function B_function final

ques2: ques2.c
	gcc ques2.c -c 

A_function: A_function.c 
	gcc A_function.c -c

C_function: C_function.c 
	gcc C_function.c -c

B_function: B_function.asm
	nasm -f elf64 B_function.asm -o B_function.o

final: ques2.o A_function.o B_function.o C_function.o
	gcc ques2.o A_function.o B_function.o C_function.o -o ques2 -no-pie