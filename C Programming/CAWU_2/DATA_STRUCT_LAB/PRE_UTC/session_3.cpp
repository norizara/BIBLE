#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Node {
    int id;
    char nama[50];
    struct Node* next;
    struct Node* prev;
} *head, *tail;

struct Node* createNewNode(int id, char nama[])
{
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->id = id;
    strcpy(newNode->nama, nama);
    newNode->prev = newNode->next = NULL;
    return newNode;
}

void pushHead(int id, char nama[])
{
    struct Node* newNode = createNewNode(id, nama);
    if(head==NULL){
        head=tail=newNode;
    } else {
        newNode->next = head;
        head->prev = newNode;
        head=newNode;
    }
}

void forwardPrint() {

}

int main()
{
    char temp[50];
    strcpy(temp, "Andi");
    pushHead(1, temp);
}