#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>

struct Entry{
    int ID;
    bool impact;
    bool likelihood;
    int key;
};

struct HashTable {
    Entry table[10];
};

struct node{
    int ID;
    bool impact;
    bool likelihood;
    int priority;
    char severity[10];
    node *prev;
    node *next;
}*h,*t,*c;

int hashDivision(int key){
    return key % 10;
}

void insertToHash(HashTable *ht, int key, bool impact, bool likelihood){
    int index = hashDivision(key);
    int original_index = index;
    while(ht->table[index].key){
        index = (index + 1) % 10;
        if(index == original_index){
            puts("Table is full");
            return;
        }
    }
    ht->table[index].ID = key;
    ht->table[index].impact = impact;
    ht->table[index].likelihood = likelihood;
    ht->table[index].key = index; // mark sa filled
}   

int setPriority(bool impact, bool likelihood){
    if(impact && likelihood) return 3;
    else if(impact && !likelihood) return 2;
    else if(!impact && likelihood) return 1;
    else return 0;
}

char *setSeverity(int priority){
    if(priority == 3) 
    {
        return "Critical";
    } else if (priority == 2){
        return "High";
    } else if (priority == 1){
        return "Medium";
    } else {
        return "Low";
    }
}

void insert(int ID, bool impact, bool likelihood){
    c = (node*)malloc(sizeof(node));
    c->ID = ID;
    c->impact = impact;
    c->likelihood = likelihood;
    c->priority = setPriority(impact, likelihood);
    strcpy(c->severity, setSeverity(c->priority));
    c->next = NULL;
    c->prev = NULL;
    if(!h){
        h=t=c;
        return;
    }
    else if (h->priority < c->priority){
        c->next = h;
        h->prev = c;
        h = c;
        return;
    }
    else if (t->priority > c->priority){
        t->next = c;
        c->prev = t;
        t=c;
        return;
    }
    else{
        struct node *temp = h;
        while (temp->next != NULL && temp->next->priority >= c->priority) {
            temp = temp->next;
        }
        c->next = temp->next;
        if (temp->next != NULL) {
            temp->next->prev = c;
        }
        temp->next = c;
        c->prev = temp;
    }
}



void displayData(){
    if(!h){
        puts("No data");
        return;
    }
    node *temp = h;
    while(temp!=NULL){
        printf("ID: %d - %s\n", temp->ID, temp->severity);
        temp = temp->next;
    }
}

void processData(HashTable *ht){
    if(!h){
        puts("No data");
        return;
    }
    puts("Processing data...");
    insertToHash(ht, h->ID, h->impact, h->likelihood);
    node *temp = h;
    h = h->next;
    if(h){
        h->prev = NULL;
    } else {
        t = NULL;
    }
    free(temp);
}

void displayHashTable(HashTable *ht){
    puts("Stored Processed Vulnerabilities:");
    for(int i = 0; i < 10; i++){
        if(ht->table[i].key){ 
            printf("Index %d -> ID=%d\n", 
                ht->table[i].key, ht->table[i].ID);
        } 
    }
}


int main(){
    HashTable ht = {0};
    int choice = -1;
    while(choice!=5){
        puts("1. Add new data");
        puts("2. Display data");
        puts("3. Process data");
        puts("4. View Stored data");
        puts("5. Exit");
        scanf("%d", &choice);
        getchar();
        switch(choice){
            case 1:
                puts("Insert Data (ex. 3000,1,0)");
                int ID, impact, likelihood;
                scanf("%d,%d,%d", &ID, &impact, &likelihood); getchar();
                insert(ID, impact, likelihood);
                break;
            case 2:
                displayData();
                break;
            case 3:
                processData(&ht);
                break;
            case 4:
                displayHashTable(&ht);
                break;
            case 5:
                puts("Exiting...");
                break;
            default:
                puts("Invalid choice");
        }
    }
}