#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

struct node{
    int val;
    int height;
    node* left;
    node* right;
};

node* createnode(int val){
    node* newnode = (node*)malloc(sizeof(node));
    newnode->val = val;
    newnode->height = 1;
    newnode->left = NULL;
    newnode->right = NULL;
    return newnode;
}

int height(node *root){
    if(root == NULL){
        return 0;
    }
    return root->height;
}

int max(int a, int b){
    return a > b ? a : b;
}

int getBalance(node *root){
    if(root == NULL){
        return 0;
    }
    return height(root->left) - height(root->right);
}

node *leftRotate(node *x){
    node *y = x->right;
    node *T2 = y->left;

    x->right = T2;
    y->left = x;

    x->height = 1 + max(height(x->left), height(x->right));
    y->height = 1 + max(height(y->left), height(y->right));

    return y;
}

node *rightRotate(node *x){
    node *y = x->left;
    node *T2 = y->right;

    x->left = T2;
    y->right = x;

    x->height = 1 + max(height(x->left), height(x->right));
    y->height = 1 + max(height(y->left), height(y->right));

    return y;
}

node *insert(node *root, int val){
    if(root == NULL){
        return createnode(val);
    }
    if(val < root->val){
        root->left = insert(root->left, val);
    }
    else if(val > root->val){
        root->right = insert(root->right, val);
    } else {
        return root;
    }

    root->height = 1 + max(height(root->left), height(root->right));

    int balance = getBalance(root);

    if(balance < -1 && val > root->right->val){
        return leftRotate(root);
    }
    if(balance > 1 && val < root->left->val){
        return rightRotate(root);
    }
    if(balance < -1 && val < root->right->val){
        root->right = rightRotate(root->right);
        return leftRotate(root);
    }
    if(balance > 1 && val > root->left->val){
        root->left = leftRotate(root->left);
        return rightRotate(root);
    }

    return root;
}

void inOrder(node *root){
    if(root == NULL){
        return;
    }
    inOrder(root->left);
    printf("%c ", root->val);
    inOrder(root->right);
}

node *minValueNode(node *root){
    node *current = root;
    while(current->left != NULL){
        current = current->left;
    }
    return current;
}

node *deleteNode(node *root, int val){
    if(root == NULL){
        return root;
    } 
    if(val < root->val){
        deleteNode(root->left, val);
    } else if(val > root->val){
        deleteNode(root->right, val);
    } else {
        if(root->left == NULL || root->right == NULL){
            node *temp = root->left ?  root->left : root->right;

            if(temp == NULL){
                temp = root;
                root = NULL;
            } else {
                *root = *temp;
            }
            free(temp);
        } else {
            node *temp = minValueNode(root->right);
            root->val = temp->val;
            root->right = deleteNode(root->right, temp->val);
        }
    }

    if(root == NULL){
        return root;
    }
    root->height = 1 + max(height(root->left), height(root->right));
    int balance = getBalance(root);
    if(balance > 1 && getBalance(root->left) >= 0){
        return rightRotate(root);
    } 
    if(balance > 1 && getBalance(root->left) < 0){
        root->left = leftRotate(root->left);
        return rightRotate(root);
    }
    if(balance < -1 && getBalance(root->right) <= 0){
        return leftRotate(root);
    }
    if(balance < -1 && getBalance(root->right) > 0){
        root->right = rightRotate(root->right);
        return leftRotate(root);
    }
    return root;
}

int main(){
    node *root = NULL;
    root = insert(root, 'S');
    root = insert(root, 'O');
    root = insert(root, 'F');
    root = insert(root, 'T');
    root = insert(root, 'W');
    root = insert(root, 'A');
    root = insert(root, 'R');
    root = insert(root, 'E');
    inOrder(root);
    puts("");
    puts("===============================");
    root = deleteNode(root, 'A');
    root = deleteNode(root, 'E');
    inOrder(root);
    puts("");
    puts("===============================");
    return 0;
}