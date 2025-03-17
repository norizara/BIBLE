#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct Node
{
        int ID;
        char name[25];
        int price;
        struct Node *next;
} *head, *tail, *curr;
int count = 1;

void showCard(struct Node *head)
{
    if(head==NULL)
    {
        puts("No cards available. Press ENTER to continue...");
        getchar();
        return;
    }
    while(head != NULL)
    {
        printf("ID : %d\nName : %s\nPrice : %d\n", head->ID, head->name, head->price);
        head = head->next;
        puts("===========================");
    }
    puts("Press ENTER to continue..."); getchar();
}

void pushMid(char cardName[])
{
    curr = (struct Node*)malloc(sizeof(struct Node));
    strcpy(curr->name, cardName);
    curr->ID=count;
    count++;
    curr->price = 100;
    curr->next = NULL;
    if(!head) {
        head = tail = curr;
    } else if (strcmp(cardName, head->name) < 0) {
        curr->next=head;
        head = curr;
    } else if (strcmp(cardName, tail->name) > 0) {
        tail->next=curr;
        tail = curr;
    } else {
        Node *temp = head;
        while(strcmp(temp->next->name,cardName) < 0){
            temp = temp->next;
        }
        curr->next=temp->next;
        temp->next=curr;
    }
}

void popHeadMid(char cardName[])
{
    if(head==NULL) return;
    if(strcmp(head->name, cardName) == 0){
        struct Node *temp = head;
        head = head->next;
        temp->next=NULL;
        free(temp);
    } else {
        struct Node *temp1 = head;
        struct Node *temp2 = head->next;
        while(strcmp(temp2->name, cardName)!=0) {
            temp1 = temp1->next;
            temp2 = temp2->next;
        }
        temp1->next=temp2->next;
        temp2->next=NULL;
        free(temp2);
    }
    count--;
}

void buyCard()
{
    char card[25];
    printf("Card you want\n>> ");
    scanf("%s", card); getchar();
    pushMid(card);
    count++;
}

void sellCard()
{
    // showCard(head);
    char card[25];
    printf("Card you want to sell\n>> ");
    scanf("%s", card); getchar();
    popHeadMid(card);
}

void tradeCard()
{
    buyCard();
    sellCard();
    showCard(head);

}
int main(){
    char startCard[25];
    strcpy(startCard, "Vulpix");
    pushMid(startCard);
    strcpy(startCard, "Diglett");
    pushMid(startCard);
    strcpy(startCard, "Zubat");
    pushMid(startCard);
    strcpy(startCard, "Nidoran");
    pushMid(startCard);
    int choice = -1;
    while(choice != 5)
    {
        system("cls");
        puts("Card Exchange");
        puts("=============");
        puts("1. Buy Card");
        puts("2. Sell Card");
        puts("3. Show Card");
        puts("4. Trade Card");
        puts("5. Exit");
        puts("=============");
        printf(">> ");
        scanf("%d", &choice); getchar();

        switch (choice)
        {
        case 1:
            buyCard();
            break;
        case 2:
            showCard(head);
            sellCard();
            break;
        case 3:
            showCard(head);
            break;
        case 4:
            tradeCard();
            break;
        default:
            break;
        }
    }
}