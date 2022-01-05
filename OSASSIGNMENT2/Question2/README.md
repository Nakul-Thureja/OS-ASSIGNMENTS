OS ASSIGNMENT 2
QUESTION 2
Name: Nakul Thureja
Roll No: 2020528

To Compile the Code:
    1.Open Artix Linux
    2.Place the patch file in the linux-5.14.3 directory
    3.Run the command "patch -p2 < pachedfile.diff"  
    4.Now follow to steps to configure artix linux 

After Compilation of the kernel place the test file (test_file) in the kernel run the commands:
    >>gcc test_file.c -o test_file
    >>./test_file

Description:
    To write my own system call i have used two major steps:
        1. I have changed the syscall_64.tbl file present in the directory linux-5.14.3/arch/x86/entry/syscalls and added the name of the system call as kernel_2d_memcpy at the end i.e (line 448).
        2. Next i have changed the source code present in the file sys.c in the directory linux-5.14.3/kernel to define the system call kernel_2d_memcpy.

Logic behind definition:
    Syscall is defined as SYSCALL_DEFINE4 as there are 4 arguements namely the pointer to the source of floating point matrix,the pointer to the destination of floating point matrix,the number of rows and columns. 
    Firstly, The system call copies the source pointer to the buffer pointer using the  __copy_from_user() system call (which copies the data from the userspace to the kernel space) 
    Secondly, Then the system call copies the buffer pointer to the buffer pointer using the __copy_from_user() system call (which copies the data from the userspace to the kernel space) 
    
    Note:
    since, it is not directly allowes to use the float pointers in kernel source code, I have used integers pointers as float can be typecasted to int pointers and we will still get the same result.

Testing:
    To test the system call run the file test_file.c
    The code inside test_file.c simply creates two float pointers and initialize 1 of them as a 3*3 matrix and further it calls the kernel_2d_memcpy() syscall to copy the matrix and finally prints both the matrix.
    Note: Syscall kernel_2d_memcpy() returns 0 if the process was sucessfull.

PatchFile:
    For the submission, I have created the diff file using the command 
    diff -u -r original/linux-5.14.3 linux-5.14.3 > pachtedfile.diif
