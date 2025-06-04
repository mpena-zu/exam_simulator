#include <stdio.h>
#include <stdlib.h>
#include "ft_list.h"

extern int ft_list_size(t_list *begin_list);

t_list *create_elem(void *data) {
    t_list *new_elem = malloc(sizeof(t_list));
    if (!new_elem)
        return NULL;
    new_elem->data = data;
    new_elem->next = NULL;
    return new_elem;
}

t_list *create_list(int count) {
    if (count <= 0) return NULL;
    t_list *head = create_elem("first");
    t_list *current = head;
    for (int i = 1; i < count; i++) {
        current->next = create_elem("node");
        current = current->next;
    }
    return head;
}

void free_list(t_list *head) {
    while (head) {
        t_list *tmp = head;
        head = head->next;
        free(tmp);
    }
}

int main(int argc, char **argv) {
    if (argc != 2) return 1;
    int count = atoi(argv[1]);
    t_list *list = create_list(count);
    int result = ft_list_size(list);
    printf("%d\n", result);
    free_list(list);
    return 0;
}
