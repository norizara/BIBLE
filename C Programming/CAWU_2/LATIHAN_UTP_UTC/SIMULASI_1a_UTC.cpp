#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#define T_S 100

struct node{
	char TASK_NAME[55];
	int priority;
	node *next;
}*h;

struct hash{
	char TASK_NAME[55];
	node *head;
}table[T_S];

void pushMid(char *TASK_NAME, int priority){
	node *newNode = (node*)malloc(sizeof(node));
	strcpy(newNode->TASK_NAME, TASK_NAME);
	newNode->priority = priority;
	newNode->next = NULL;
	
	if(!h){
		h = newNode;
	} else if(newNode->priority < h->priority){
		newNode->next = h;
		h = newNode;
	}
	else{
		node *temp = h;
		while(temp->next!=NULL && temp->next->priority <= priority){
			temp = temp->next;			
		}
		if(temp->next == NULL){
			temp->next = newNode;
		} else {
			newNode->next = temp->next;
			temp->next = newNode;
		}
	}
}


int getHashKey(char *key){
	int sumhash = 0;
	for(int i = 0; key[i] != '\0'; i++){
		sumhash += key[i]; // Sum ASCII values
	}
	printf("%s %d\n", key, sumhash);
	return (sumhash % 100); // Correctly extract last two digits
}



void execute(){
	if (!h) {
		printf("No tasks to execute!\n");
		return;
	}

	// Remove the highest priority task (head of the list)
	node *temp = h;
	h = h->next;
	temp->next = NULL; // Isolate the node before insertion

	// Get hash key
	int hashIndex = getHashKey(temp->TASK_NAME);

	// Insert into the hash table using pushTail
	if (!table[hashIndex].head) {
		table[hashIndex].head = temp;
	} else {
		node *curr = table[hashIndex].head;
		while (curr->next) {
			curr = curr->next;
		}
		curr->next = temp;
	}

	printf("Executed task: %s\n", temp->TASK_NAME);
}



void printTable(){
	for (int i = 0; i < T_S; i++) {
		node *temp = table[i].head;
		if(temp)
		printf("Hash Index %d: ", i);
		while (temp) {
			printf("%s\n", temp->TASK_NAME);
			temp = temp->next;
		}
	}
}

int main(){
	char choice[20];
	while(1){
		scanf("%s", choice);
		getchar();
		if(strcmp(choice, "ADD") == 0){
			char TASK_NAME[55];
			int priority = 0;
			scanf("%s %d", TASK_NAME, &priority);
			pushMid(TASK_NAME, priority);
			getchar();
		} else if (strcmp(choice, "EXECUTE") == 0){
			execute();	
		} else if (strcmp(choice, "PRINT_HASH_TABLE") == 0){
			printTable();
		}
	}
}
