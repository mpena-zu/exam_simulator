#include <stdio.h>
#include <stdlib.h>

unsigned int lcm(unsigned int a, unsigned int b);

int main(int argc, char **argv)
{
    if (argc != 3)
        return 1;

    unsigned int a = (unsigned int)atoi(argv[1]);
    unsigned int b = (unsigned int)atoi(argv[2]);

    printf("%u\n", lcm(a, b));
    return 0;
}