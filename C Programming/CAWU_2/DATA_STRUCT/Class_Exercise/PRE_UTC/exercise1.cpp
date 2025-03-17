#include <stdio.h>
#include <string.h>

struct data
{
    char name[20];
    char rank[20];
    int hp;
    int magic;
    int gold;
} Player[50];

int playerCount = 0;

void viewName()
{
    for (int i = 0; i < playerCount; i++)
            {
                printf("%s, %s\n", Player[i].name, Player[i].rank);
            }
}

int main()
{
    int choice = -1;
    while(choice != 0)
    {
        printf("============\n");
        puts("1. Insert");
        puts("2. View");
        puts("3. Delete");
        puts("4. Upgrade");
        puts("0. Exit");
        printf("============\n>> ");
        scanf("%d", &choice);
        getchar();
            char select3[20];
            char select4[20];
            int flag = -1;
            int idx = -1;
        switch (choice)
        {
        case 1:
            printf("Insert name\n>> ");
            scanf("%s", Player[playerCount].name);
            getchar();
            while(
                strcmp(Player[playerCount].rank, "bronze") != 0 && 
                strcmp(Player[playerCount].rank, "silver") != 0 && 
                strcmp(Player[playerCount].rank, "gold") != 0)
            {
                printf("Insert rank [ bronze | silver | gold ]\n>> ");
                scanf("%s", Player[playerCount].rank);
                getchar();
            }
            printf("Insert hp\n>> ");
            scanf("%d", &Player[playerCount].hp);
            printf("Insert magic\n>> ");
            scanf("%d", &Player[playerCount].magic);
            printf("Insert gold\n>> ");
            scanf("%d", &Player[playerCount].gold);
            playerCount++;
            break;
        case 2:
            viewName();
            break;
        case 3:
            if(playerCount < 0) break;
            viewName();
            while(flag != 1)
            {
                    printf("Which player do you want to delete? : ");
                scanf("%s", select3);
                getchar();
                for (int i = 0; i < playerCount; i++)
                {
                    if(strcmp(select3, Player[i].name) == 0)
                    {
                        idx = i;
                        flag = 1;
                    }
                }
            }
            for(int i = idx; i < playerCount; i++)
            {
                Player[i] = Player[i+1];
            }
                flag = -1;
                idx = -1;
            playerCount--;
            break;
        case 4:
            if(playerCount < 0) break;
            while(flag != 1)
            {
                printf("Which player do you want to upgrade? : ");
                scanf("%s", select4);
                getchar();
                for (int i = 0; i < playerCount; i++)
                {
                    if(strcmp(select4, Player[i].name) == 0)
                    {
                        idx = i;
                        flag = 1;
                    }
                }
            }
            if(Player[idx].gold < 50) break;
            Player[idx].hp += 150;
            Player[idx].magic += 150;
            Player[idx].gold -= 50;
            idx = -1;
            flag = -1;
            break;
        default:
            break;
        }
    }
}