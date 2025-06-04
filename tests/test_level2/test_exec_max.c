#include <stdio.h>
#include <stdlib.h>

int max(int* tab, unsigned int len);

int main(int argc, char **argv)
{
    int tab[100];
    unsigned int len = argc - 1;
    for (unsigned int i = 0; i < len; i++)
        tab[i] = atoi(argv[i+1]);

    printf("%d\n", max(tab, len));
    return 0;
}