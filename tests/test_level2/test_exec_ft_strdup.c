#include <stdio.h>
#include <stdlib.h>

char *ft_strdup(char *src);

int main(int argc, char **argv)
{
    if (argc == 2)
    {
        char *dup = ft_strdup(argv[1]);
        if (dup)
        {
            printf("%s", dup);
            free(dup);
        }
    }
    return 0;
}
