#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#define TABLE_SIZE 100

typedef struct node{
	char name[35];
	char ID[15];
	char title[55];
	int duration;
	char borrowingID[10];
	struct node *next;
} Hash;

Hash *hashTable[TABLE_SIZE] = {NULL};

int count = 0;

int hash(char *key){
	char numID[10];
	sprintf(numID, "%c%c%c", key[2], key[3], key[4]);
	int hashVal = atoi(numID);
	hashVal*=hashVal;
	char squareStr[20];
	sprintf(squareStr, "%d", hashVal);
	char temp [5];
	if(strlen(squareStr)%2==0){
		sprintf(temp, "%c%c", numID[strlen(numID)/2-1], numID[strlen(numID)/2]);
		return atoi(temp)%TABLE_SIZE;
	} else {
		sprintf(temp, "%c", numID[strlen(numID)/2]);
		return atoi(temp)%TABLE_SIZE;
	}
}

void borrowBook(){
	char name[35] = {'\n'};
	char ID[15] = {'\n'};
	char title[55] = {'\n'};
	int duration = 0;
	char borrowingID[10] = {'\n'};
	
	while(strlen(name)<3 || strlen(name)>30){
		printf("Enter your full name [3-30 character] >> ");
		scanf("%[^\n]", name); getchar();
	}
	while(strlen(ID)!=9){
		printf("Enter your ID [\"LIB-12345\"] >> ");
		scanf("%s", ID); getchar();
	}
	while(strlen(title)<3 || strlen(title)>50){
		printf("Enter book title [3-50] >> ");
		scanf("%[^\n]", title); getchar();
		}
	while(duration<1 || duration > 30){
		printf("Enter borrowing duration [1-30] >> ");
		scanf("%d", &duration); getchar();
	}
	sprintf(borrowingID, "%c%c%d%d%d", toupper(title[0]), toupper(title[1]), rand()%10, rand()%10, rand()%10);

	printf("Borrowing ID >> %s\n", borrowingID);
	
	int idx = hash(borrowingID);
	printf("%d\n", idx);
	
	Hash *newNode = (Hash*)malloc(sizeof(Hash));
	strcpy(newNode->name, name);
	strcpy(newNode->ID, ID);
	strcpy(newNode->title, title);
	newNode->duration = duration;
	strcpy(newNode->borrowingID, borrowingID);
	newNode->next;
	
	if(hashTable[idx] == NULL){
		hashTable[idx] = newNode;
	} else {
		newNode->next = hashTable[idx];
		hashTable[idx] = newNode;
	}
	count++;
}

void printHashTable() {
	if(count == 0){
		puts("============================================");
		puts("No books available");
		puts("============================================");
		return;
	}
    for (int i = 0; i < TABLE_SIZE; i++) {
        if (hashTable[i] != NULL) {
            printf("Index %d: \n", i);
            node *temp = hashTable[i];
            while (temp) {
                printf("Borrowing ID : %s\n", temp->borrowingID);
                printf("Borrower Name : %s\n", temp->name);
                printf("Library ID : %s\n", temp->ID);
                printf("Book Title : %s\n", temp->title);
                printf("Duration : %d day(s)\n", temp->duration);
				puts("============================================");
                temp = temp->next;
            }
//            printf("NULL\n");
        }
    }
}

void pop(char *key){
	if(count == 0){
		puts("============================================");
		puts("No books available");
		puts("============================================");
		return;
	}
	
	for(int i = 0; i < TABLE_SIZE; i++){
		node *temp = hashTable[i];
		node *prev = NULL;
		while(temp){
			if(strcmp(temp->borrowingID, key) == 0){
				if(prev == NULL){
					hashTable[i] = temp->next;
				} else {
					prev->next = temp->next;
				}
				printf("Borrowing ID: %s removed.\n", temp->borrowingID);
				free(temp);
				count--;
				return;
			}
			prev = temp;
			temp = temp->next;
		}
	}
	printf("Data not found.\n");
}

int main(){
	srand(time(NULL));
	int choice = -1;
	while(choice!=4){
//		system("cls");
		puts("============================================");
		puts("       BookHaven Library Management");
		puts("============================================");
		puts("1. Borrow a Book");
		puts("2. View Borrowed Books");
		puts("3. Return a Book");
		puts("4. Exit");
		puts("============================================");
		printf(">> ");
		scanf("%d", &choice); getchar();
		switch(choice){
			case 1:
				borrowBook();
				break;
			case 2:
				printHashTable();
				break;
			case 3:
				printf("Enter borrowing ID >> ");
				char ID[15];
				scanf("%s", ID);
				pop(ID);
				break;
			default:
				break;
		}
	}
}
