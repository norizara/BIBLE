#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

typedef struct tnode{
    int value;
    struct tnode *left;
    struct tnode *right;
}tnode;

tnode *createNode(int value){
    tnode *newNode = (tnode *)malloc(sizeof(tnode));
    newNode->value = value;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

tnode *buildBST(tnode* root, int value){
    if(root == NULL){
        return createNode(value);
    }

    if(value < root->value){
        root->left = buildBST(root->left, value);
    }else if(value > root->value){
        root->right = buildBST(root->right, value);
    }

    return root;
}

int search(tnode *root, int value){
    if(root == NULL){
        return -1;
    }

    if(root->value == value){
        return root->value;
    } else if(value < root->value){
        return search(root->left, value);
    } else{
        return search(root->right, value);
    }

    return root->value;
}

void inOrder(tnode *root){
    if(root == NULL){
        return;
    }

    inOrder(root->left);
    printf("%d ", root->value);
    inOrder(root->right);
}

tnode*deleteNode(tnode *root, int value){
    if(root == NULL){
        return root;
    }

    if(value < root->value){
        root->left = deleteNode(root->left, value);
    }else if(value > root->value){
        root->right = deleteNode(root->right, value);
    }else{
        if (root->left==NULL && root->right==NULL) \
        {
            free(root);
            return NULL;
        }
        
        if(root->left == NULL){
            tnode *temp = root->right;
            free(root);
            return temp;
        }else if(root->right == NULL){
            tnode *temp = root->left;
            free(root);
            return temp;
        }

        tnode *temp = root->right;
        while(temp->left != NULL){
            temp = temp->left;
        }

        root->value = temp->value;
        root->right = deleteNode(root->right, temp->value);
    }

    return root;
}

int main(){
    tnode *root = NULL;
    root = buildBST(root, 6);
    root = buildBST(root, 10);
    root = buildBST(root, 3);

    printf("Root: %d\n", root->value);

    printf("Search 3: %d\n", search(root, 3));
    printf("Search 10: %d\n", search(root, 10));

    inOrder(root);
    printf("\n");
    deleteNode(root, 3);
    inOrder(root);
    printf("\n");
    return 0;
}