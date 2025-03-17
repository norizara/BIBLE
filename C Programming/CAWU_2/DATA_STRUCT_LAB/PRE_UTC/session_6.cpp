#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// inorder
// 1. left
// 2. print
// 3. right

struct Student{
    int id;
    char name[101];
    struct Student *left, *right;
};

struct Student *createStudent(int id, char *name){
    struct Student *newStudent = (struct Student*)malloc(sizeof(struct Student));
    newStudent->id = id;
    strcpy(newStudent->name, name);
    newStudent->left = newStudent->right = NULL;
    return newStudent;
}

struct Student *insert(struct Student *root, int id, char *name){
    // case 1 kalau tree belom dibuat makan kita bikin root nodenya saja
    if(root == NULL){
        return createStudent(id, name);
    }

    // case 2 id yang kita mau insert > current node punya id
    else if(id > root->id){
        root->right = insert(root->right, id, name);
    }

    // case 3 id yang kita mau insert < current node punya id
    else if(id < root->id){
        root->left = insert(root->left, id, name);
    }

    return root;
}

void inorder(struct Student *root){
    if(root == NULL){
        return;
    }
    inorder(root->left);
    printf("Student Id : %-5d | Name : %s\n", root->id, root->name);
    inorder(root->right);
}

void postorder(struct Student *root){
    if(root == NULL){
        return;
    }
    postorder(root->left);
    postorder(root->right);
    printf("Student Id : %-5d | Name : %s\n", root->id, root->name);
}

void preorder(struct Student *root){
    if(root == NULL){
        return;
    }
    printf("Student Id : %-5d | Name : %s\n", root->id, root->name);
    preorder(root->left);
    preorder(root->right);
}

struct Student *search(struct Student *root, int id){
    // case 1 kalau search gak ketemu
    if(root == NULL){
        return NULL;
    }
    // case 2 kalo search ketemu
    else if(root->id == id){
        return root;
    }
    // case 3 kalau id yang mau di search lebih besar dari current id
    else if(id > root->id){
        return search(root->right, id);
    }
    // case 4 kalau id yang mau di search lebih kecil dari current id
    else if(id < root->id){
        return search(root->left, id);
    }
}


struct Student *update(struct Student *root, int id, char *newName){
    // case 1 kalau search gak ketemu
    if(root == NULL){
        return NULL;
    }
    // case 2 kalo search ketemu
    else if(root->id == id){
        strcpy(root->name, newName);
        return root;
    }
    // case 3 kalau id yang mau di search lebih besar dari current id
    else if(id > root->id){
        return update(root->right, id, newName);
    }
    // case 4 kalau id yang mau di search lebih kecil dari current id
    else if(id < root->id){
        return update(root->left, id, newName);
    }
}

struct Student *findSuccessor(Student *root){
    struct Student *temp = root;
    while(temp->left != NULL){
        temp = temp->left;
    }
    return temp;
}

struct Student *deleteStudent(struct Student *root, int id) {
    if (root == NULL) {
        return NULL;
    }
    else if (id < root->id) {
        root->left = deleteStudent(root->left, id);
    }
    else if (id > root->id) {
        root->right = deleteStudent(root->right, id);
    }
    else {
        if (root->left == NULL && root->right == NULL) {
            free(root);
            return NULL;
        }
        else if (root->left == NULL || root->right == NULL) {
            struct Student *temp = root->left ? root->left : root->right;
            free(root);
            return temp;
        }
        else {
            struct Student *succ = findSuccessor(root->right);
            root->id = succ->id;
            strcpy(root->name, succ->name);
            root->right = deleteStudent(root->right, succ->id);
        }
    }
    return root;
}

struct Student *deleteAll(struct Student *root) {
    while(root){
        root = deleteStudent(root, root->id);
    }

    return root;
}

int main(){

    struct Student *root = NULL;
    puts("Inserting : ");
    root = insert(root, 100, "Louis");
    root = insert(root, 101, "Brandon");
    root = insert(root, 90, "Angeline");
    root = insert(root, 103, "Bryant");
    root = insert(root, 77, "Calvin");
    root = insert(root, 95, "Giselle");
    root = insert(root, 94, "Nathan");
    root = insert(root, 93, "Marchelle");

    inorder(root);

    Student *searchResult = search(root, 90);
    if(searchResult != NULL){
        printf("FOUND!\nStudent Id : %-5d | Name : %s\n", searchResult->id, searchResult->name);
    } else {
        puts("NOT FOUND!");
    }

    root = deleteStudent(root, 100);
    root = deleteStudent(root, 95);
    puts("After delete : ");
    inorder(root);
    puts("After delete all : ");
    root = deleteAll(root);
    return 0;
}
