#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sort_list.h"

int ascending(int a, int b)
{
    return (a <= b);
}

t_list *new_node(int value)
{
    t_list *node = malloc(sizeof(t_list));
    if (!node)
        return NULL;
    node->data = malloc(sizeof(int));
    if (!node->data)
    {
        free(node);
        return NULL;
    }
    *(int *)node->data = value;
    node->next = NULL;
    return node;
}

t_list *build_list(char *str)
{
    t_list *head = NULL;
    t_list *tail = NULL;
    char *token = strtok(str, " ");
    while (token)
    {
        int val = atoi(token);
        t_list *node = new_node(val);
        if (!head)
            head = node;
        else
            tail->next = node;
        tail = node;
        token = strtok(NULL, " ");
    }
    return head;
}

void print_list(t_list *lst)
{
    while (lst)
    {
        printf("%d", *(int *)lst->data);
        if (lst->next)
            printf(" ");
        lst = lst->next;
    }
    printf("\n");
}

void free_list(t_list *lst)
{
    t_list *tmp;
    while (lst)
    {
        tmp = lst->next;
        free(lst->data);
        free(lst);
        lst = tmp;
    }
}

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        printf("\n");
        return 0;
    }

    char *input_copy = strdup(argv[1]);
    if (!input_copy)
        return 1;

    t_list *lst = build_list(input_copy);
    free(input_copy);

    lst = sort_list(lst, ascending);

    print_list(lst);
    free_list(lst);

    return 0;
}
