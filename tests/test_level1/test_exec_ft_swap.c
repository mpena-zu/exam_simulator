#include <stdio.h>
#include <stdlib.h>

void ft_swap(int *a, int *b);

int main(int argc, char **argv)
{
	if (argc != 3)
		return (1);
	int x = atoi(argv[1]);
	int y = atoi(argv[2]);

	ft_swap(&x, &y);

	printf("%d %d\n", x, y);
	return (0);
}
