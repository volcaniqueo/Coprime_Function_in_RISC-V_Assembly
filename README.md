# Coprime_Function_in_RISC-V_Assembly
This project was my 2nd Assignment for the labs of the course CMPE 344 (Computer Organization) at Bogazici University. In this assignment, Euclidean Algorithm for GCD is used to find whether two numbers are coprime or not.
## About the Project
In this assignment, the main purpose was to find whether two numbers are coprime or not. We have chosen to use Euclidean Algorithm for GCD to find that. The data consist of elements that are groupped by 3. First two numbers of the group are the numbers to find whether they are coprime or not. Third element of the group depicts the answer. Program writes 1, if the elements are coprime; 2 otherwise. The number M depicts the number of groups in the array. So the size of the array is 3 * M. Both the number M and the elements of the array are HARDCODED to the code; so there is no I/O operations. We followed good programming practices for RISC-V Assembly language, also obeying RISC-V register conventions for functions calls (Both function arguments and return values), returns adress etc.
## To Run the Code
One can search the internet and find one of the many online compilers for the RISC-V Assembly language. Or there is a complete installation guide in the lab's github page. (Just search bouncmpe/labs344 in Github)

Since there are no I/O operations one can track the code and its correctness via whisper tool. (The details and the example usage of whisper are also available in the lab's github page.)
