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
    printf("Student Id : %d, Name : %s\n", root->id, root->name);
    inorder(root->right);
}

struct Student *search(struct Student *root, int id){
    // case 1 kalau search gak ketemu
    if(root == NULL){
        puts("NOT FOUND!");
        return NULL;
    }
    // case 2 kalo search ketemu
    else if(root->id == id){
        puts("FOUND");
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

int main(){

    struct Student *root = NULL;
    puts("Inserting : ");
    root = insert(root, 3, "bill");
    root = insert(root, 1, "tom");
    root = insert(root, 16, "jake");
    root = insert(root, 78, "diana");
    root = insert(root, 33, "eve");

    puts("Insert successfully");

    puts("Inorder transerval");
    inorder(root);
    printf("%d\n", root->id);

    puts("Searching");
    struct Student *searchedStudent = search(root, 378);
    if(searchedStudent != NULL){
        printf("Found Student with id %d and name %s\n", searchedStudent->id, searchedStudent->name);
    }

    return 0;

}