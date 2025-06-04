#include <stdio.h>
#include <stdlib.h>

unsigned char swap_bits(unsigned char octet);

void	print_bits(unsigned char octet)
{
	int i = 8;
	while (i--)
	{
		if ((octet >> i) & 1)
			printf("1");
		else
			printf("0");
	}
}

int	main(int argc, char **argv)
{
	if (argc != 2)
		return (1);
    unsigned char input = (unsigned char)strtoul(argv[1], NULL, 10);
	print_bits(swap_bits(input));
	return (0);
}
