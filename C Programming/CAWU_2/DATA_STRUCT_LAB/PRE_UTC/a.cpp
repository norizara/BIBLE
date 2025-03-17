#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a = 10;
    int* ptr = &a;
    printf("Memory dari ptr: %d\n", &ptr);
    printf("Value dari ptr: %d\n", ptr);
    printf("Value dari memory yang disimpan: %d\n", *ptr);
    malloc(sizeof(int));
}