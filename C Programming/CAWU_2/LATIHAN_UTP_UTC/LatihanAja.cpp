#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#define T_S 10

typedef struct hashing{
	int value;
	char name[20];
	struct hashing *next;
}Hash;

Hash *hashTable[T_S] = {NULL};

// not midsquare.
int getHash(const char *name, int age){
	int val = 0;
	for(int i = 0; i < strlen(name); i++){
		val += name[i];
	}
	val+=age;
	val*=val;
	return val%T_S;
}

// chaining hash
void insertChain(const char *name, int age){
	int idx = getHash(name, age);
//	printf("%d\n", idx);
	Hash *newHash = (Hash*)malloc(sizeof(Hash));
	if(!newHash) return;
	strcpy(newHash->name, name);
	newHash->value = age;
	newHash->next = NULL;
	if(!hashTable[idx]){
		hashTable[idx] = newHash;
	} else {
		Hash *temp = hashTable[idx];
		while(temp->next){
			temp = temp->next;
		}
		temp->next = newHash;
	}
}

// linear probing hash
void insertProbe(const char *name, int age){
	int idx = getHash(name, age);
	Hash *newHash = (Hash*)malloc(sizeof(Hash));
	if(!newHash) return;
	strcpy(newHash->name, name);
	newHash->value = age;
	newHash->next = NULL;
	int count = 0;
	if(!hashTable[idx]){
		hashTable[idx] = newHash;
	} else {
		Hash *temp = hashTable[idx];
		while (hashTable[idx] && count < T_S) {
    	idx = (idx*idx) % T_S; // Pastikan indeks tetap dalam batas tabel hash
    	count++;
 	}
 	if(count == T_S){
 		printnf("Full.\n");
 		free(newHash);
 		return;
	}
		hashTable[idx] = newHash;
	}
}

// quadratic porbing hash

void displayHashChain() { // Chain
    printf("\nHash Table Contents:\n");
    for (int i = 0; i < T_S; i++) {
        printf("[%d]: ", i);
        Hash *temp = hashTable[i];
        while (temp) {
            printf("(%s, %d) -> ", temp->name, temp->value);
            temp = temp->next;
        }
        printf("NULL\n");
    }
}

int main(){
	insertChain("Bobby", 15);
	displayHashChain();
	return 0;
}
