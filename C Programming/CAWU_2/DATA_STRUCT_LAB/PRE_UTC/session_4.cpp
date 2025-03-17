#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TABLE 10

struct Node {
    char name[40];
    Node *next;
} *head[MAX_TABLE];

Node *createNewNode(const char *name) {
    Node *newNode = (Node*)malloc(sizeof(Node));
    strcpy(newNode->name, name);
    newNode->next=NULL;
    return newNode;
}

int hash(const char *name) {
    int key = 0;
    for (int i = 0; i < strlen(name); i++)
    {
        key+=name[i];
    }
    return key % MAX_TABLE;
}

void push(const char *name){
    Node *newNode = createNewNode(name);

    int pos = hash(name);
    if(head[pos] == NULL) {
        head[pos] = newNode;
        return;
    }

    Node *temp = head[pos];
    while(temp->next!=NULL) {
        temp = temp->next;
    }
    temp->next=newNode;
}

void print(){
    for (int i = 0; i < MAX_TABLE; i++)
    {
        Node *temp = head[i];
        printf("%d: ", i);
        while(temp){
            printf("%s -> ", temp->name);
            temp=temp->next;
        }
        printf("NULL\n");
    }
}

void pop(const char *name) {
    int pos = hash(name);
    if(head[pos]==NULL) {
        printf("Hash is null.\n");
        return;
    }
    else {
        if(strcmp(head[pos]->name,name) == 0) {
            Node *temp = head[pos];
            head[pos] = temp->next;
            free(temp);
        } else {
            Node *temp = head[pos];
            while(temp->next!=NULL && strcmp(temp->next->name, name) != 0 ) {
                temp = temp->next;
            }
            Node *toPop = temp->next;
            temp->next = toPop->next;
            free(toPop);
        }
    }
}

int main() {
    push("budi");
    push("lala");
    push("andi");
    push("agus");
    push("neo");
    push("ziva");
    push("jaden");
    push("nana");
    push("webe");
    print();
    pop("neo");
    print();
}