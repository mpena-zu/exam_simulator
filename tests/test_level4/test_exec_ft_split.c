#include <stdio.h>
#include <stdlib.h>

char **ft_split(char *str);

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        printf("\n");
        return 0;
    }

    char **words = ft_split(argv[1]);
    if (!words)
        return 1;

    for (int i = 0; words[i] != NULL; i++)
    {
        printf("%s", words[i]);
        if (words[i + 1] != NULL)
            printf(",");
        free(words[i]);
    }
    free(words);

    return 0;
}
