#include <stdio.h>
#include <stdlib.h>

int is_power_of_2(unsigned int n);

int main(int argc, char **argv)
{
    if (argc == 2)
        printf("%d\n", is_power_of_2((unsigned int)atoi(argv[1])));
    return 0;
}
