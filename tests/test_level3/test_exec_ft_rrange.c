#include <stdio.h>
#include <stdlib.h>

int *ft_rrange(int start, int end);

int main(int argc, char **argv)
{
    if (argc != 3)
    {
        printf("Usage: %s <start> <end>\n", argv[0]);
        return 1;
    }

    int start = atoi(argv[1]);
    int end = atoi(argv[2]);

    int *arr = ft_rrange(start, end);
    if (!arr)
        return 1;

    int len = (start <= end) ? end - start + 1 : start - end + 1;

    for (int i = 0; i < len; i++)
    {
        printf("%d", arr[i]);
        if (i < len - 1)
            printf(" ");
    }
    printf("\n");

    free(arr);
    return 0;
}
