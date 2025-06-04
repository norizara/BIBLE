#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct Node{
    char name[31];
    int urgency;
} Node;

Node heap[1000];
int heap_size = 0;

void swap(Node* a, Node* b){
    Node temp = *a;
    *a = *b;
    *b = temp;
}

// down heap used for delete
void min_heapify(int i){ // heapify == down heap
    int smallest = i;
    int left = 2*i + 1;
    int right = 2*i + 2;

    if(left < heap_size && heap[left].urgency < heap[smallest].urgency){
        smallest = left;
    }
    if(right < heap_size && heap[right].urgency < heap[smallest].urgency){
        smallest = right;
    }
    if(smallest != i){
        swap(&heap[i], &heap[smallest]);
        min_heapify(smallest);
    }
}

// up heap used for add
void up_heap(int idx){ 
    while(idx > 0){
        int parent = (idx - 1) / 2; 
        if(heap[parent].urgency > heap[idx].urgency) {
            swap(&heap[parent], &heap[idx]);
            idx = parent;
        } else {
            break;
        }
    }
}

void insert_min_heap(Node temp){
    if(heap_size == 1000){
        return;
    }
    heap[heap_size++] = temp;
    up_heap(heap_size - 1);
}

Node delete_min_heap(){
    if(heap_size == 0){
        return heap[0];
    }

    Node min = heap[0];
    heap[0] = heap[heap_size - 1];
    heap_size--;
    min_heapify(0);
    return min;
}

int main(){
    int t;
    scanf("%d", &t);
    for (int i = 0; i < t; i++)
    {
        Node temp;
        char action[8];
        scanf("%s", action); getchar();

        if(strcmp(action, "ADD") == 0){
            scanf("%s %d",temp.name, &temp.urgency);
            insert_min_heap(temp);
        } else if (strcmp(action, "PROCESS") == 0) {
            if (heap_size > 0){
                Node min = delete_min_heap();
                printf("%s\n", min.name);
            } else {
                puts("No task");
            }
        }
    }
    
}
