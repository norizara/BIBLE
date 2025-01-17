#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct tnode {
    int valueNode;
    tnode *next;
    tnode *prev;
} *h, *t, *c;

void pushHead(int value)
{
    c = (struct tnode*)malloc(sizeof(struct tnode));
    c->valueNode=value;
    c->next=NULL;
    c->prev=NULL;
    if(!h){
        h=t=c;
    }
}

int main()
{

}