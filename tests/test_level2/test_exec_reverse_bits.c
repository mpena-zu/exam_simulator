#include <stdio.h>
#include <stdlib.h>

unsigned char	reverse_bits(unsigned char octet);

void	print_bits(unsigned char octet)
{
	int	i = 8;
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
	unsigned char input = (unsigned char)atoi(argv[1]);
	unsigned char reversed = reverse_bits(input);
	print_bits(reversed);
	return (0);
}
