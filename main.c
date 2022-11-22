# include <stdio.h>
# include "NumClass.h"

int main() {
    
    int x = 0, y = 0;

    printf("Please enter 2 positive numbers:\n");
    scanf("%d\n%d", &x, &y);
    printf("Special numbers between %d and %d : \n",x,y);

    printf("Strong: ");
    for (int i = x; i<=y; i++) {
       if (isStrong(i)) {
           printf("%d, ",i);
       }
    }

    printf("\nPrime: ");
    for (int i = x; i<=y; i++) {
        if (isPrime(i)) {
            printf("%d, ",i);
        }
    }

    printf("\nArmstrong: ");
    for (int i = x; i<=y; i++) {
        if (isArmstrong(i)) {
            printf("%d, ",i);
        }
    }

    printf("\nPalindrome: ");
    for (int i = x; i<=y; i++) {
        if (isPalindrome(i)) {
            printf("%d, ",i);
        }
    }

    return 0;
}