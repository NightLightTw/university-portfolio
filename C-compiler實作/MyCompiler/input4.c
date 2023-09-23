#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int main() {
    int a = 1;
    int b = 2;
    printf("a = %d\n", a);
    printf("b = %d\n", b);

    int a_plus_b = add(a, b);
    printf("a + b = %d\n", a_plus_b);

    return 0;
}