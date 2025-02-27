#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct node {
    char scName[50];
    int fuel;
    int priority; // 1 for emergency, others for non-emergency
    struct node *prev;
    struct node *next;
} node;

node *head = NULL, *tail = NULL;

// This function inserts the new node into the list following the rules:
//   - Priority 1 ships come before non-emergency ships.
//   - Within each group, sort by ascending fuel.
void enqueue(char *scName, int fuel, int priority) {
    node *newNode = (node*)malloc(sizeof(node));
    strcpy(newNode->scName, scName);
    newNode->fuel = fuel;
    newNode->priority = priority;
    newNode->prev = newNode->next = NULL;
    
    // If the list is empty, new node becomes head and tail.
    if (head == NULL) {
        head = tail = newNode;
        return;
    }
    
    node *curr = head;
    
    // Find the insertion point.
    // There are two cases:
    // 1. New node is emergency (priority == 1).
    //    We want to insert among the existing emergency nodes, sorted by fuel ascending.
    // 2. New node is non-emergency (priority != 1).
    //    We want to skip all emergency nodes, then insert in order among the non-emergency ones.
    
    if (priority == 1) {
        // Insert among emergency nodes.
        // As long as the current node is emergency and has a lower fuel than newNode, we skip.
        while (curr != NULL && curr->priority == 1 && curr->fuel <= fuel) {
            curr = curr->next;
        }
    } else {
        // New node is non-emergency.
        // First, skip all emergency nodes.
        while (curr != NULL && curr->priority == 1) {
            curr = curr->next;
        }
        // Then, among non-emergency nodes, skip those with fuel less than or equal to newNode's fuel.
        while (curr != NULL && curr->priority != 1 && curr->fuel <= fuel) {
            curr = curr->next;
        }
    }
    
    // Now, curr is the node after which we should insert newNode.
    // There are three cases:
    // Case A: Insertion at the beginning (curr is head)
    if (curr == head) {
        newNode->next = head;
        head->prev = newNode;
        head = newNode;
    }
    // Case B: Insertion in the middle (curr is not NULL)
    else if (curr != NULL) {
        newNode->next = curr;
        newNode->prev = curr->prev;
        curr->prev->next = newNode;
        curr->prev = newNode;
    }
    // Case C: Insertion at the tail (curr is NULL)
    else {
        tail->next = newNode;
        newNode->prev = tail;
        tail = newNode;
    }
}

// Pop (dequeue) the head node from the list
node* popHead() {
    if (head == NULL) {
        return NULL; // List is empty
    }
    
    node *removed = head;
    head = head->next;
    
    if (head != NULL) {
        head->prev = NULL;
    } else {
        tail = NULL; // List is now empty
    }
    
    removed->next = removed->prev = NULL;
    return removed;
}

// Display the docking order
void displayDock() {
    node *curr = head;
    puts("Docking Order:");
    while (curr != NULL) {
        printf("%s (fuel: %d, priority: %d) -> ", curr->scName, curr->fuel, curr->priority);
        curr = curr->next;
    }
    printf("NULL\n");
}

int main(){
    int totalShip;
    printf("Input total ship: ");
    scanf("%d", &totalShip);
    getchar();  // consume newline
    
    for (int i = 0; i < totalShip; i++) {
        char scName[50];
        int fuel, priority;
        printf("Input ship name: ");
        scanf("%[^\n]", scName);
        getchar();
        printf("Input fuel: ");
        scanf("%d", &fuel);
        getchar();
        printf("Input priority (1 for emergency, 0 for non-emergency): ");
        scanf("%d", &priority);
        getchar();
        
        enqueue(scName, fuel, priority);
    }
    
    displayDock();
    
    // Example: Dequeue the head element.
    node *removedNode = popHead();
    if (removedNode != NULL) {
        printf("\nDequeued: %s (fuel: %d, priority: %d)\n", removedNode->scName, removedNode->fuel, removedNode->priority);
        free(removedNode);
    }
    
    printf("\nDocking order after dequeue:\n");
    displayDock();
    
    return 0;
}
