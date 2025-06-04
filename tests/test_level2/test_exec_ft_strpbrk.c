#include <stdio.h>

char *ft_strpbrk(const char *s1, const char *s2);

int main(int argc, char **argv)
{
    if (argc == 3)
    {
        const char *res = ft_strpbrk(argv[1], argv[2]);
        if (res)
            printf("%s", res);
    }
    return 0;
}
