// AVL tree --> BST self balancing
// Insert & Update

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Mahasiswa{
    int age;
    char name[101];
    struct Mahasiswa *left, *right;
    int height;
};

Mahasiswa *createNewMhs(int age, char *name){
    Mahasiswa *newMhs = (Mahasiswa*)malloc(sizeof(Mahasiswa));
    newMhs->age = age;
    strcpy(newMhs->name, name);
    newMhs->left = newMhs->right = NULL;
    newMhs->height = 1;
    return newMhs;
}

int max(int a, int b){
    return (a > b) ? a : b;
}

int getHeight(Mahasiswa *curr){
    if(curr == NULL){
        return 0;
    }
    return curr->height;
}

int getBalanceFactor(Mahasiswa *curr){
    if(curr == NULL){
        return 0;
    }
    return getHeight(curr->left) - getHeight(curr->right);
}

Mahasiswa *rightRotate(Mahasiswa *curr){
    Mahasiswa *currLeft = curr->left;
    Mahasiswa *currLeftRight = currLeft->right;

    curr->left->right = curr;
    curr->left = currLeftRight;

    curr->height = 1 + max(getHeight(curr->left), getHeight(curr->right));
    currLeft->height = 1 + max(getHeight(currLeft->left), getHeight(currLeft->right));

    return currLeft;
}

Mahasiswa *leftRotate(Mahasiswa *curr){
    Mahasiswa *currRight = curr->right;
    Mahasiswa *currRightLeft = currRight->left;

    curr->right->left = curr;
    curr->right = currRightLeft;

    curr->height = 1 + max(getHeight(curr->left), getHeight(curr->right));
    currRight->height = 1 + max(getHeight(currRight->left), getHeight(currRight->right));

    return currRight;
}

Mahasiswa *insertAVL(Mahasiswa *curr, int age, char name[100]){
    if(curr == NULL){
        return createNewMhs(age, name);
    }

    if(curr->age > age){
        curr->left = insertAVL(curr->left, age, name);
    } else if(curr->age < age){
        curr->right = insertAVL(curr->right, age, name);
    }

    curr->height = 1 + max(getHeight(curr->left), getHeight(curr->right));

    // LL
    if(getBalanceFactor(curr) > 1 && getBalanceFactor(curr->right) >= 0){
        // Right Rotation
        return rightRotate(curr);
    } 
    //RR
    else if (getBalanceFactor(curr) < -1 && getBalanceFactor(curr->right) <= 0){
        // Left Rotation
        return leftRotate(curr);
    } 
    // LR
    else if (getBalanceFactor(curr) > 1 && getBalanceFactor(curr->right) < 0){
        // Left Rotatuib Subtree --> Right Rotation Subtree
        curr->left = leftRotate(curr->left);
        return rightRotate(curr);
    } 
    // RL
    else if (getBalanceFactor(curr) < -1 && getBalanceFactor(curr->right) > 0){
        // Right Rotation Subtree --> Left Rotation Subtree
        curr->right = rightRotate(curr->right);
        return leftRotate(curr);
    }

    return curr;
}

void inorder(Mahasiswa *curr){
    if(!curr){
        return;
    }
    inorder(curr->left);
    printf("Age: %d Name: %s\n", curr->age, curr->name);
    inorder(curr->right);
}

int main(){
    Mahasiswa *root = NULL;
    root = insertAVL(root, 3, "cindy");
    root = insertAVL(root, 18, "cindy");
    root = insertAVL(root, 21, "cindy");
    root = insertAVL(root, 8, "cindy");
    root = insertAVL(root, 7, "cindy");
    root = insertAVL(root, 6, "cindy");
    root = insertAVL(root, 23, "cindy");

    inorder(root);
    return 0;
}