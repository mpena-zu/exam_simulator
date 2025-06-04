#include <stdio.h>
#include <stdlib.h>

void sort_int_tab(int *tab, unsigned int size);

int main(int argc, char **argv)
{
    if (argc < 2)
        return 0;
    unsigned int size = argc - 1;
    int *tab = malloc(sizeof(int) * size);
    if (!tab)
        return 1;

    for (unsigned int i = 0; i < size; i++)
        tab[i] = atoi(argv[i + 1]);

    sort_int_tab(tab, size);
    for (unsigned int i = 0; i < size; i++)
    {
        printf("%d", tab[i]);
        if (i != size - 1)
            printf(" ");
    }
    printf("\n");

    free(tab);
    return 0;
}
