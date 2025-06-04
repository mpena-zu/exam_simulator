#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include "ft_list_foreach.h"


void	ft_list_foreach(t_list *begin_list, void (*f)(void *));

void print_data(void *data)
{
    char *str = (char *)data;
    while (*str)
    {
        write(1, str, 1);
        str++;
    }
    write(1, ",", 1);
}

t_list *create_node(void *data)
{
    t_list *node = malloc(sizeof(t_list));
    if (!node)
        return NULL;
    node->data = data;
    node->next = NULL;
    return node;
}

t_list *create_list(char **arr)
{
    t_list *head = NULL;
    t_list *temp = NULL;
    t_list *prev = NULL;
    int i = 0;

    while (arr[i])
    {
        temp = create_node(arr[i]);
        if (!temp)
            return NULL;
        if (!head)
            head = temp;
        else
            prev->next = temp;
        prev = temp;
        i++;
    }
    return head;
}

void free_list(t_list *head)
{
    t_list *tmp;
    while (head)
    {
        tmp = head->next;
        free(head);
        head = tmp;
    }
}

int main(int argc, char **argv)
{
    t_list *list = NULL;
    char *test1[] = {"a", "b", "c", NULL};
    char *test2[] = {"1", "2", "3", "4", NULL};

    if (argc != 2)
    {
        write(1, "\n", 1);
        return 0;
    }

    if (argv[1][0] == '\0')
    {
        write(1, "\n", 1);
        return 0;
    }

    if (!strcmp(argv[1], "test1"))
        list = create_list(test1);
    else if (!strcmp(argv[1], "test2"))
        list = create_list(test2);
    else
    {
        write(1, "\n", 1);
        return 0;
    }

    ft_list_foreach(list, print_data);
    write(1, "\n", 1);

    free_list(list);

    return 0;
}
