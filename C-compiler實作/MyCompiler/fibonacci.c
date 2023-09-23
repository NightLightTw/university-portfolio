#include <stdio.h>

// Function to calculate the nth Fibonacci number
long long fib(int n) {
    if (n <= 0)
        return 0;
    else if (n == 1)
        return 1;
    else
        return fib(n - 1) + fib(n - 2);
}

int main() {
    int n = 50;
    printf("Fibonacci number #%d: %lld\n", n, fib(n));
    return 0;
}
