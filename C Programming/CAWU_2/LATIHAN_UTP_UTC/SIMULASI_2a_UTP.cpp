#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define TABLE_SIZE 200

typedef struct node{
	int value;
	char name[35];
	struct node *next;
}Node;

Node *hashTable[200];

int hash(char *name){
	long long int hashVal = 0;
	for(int i = 0; i<strlen(name); i++){
		hashVal += name[i];
	}
	int lastThreeDigit = hashVal % 1000;
	return lastThreeDigit % 200;
}

void insert(char *name, int value){
	
}

int main(){
	int idx = hash("necronomicon");
	printf("%d", idx);
	return 0;
}
