#include <stdio.h>
#include <stdlib.h>

char *ft_itoa(int nbr);

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        printf("\n");
        return 0;
    }

    int n = atoi(argv[1]);
    char *str = ft_itoa(n);
    if (!str)
    {
        printf("Error: ft_itoa returned NULL\n");
        return 1;
    }
    printf("%s\n", str);
    free(str); 
    return 0;
}
