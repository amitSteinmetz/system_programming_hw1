 # include <stdio.h> 
 # include "NumClass.h"

int isStrong(int n) {
    int sum = 0, LastDigit = 0;
    int strongTemp = n;

    while (strongTemp != 0) {
        int i = 1, factorial = 1;
        LastDigit = strongTemp%10;
        // calculate factorial of LastDigit:
             while (i<=LastDigit) {
          factorial*=i;
          i++;
                           }
        sum+=factorial;
        strongTemp/=10;
    }
    if (sum == n) {
        return 1;
    }
    else {
        return 0;
    }
}

int isPrime(int n) {
    if (n < 2) {
        return 0;
    }
    else if (n == 2) {
        return 1;
    }
    else {
       for (int i = 2; i < n; i++)  {
        if (n%i == 0) {
            return 0;
        }
    }
       return 1;
    }
}

