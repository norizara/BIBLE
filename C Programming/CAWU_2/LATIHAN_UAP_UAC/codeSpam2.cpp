#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

struct Node{
    int value;
    int height;
    Node *left;
    Node *right;
};

Node *createNewNode(int value){
    Node *newNode = (Node*)malloc(sizeof(Node));
    newNode->value = value;
    newNode->height = 1;
    newNode->left = NULL;
    newNode->right = NULL;

    return newNode;
}

int max(int a, int b)
{
    return a > b ? a : b;
}

int height(Node *root){
    if(root == NULL) return 0;
    else return root->height;
}

int balanceFactor(Node* root){
    if(root == NULL) return 0;
    return height(root->left) - height(root->right);
}

Node* rightRotate(Node *x){
    Node *y = x->left;
    Node *z = y->right;

    y->right = x;
    x->left = z;

    x->height = max(height(x->left), height(x->right)) + 1;
    y->height = max(height(y->left), height(y->right)) + 1;

    return y;
}

Node* leftRotate(Node *x){
    Node *y = x->right;
    Node *z = y->left;

    y->left = x;
    x->right = z;

    x->height = max(height(x->left), height(x->right)) + 1;
    y->height = max(height(y->left), height(y->right)) + 1;

    return y;
}

Node* insertToAVL(Node* root, Node* newNode){
    if(root == NULL) return newNode;
    else if(root->value > newNode->value) root->left = insertToAVL(root->left, newNode);
    else if(root->value < newNode->value) root->right = insertToAVL(root->right, newNode);
    else return root;

    root->height = max(height(root->left), height(root->right)) + 1;
    int balance = balanceFactor(root);

    if(balance > 1){
        if(balanceFactor(root) >= 0) return rightRotate(root);
        else{
            root->left = leftRotate(root->left);
            return rightRotate(root);
        }
    }
    if(balance < -1){
        if (balanceFactor(root) <= 0) return leftRotate(root);
        else {
            root->right = rightRotate(root->right);
            return leftRotate(root);
        }
        
    }

    return root;
}


Node *insertFunction(int value, Node* root){
    Node* newNode = createNewNode(value);
    root = insertToAVL(root, newNode);

    return root;
}

void inorder(Node *root){
    if(root!=NULL){
        inorder(root->left);
        printf("Value: %d\n", root->value);
        inorder(root->right);
    }
}

bool traverseTree(Node* root, int target){
    if(root == NULL) return false;
    if(root->value == target) return true;

    bool leftSide = traverseTree(root->left, target);
    if(leftSide) return leftSide;
    return traverseTree(root->right, target);
}

Node *deleteInAVL(Node *root, int target){
    if(root == NULL) return NULL;
    else if(root->value > target) root->left = deleteInAVL(root->left, target);
    else if(root->value < target) root->right = deleteInAVL(root->right, target);
    else{
        if(root->left == NULL && root->right == NULL){
            free(root);
            return NULL;
        } else if (root->left == NULL || root->right == NULL){
            Node* temp = root->left ? root->left : root->right;
            free(root);
            return(temp);
        } else {
            Node* temp = root->left;
            while(temp->right!=NULL){
                temp = temp->right;
            }

            root->value = temp->value;
            root->left = deleteInAVL(root->left, temp->value);
        }
    }

    root->height = max(height(root->left), height(root->right)) + 1;
    int balance = balanceFactor(root);

    if(balance > 1){
        if(balanceFactor(root) >= 0) return rightRotate(root);
        else{
            root->left = leftRotate(root->left);
            return rightRotate(root);
        }
    }
    if(balance < -1){
        if (balanceFactor(root) <= 0) return leftRotate(root);
        else {
            root->right = rightRotate(root->right);
            return leftRotate(root);
        }
        
    }

    return root;
}

Node *deleteFunction(int target, Node *root){
    if(traverseTree(root, target)){
        puts("Found");
        root = deleteInAVL(root, target);
        return root;
    } else {
        puts("Not Found");
        return root;
    }

}

int main(){
    Node *root = NULL;
    root = insertFunction(10, root);    
    root = insertFunction(20, root);    
    root = insertFunction(5, root);    
    root = insertFunction(30, root);    

    inorder(root);
    
    root = deleteFunction(10, root);
    inorder(root);
}