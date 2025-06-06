#include<stdio.h>
#define MAX_HEAP_SIZE 100

int heap[MAX_HEAP_SIZE];
int heapSize = 0;

int left(int n){
    return n*2+1;
}
int right(int n){
    return n*2+2;
}
int parent(int n){
    return (n-1)/2;
}

void swap(int *a, int *b){
    int t = *a;
    *a = *b;
    *b = t;
}

void insertHeap(int val){
    if(heapSize == MAX_HEAP_SIZE){
        printf("Heap is full\n");
        return;
    }
    // Insert the new value at the end of the heap

    int i = heapSize;
    heapSize++;
    heap[i] = val;
    while(i != 0 && heap[parent(i)] > heap[i]){
        swap(&heap[i], &heap[parent(i)]);
        i = parent(i);
    }
}

int popHeap(){
    if(heapSize == 0){
        printf("Heap is empty\n");
        return -1;
    }
    int toPop = heap[0];
    heap[0] = heap[heapSize-1];
    heapSize--;
    int n = 0;
    while (left(n) < heapSize)
    {
        int t = left(n);
        if (right(n) < heapSize && heap[right(n)] < heap[t])
        {
            t = right(n);
        }
    }
    
    
}
void printHeadAsArray(){
    for(int i = 0; i < heapSize; i++){
        printf("%d ", heap[i]);
    }
    printf("\n");
}

int main(){
    insertHeap(9);
    printHeadAsArray();
    insertHeap(19);
    printHeadAsArray();
    insertHeap(36);
    printHeadAsArray();
    insertHeap(8);
    printHeadAsArray();
    insertHeap(10);
    printHeadAsArray();
    insertHeap(12);
    printHeadAsArray();
    insertHeap(22);
    printHeadAsArray();
    insertHeap(12);
    printHeadAsArray();
    insertHeap(5);
    printHeadAsArray();
}