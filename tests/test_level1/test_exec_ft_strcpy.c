#include <stdio.h>

char *ft_strcpy(char *s1, char *s2);

int main(int argc, char **argv)
{
	if (argc != 2)
		return (1);

	char dest[1000];
	ft_strcpy(dest, argv[1]);
	printf("%s", dest);
	return (0);
}
