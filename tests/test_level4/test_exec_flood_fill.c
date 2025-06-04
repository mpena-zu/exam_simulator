#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "flood_fill.h"

char **make_area(char **zone)
{
    int y = 0;
    while (zone[y])
        y++;

    char **area = malloc(sizeof(char *) * (y + 1));
    if (!area)
        return NULL;

    for (int i = 0; i < y; i++)
    {
        area[i] = strdup(zone[i]);
        if (!area[i])
        {
            while (--i >= 0)
                free(area[i]);
            free(area);
            return NULL;
        }
    }
    area[y] = NULL;
    return area;
}

void print_tab(char **tab)
{
    for (int i = 0; tab[i] != NULL; i++)
        printf("%s\n", tab[i]);
}

void free_area(char **area, int height)
{
    for (int i = 0; i < height; i++)
        free(area[i]);
    free(area);
}

int main(void)
{
    t_point size = {8, 5};
    t_point begin = {2, 2};

    char *zone[] = {
        "11111111",
        "10001001",
        "10010001",
        "10110001",
        "11100001",
        NULL
    };


    char **area = make_area(zone);
    if (!area)
        return 1;

    print_tab(area);
    putchar('\n');
    flood_fill(area, size, begin);
    print_tab(area);
    free_area(area, size.y);
    return 0;
}
