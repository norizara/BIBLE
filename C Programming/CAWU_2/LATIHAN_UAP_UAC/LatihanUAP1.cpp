#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>


struct Node{
    char name[101];
    int price;
    char cate[20];
    char avail[20];
    int height;
    Node *left;
    Node *right;
};

int count = 0;

Node *createNewNode(char *name, int price, char *cate, char *avail){
    Node* newNode = (Node*)malloc(sizeof(Node));
    strcpy(newNode->name, name);
    strcpy(newNode->cate, cate);
    strcpy(newNode->avail, avail);
    newNode->price = price;
    newNode->height = 1;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

int validationName(char* name){
	if(strncmp(name, "Sally", 5) != 0 || strlen(name) < 10 || strlen(name) > 25){
		return -1; 
	}
	
	int space = 0, letterAfterSpace = 0, flag = 0, x = strlen(name); 
	
	for(int i=0; i<x; i++){
		if(name[i] == ' ' && flag == 0){
			space++; 
			flag = 1; 
		}
		if(name[i] != ' ' && flag == 1){
			letterAfterSpace++; 
			flag = 0; 
		}
	}
	
	if(space > 0 && letterAfterSpace > 0) return 1; 
	return -1; 
}

int max(int a, int b){
    return a > b ? a : b;
}

int height(Node *root){
    if(root == NULL) return 0;
    return root->height;
}

int balanceFactor(Node *root){
    if(root == NULL) return 0;
    return height(root->left) - height(root->right);
}

Node *leftRotate(Node* x){
    Node *y = x->right;
    Node *z = y->left;

    y->left = x;
    x->right = z;

    x->height = max(height(x->left), height(x->right)) + 1;
    y->height = max(height(y->left), height(y->right)) + 1;

    return y;
}

Node *rightRotate(Node* x){
    Node *y = x->left;
    Node *z = y->right;

    y->right = x;
    x->left = z;

    x->height = max(height(x->left), height(x->right)) + 1;
    y->height = max(height(y->left), height(y->right)) + 1;

    return y;
}

Node* insertAVL(Node *root, Node *newNode){
    if(root == NULL) return newNode;
    else if(strcmp(root->name, newNode->name) > 0) root->left = insertAVL(root->left, newNode);
    else if(strcmp(root->name, newNode->name) < 0) root->right = insertAVL(root->right, newNode);
    else return root;

    root->height = max(height(root->left), height(root->right)) + 1;
    int balance = balanceFactor(root);

    if(balance > 1){
        if(balanceFactor(root->left) >= 0) return rightRotate(root);
        else{
            root->left = leftRotate(root->left);
            return rightRotate(root);
        }
    }
    if(balance < 1){
        if(balanceFactor(root->right) <= 0) return leftRotate(root);
        else{
            root->right = rightRotate(root->left);
            return leftRotate(root);
        }
    }
    return root;
}



Node* insertTreatment(Node *root){
    system("cls");

    char name[101], cate[20], avail[20]; 
	int price; 

    do{
		printf("insert name: "); 
		scanf("%[^\n]", name); getchar(); 
	} while(validationName(name) == -1); 
	
	do{
		printf("insert price [50.000 - 1.000.000]: "); 
		scanf("%d", &price); getchar(); 
	} while(price < 50000 || price > 1000000); // inclusive 
	
	do{
		printf("insert category [Hair Care | Nail Care | Body Care]: "); 
		scanf("%[^\n]", cate); getchar(); 
	} while(strcmp(cate, "Hair Care") != 0  && strcmp(cate, "Nail Care") != 0 &&
			strcmp(cate, "Body Care") != 0); // case sensitive 
			
	do{
		printf("insert availability: "); 
		scanf("%s", avail); getchar(); // case sensitive 
	} while(strcmp(avail, "Available") != 0 && strcmp(avail, "Unavailable") != 0);

    Node *newNode = createNewNode(name, price, cate, avail);
    root = insertAVL(root, newNode);

    count++;

    return root;
}


void preorder(Node* root){
    if(root != NULL){
        printf("Treatement   : %s\n", root->name);
        printf("Price        : %d\n", root->price);
        printf("Category     : %s\n", root->cate);
        printf("Availability : %s\n", root->avail);

        preorder(root->left);
        preorder(root->right);
    }
}
void inorder(Node* root){
    if(root != NULL){
        inorder(root->left);
        printf("Treatement   : %s\n", root->name);
        printf("Price        : %d\n", root->price);
        printf("Category     : %s\n", root->cate);
        printf("Availability : %s\n", root->avail);
        inorder(root->right);
    }
}
void postorder(Node* root){
    if(root != NULL){
        postorder(root->left);
        postorder(root->right);
        printf("Treatement   : %s\n", root->name);
        printf("Price        : %d\n", root->price);
        printf("Category     : %s\n", root->cate);
        printf("Availability : %s\n", root->avail);
    }
}

void viewTreatment(Node *root){
    if(count == 0){
        printf("No Data Available");
        getchar();
        return;
    }
    char choice[20];
    puts("Input view order [pre | in | post]");
    do{
        printf(">> ");
        scanf("%s", choice); getchar();
        for (int i = 0; i < strlen(choice); i++)
        {
            choice[i] = tolower(choice[i]);
        }
    } while(strcmp(choice, "pre") != 0 && strcmp(choice, "in")!=0 && strcmp(choice, "post")!=0);
    if (strcmp(choice, "pre")==0) preorder(root);
    else if(strcmp(choice, "in") == 0) inorder(root);
    else postorder(root);
    
    getchar();
}

Node *deleteAVL(Node* root, char *name){
    if(root == NULL) return NULL;
    else if(strcmp(root->name, name) > 0) root->left = deleteAVL(root->left, name);
    else if(strcmp(root->name, name) < 0) root->right = deleteAVL(root->right, name);
    else{
        if(root->left == NULL && root->right == NULL){
            free(root);
            return NULL; // Ga ada lagi child
        }
        else if(root->left == NULL || root->right == NULL){
            Node* temp = root->left ? root->left : root->right;
            free(root);
            return temp;
        }
        else {
            Node *temp = root->left;

            while(temp->right){
                temp = temp->right;
            }

            // copy predecessor

            strcpy(root->name, temp->name);
            strcpy(root->cate, temp->cate);
            strcpy(root->avail, temp->avail);
            root->price = temp->price;

            root->left = deleteAVL(root->left, temp->name);
        }
    }

    root->height = max(height(root->left), height(root->right)) + 1;
    int balance = balanceFactor(root);

    if(balance > 1){
        if(balanceFactor(root->left) >= 0) return rightRotate(root);
        else{
            root->left = leftRotate(root->left);
            return rightRotate(root);
        }
    }
    if(balance < 1){
        if(balanceFactor(root->right) <= 0) return leftRotate(root);
        else{
            root->right = rightRotate(root->left);
            return leftRotate(root);
        }
    }
    return root;
}

int inTree(Node *root, char *name){
    if(root == NULL) return -1;
    if(strcmp(root->name, name) == 0) return 1;

    int leftSide = inTree(root->left, name);
    if(leftSide == 1) return 1;
    return inTree(root->right, name);
}

Node *deleteTreatment(Node* root){
    if(count == 0){
        printf("No Data Available");
        getchar();
        return NULL;
    }

    char name[101];

    printf("Insert name you want to delete\n>> ");
    scanf("%s", name); getchar();
    if(inTree(root, name) == 1){
        root = deleteAVL(root, name);
        count--;
    }
    else printf("Data does not exist");

    return root;
}

int main(){
    Node *root = NULL;
    while(1){
        int choice = -1;
        system("cls");
        puts("Sally Salon");
        puts("===========");
        puts("1. View Available Treatment");
        puts("2. Insert New Treatment");
        puts("3. Delete Treatment");
        puts("4. Exit");
        puts("===========");
        while(choice < 1 || choice > 4){
            printf(">> "); scanf("%d", &choice); getchar();
        }
        switch (choice)
        {
        case 1:
            viewTreatment(root);
            break;
        case 2:
            root = insertTreatment(root);
            break;  
        case 3:
            root = deleteTreatment(root);
            break;
        case 4:
            return 0;
            break;
        default:
            break;
        }
    }
}