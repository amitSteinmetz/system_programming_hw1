# include <stdio.h> 
# include <math.h>
# include "NumClass.h"

// statements: 
int isArmstrongRec(int n, int num_of_digits);
int reverseNum(int n, int sum); 


int isPalindrome(int n) {

    return (n == reverseNum(n, 0));
    

}
int reverseNum(int n, int sequence)
{
    int LastDigit = 0;

    if (n == 0) {
        return sequence;
    }

    else  {
        LastDigit = n%10;
        sequence = sequence*10 + LastDigit;
        return reverseNum(n/10, sequence);
    }
    
}

int isArmstrong(int n) {
    int num_of_digits = 0;
    int temp = n;
    while (temp != 0) {
        num_of_digits++;
        temp/=10;
    }
    return (n == isArmstrongRec(n, num_of_digits)); 
    
}

int isArmstrongRec(int n, int num_of_digits) {
    if (n == 0) {
        return 0;
    }
    else {
        return (pow(n%10,num_of_digits) + isArmstrongRec(n/10, num_of_digits));
    }
}
