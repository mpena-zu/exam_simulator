#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ft_list_remove_if.h"

void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

int cmp(void *a, void *b)
{
    return strcmp((char *)a, (char *)b);
}

t_list *new_node(void *data)
{
    t_list *node = malloc(sizeof(t_list));
    if (!node)
        return NULL;
    node->data = data;
    node->next = NULL;
    return node;
}

t_list *build_list(char *str)
{
    t_list *head = NULL;
    t_list *tail = NULL;
    char *token = strtok(str, ",");
    while (token)
    {
        char *data = strdup(token);
        t_list *node = new_node(data);
        if (!head)
            head = node;
        else
            tail->next = node;
        tail = node;
        token = strtok(NULL, ",");
    }
    return head;
}

void print_list(t_list *head)
{
    t_list *cur = head;
    while (cur)
    {
        printf("%s", (char *)cur->data);
        if (cur->next)
            printf(",");
        cur = cur->next;
    }
}

void free_list(t_list *head)
{
    t_list *tmp;
    while (head)
    {
        tmp = head->next;
        free(head->data);
        free(head);
        head = tmp;
    }
}

int main(int argc, char **argv)
{
    if (argc != 3)
    {
        printf("\n");
        return 0;
    }
    char *input_copy = strdup(argv[1]);
    if (!input_copy)
        return 1;

    t_list *list = build_list(input_copy);
    free(input_copy);

    ft_list_remove_if(&list, argv[2], cmp);

    print_list(list);
    free_list(list);

    return 0;
}
