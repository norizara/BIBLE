#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define SIZE 50
struct Data{
char coin[5];
double price;
Data *next;
} *arr[SIZE];

int midSquare(char coin[]){
int len = strlen(coin);
int mid = len/2;
int sum = 0;
for(int i = 0; i < len; i++){
sum += coin[i];
}
printf("Sum: %d\n", sum);
sum*=sum;

char sumStr[10] = "";
sprintf(sumStr, "%d", sum);
len = strlen(sumStr);

if(len%2==0){
    mid = len/2;
    char temp[10];
    sprintf(temp, "%c%c", sumStr[mid-1], sumStr[mid]);
    return atoi(temp) % SIZE;
} else {
    mid = len/2;
    char temp[10];
    sprintf(temp, "%c%c%c", sumStr[mid-1],sumStr[mid], sumStr[mid+1]);
    return atoi(temp)%SIZE;
}


}

void insert(char coin[], double price){
    Data *data = (Data*)malloc(sizeof(Data));
    data->price = price;
    strcpy(data->coin, coin);
    data->next = NULL;
    int index = midSquare(coin);
    //Insert with chaining collision handling
    if (arr[index] == NULL) {
        arr[index] = data;
    } else {
        Data *temp = arr[index];
        while (temp->next != NULL) {
            temp = temp->next;
        }
        temp->next = data;
    }
    printf("%d\n", index);
}

int main(){
insert("BTC", 97000.00);
insert("ETH", 2700.00);
insert("SOL", 172.59);
insert("XRP", 2.57);
return 0;
}