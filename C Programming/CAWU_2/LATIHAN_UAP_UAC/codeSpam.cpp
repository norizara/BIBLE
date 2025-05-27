#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

struct Node{
    Node *left;
    Node *right;
    int height;
    char name[100];
};

int max(int a, int b){
    return a > b ? a : b;
}

int max(int a, int b){
    return a > b ? a : b;
}

int max(int a, int b){
    return a > b ? a : b;
}


int height (Node * root){
    if(root == NULL) return 0;
    return root->height;
}

int height(Node *root){
    if(root == NULL) return 0;
    return root->height;
}

int height(Node* root){
    if(root == NULL) return 0;
    return root->height;
}

int balanceFactor(Node* root){
    if(root == NULL) return 0;
    return height(root->left) - height(root->right);
}

Node *leftRotate(Node *x){
    Node *y = x->right;
    Node *z = y->left;

    y->left = x;
    y->right = z;

    x->height = max(height(x->left), height(x->right)) + 1;
    y->height = max(height(y->left), height(y->right)) + 1;

    return y;
}



Node *leftRotate(Node *x){
    Node *y = x->right;
    Node *z = y->left;

    y->left = x;
    y->right = z;

    x->height = max(height(x->left), height(x->right)) + 1;
    y->height = max(height(y->left), height(y->right)) + 1;

    return y;
}

Node *leftRotate(Node *x){
    Node *y = x->right;
    Node *z = y->left;

    y->left = x;
    x->right = z;

    x->height = max(height(x->left), height(x->right)) + 1;
    y->height = max(height(y->left), height(y->right)) + 1;

    return y;
}

Node *rightRotate(Node *x){
    Node *y = x->left;
    Node *z = y->right;

    y->right = x;
    x->right = z;

    x->height = max(height(x->left), height(x->right)) + 1;
    y->height = max(height(y->left), height(y->right)) + 1;

    return y;
}

Node *insertAVL(Node *root, Node *newNode){
    if(root == NULL) return newNode;
    else if(strcmp(root->name, newNode->name) > 0) root = insertAVL(root->left, newNode);
    else if(strcmp(root->name, newNode->name) < 0) root = insertAVL(root->right, newNode);
    else return root;

    root->height = max(height(root->left), height(root->right)) + 1;
    int balance = balanceFactor(root);

    if(balance > 1){
        if(balanceFactor(root->left) >= 0) return rightRotate(root);
        else {
            root->left = leftRotate(root->left);
            return rightRotate(root);
        }
    }
    if(balance < -1){
        if(balanceFactor(root->right) <= 0) return leftRotate(root);
        else {
            root->right = rightRotate(root->right);
            return leftRotate(root);
        }
    }
    
    return root;
}

Node *insertAVL(Node *root, Node *newNode){
    if(root == NULL) return newNode;
    else if (strcmp(root->name, newNode->name) > 0) root = insertAVL(root->left, newNode);
    else if (strcmp(root->name, newNode->name) < 0) root = insertAVL(root->right, newNode);
    else return root;

    root->height = max(height(root->left), height(root->right)) + 1;
    int balance = balanceFactor(root);

    if(balance > 1){
        if(balanceFactor(root->left) >= 0) return rightRotate(root);
        else {
            root->left = leftRotate(root->left);
            return rightRotate(root);
        }
    }
    if(balance < -1){
        if(balanceFactor(root->right)<=0) return leftRotate(root);
        else {
            root->right = rightRotate(root);
            return leftRotate(root);
        }
    }

    return root;
}


Node *insertAVL(Node *root, Node *newNode){
    if(root == NULL) return newNode; // empty tree;
    if(strcmp(root->name, newNode->name) > 0) root = insertAVL(root->left, newNode); // newNode is less than root
    if(strcmp(root->name, newNode->name) < 0) root = insertAVL(root->right, newNode); //newNode is more tan root
    else return root; // conditions are finished and return back to main.

    root->height = max(height(root->left), height(root->right)) + 1; // reassign new height;
    int balance = balanceFactor(root);

    if(balance > 1){
        if(balanceFactor(root->left) >= 0) return rightRotate(root);
    }
}



Node *deleteAVL(Node *root, char* name){
    if(root == NULL) return NULL;
    else if (strcmp(root->name, name) > 0) root = deleteAVL(root->left, name);
    else if (strcmp(root->name, name) < 0) root = deleteAVL(root->right, name);
    else{
        if(root->left == NULL && root->right == NULL){
            free(root);
            return NULL;
        } else if (root->left == NULL || root->right == NULL){
            Node *temp = root->left ? root->left : root->right;
            free(root);
            return temp;
        } else {
            Node *temp = root->left;
            while(temp->right){
                temp = temp->right;
            }

            strcpy(root->name, name);
            root->left = deleteAVL(root->left, temp->name);
        }
    }

    root->height = max(height(root->left), height(root->right)) + 1;
    int balance = balanceFactor(root);

    if(balance > 1){
        if(balanceFactor(root->left) >= 0) return rightRotate(root);
        else {
            root->left = leftRotate(root->left);
            return rightRotate(root);
        }
    }
    if(balance < -1){
        if(balanceFactor(root->right)<=0) return leftRotate(root);
        else {
            root->right = rightRotate(root);
            return leftRotate(root);
        }
    }

    return root;
}

int inTree(Node* root, char* name){
    if(root == NULL) return -1;
    if(strcmp(root->name, name) == 0) return 1;

    int leftSide = inTree(root->left, name);
    if(leftSide) return;
    return inTree(root->right, name);
}

Node *deleteTreatment(Node *root){
    char deleteName[101];

    if(inTree(root, deleteName)){
        root = deleteAVL(root, deleteName);
    }

    return root;
}

void preOrder(Node *root){
    if(root != NULL){
        printf("printed");
        preOrder(root->left);
        preOrder(root->right);
    }
}

void inOrder(Node *root){
    if(root!=NULL){
        inOrder(root->left);
        printf("printed");
        inOrder(root->right);
    }
}

void postOrder(Node *root){
    if(root!=NULL){
        postOrder(root->left);
        postOrder(root->right);
        printf("printed");
    }
}