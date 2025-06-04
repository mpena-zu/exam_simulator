#include <stdio.h>
#include <stdlib.h>

int ft_atoi_base(const char *str, int str_base);

int main(int ac, char **av)
{
	if (ac == 3)
	{
		int base = atoi(av[2]);
		printf("%d\n", ft_atoi_base(av[1], base));
		return 0;
	}
	printf("\n");
	return 1;
}
