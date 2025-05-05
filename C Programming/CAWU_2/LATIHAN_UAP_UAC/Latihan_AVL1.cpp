#include <stdio.h>
#include <stdlib.h>

struct nodes{
    int height = 1, value;
    nodes* left;
    nodes* right;
} *root;

int max_child_height(nodes* root){
    return root->left->height > root->right->height ? root->left->height : root->right->height;
}

int balance_factor(nodes* root){
    return root->left->height - root->right->height;
}

nodes* left_rotate(nodes* x){
    nodes *y = x->right;
    nodes *n = y->left;
    
    y->left = x;
    x->right = n;

    x->height = max_child_height(x) + 1;
    y->height = max_child_height(y) + 1;

    return y;
}

nodes* right_rotate(nodes* x){
    nodes *y = x->left;
    nodes *n = y->right;
    
    y->right = x;
    x->left = n;

    x->height = max_child_height(x) + 1;
    y->height = max_child_height(y) + 1;

    return y;
}

nodes*   balancing(nodes* root, int bf){
    if(bf > 1 && balance_factor(root->left) >= 0){
        return right_rotate(root);
    } else if (bf < -1 && balance_factor(root->right) <= 0){
        return left_rotate(root);
    }
}

void insert(nodes *root, int value){

}