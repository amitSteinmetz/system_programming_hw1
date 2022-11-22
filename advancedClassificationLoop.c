
# include <math.h>
# include "NumClass.h"

int isPalindrome(int n) {
    int reverse = 0, digit = 0;
    int palindromeTemp = n;

    while (palindromeTemp != 0)
    {
        digit = palindromeTemp % 10;
        reverse = reverse*10 + digit;
        palindromeTemp/=10;
    }

    return (reverse == n);
    
}

int isArmstrong(int n) {
    int armstrongTemp = n;
    int LastDigit = 0, sequence = 0, num_of_digits = 0;

    while (armstrongTemp != 0) {
        num_of_digits += 1;
        armstrongTemp/=10;
    }
    armstrongTemp = n;

    while (armstrongTemp != 0) {
        LastDigit = armstrongTemp % 10;
        sequence += pow(LastDigit, num_of_digits);
        armstrongTemp/=10;
    }

    return (sequence == n);
     
}
