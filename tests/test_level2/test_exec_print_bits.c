#include <unistd.h>
#include <stdlib.h>

void	print_bits(unsigned char octet);

int	main(int argc, char **argv)
{
    if (argc != 2)
        return (1);
    unsigned char n = (unsigned char)atoi(argv[1]);
    print_bits(n);
    return (0);
}
