#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function to generate random float numbers in range [0, 1]
double randomFloat() {
    return (double)rand() / RAND_MAX;
}

int main() {
    srand(time(0));

    int interval = 100000;
    int circlePoints = 0, squarePoints = 0;

    for (int i = 0; i < (interval * interval); i++) {
        double randX = randomFloat();
        double randY = randomFloat();

        // Distance between (randX, randY) from the origin
        if (randX * randX + randY * randY <= 1)
            circlePoints++;

        squarePoints++;

        // Estimated Pi after this iteration
        if (i % interval == 0 && i != 0) // Exclude the first iteration
            printf("Estimate after %d iterations: %f\n", i, (double)4 * circlePoints / squarePoints);
    }

    // Final estimate
    double pi = (double)4 * circlePoints / squarePoints;
    printf("Final estimate of Pi = %f\n", pi);

    return 0;
}
