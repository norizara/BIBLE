    #include <stdio.h>
    #include <string.h>
    #include <ctype.h>
    #include <stdlib.h>

    struct Node{
        int ID, Exam_Pass, Have_C_Grade, International_Achievement;
        int value;
        Node *left;
        Node *right;
        int height;
    };

    int count = 0;

    int valueConversion(int Exam_Pass, int Have_C_Grade){
        if(Exam_Pass == 0 && Have_C_Grade == 1) return 0; 
        if(Exam_Pass == 0 && Have_C_Grade == 0) return 1; 
        if(Exam_Pass == 1 && Have_C_Grade == 1) return 2; 
        if(Exam_Pass == 1 && Have_C_Grade == 0) return 3; 
        return -1;
    }

    Node *createNode(int ID, int Exam_Pass, int Have_C_Grade, int International_Achievement){
        Node *newNode = (Node*)malloc(sizeof(Node));
        newNode->ID = ID;
        newNode->Exam_Pass = Exam_Pass;
        newNode->Have_C_Grade = Have_C_Grade;
        newNode->International_Achievement = International_Achievement;
        newNode->value = valueConversion(newNode->Exam_Pass, newNode->Have_C_Grade);
        // printf("Current Value: %d\n", newNode->value);
        newNode->left = NULL;
        newNode->right = NULL;
        newNode->height = 1;

        return newNode;
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

    Node *rightRotate(Node *x){
        Node *y = x->left;
        Node *z = y->right;

        y->right = x;
        x->left = z;

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

    Node *insertAVL(Node* root, Node *newNode){
        if(root == NULL) return newNode;
        else if(root->value > newNode->value || (root->value == newNode->value && root->International_Achievement > newNode->International_Achievement)) root->left = insertAVL(root->left, newNode);
        else if(root->value < newNode->value || (root->value == newNode->value && root->International_Achievement < newNode->International_Achievement)) root->right = insertAVL(root->right, newNode);
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
        if(balance < -1){
            if(balanceFactor(root->right) <= 0) return leftRotate(root);
            else {
                root->right = leftRotate(root->right);
                return rightRotate(root);
            }
        }

        return root;
    }

    Node *insertStudent(Node *root, int ID, int Exam_Pass, int Have_C_Grade, int International_Achievement){
        // puts("Inserting...");
        Node *newNode = createNode(ID, Exam_Pass, Have_C_Grade, International_Achievement);
        root = insertAVL(root, newNode);
        count++;

        return root;
    }

    Node* deleteStudent(Node *root, int value, int International_Achievement, int ID){
    if(root == NULL) return NULL;
    if( value < root->value || (value == root->value && International_Achievement < root->International_Achievement)) {
        root->left = deleteStudent(root->left, value, International_Achievement, ID);
    }
    else if (value > root->value || (value == root->value && International_Achievement > root->International_Achievement)) {
        root->right = deleteStudent(root->right, value, International_Achievement, ID);
    }
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
                
                root->ID = temp->ID;
                root->Have_C_Grade = temp->Have_C_Grade;
                root->Exam_Pass = temp->Exam_Pass;
                root->International_Achievement = temp->International_Achievement;
                root->value = valueConversion(temp->Exam_Pass, temp->Have_C_Grade);
                
                root->left = deleteStudent(root->left, temp->value, temp->International_Achievement, temp->ID);
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
        if(balance < -1){
            if(balanceFactor(root->right) <= 0) return leftRotate(root);
            else {
                root->right = leftRotate(root->right);
                return rightRotate(root);
            }
        }
        // puts("Success Delete");

        return root;
    }

    int checkStudent(Node *root, int deletionID){
        if(root == NULL) return -1;
        if(root->ID == deletionID) return 1;

        int leftside = checkStudent(root->left, deletionID);
        if(leftside == 1) return 1;
        return checkStudent(root->right, deletionID);
    }

    int counter = 0;

    void inorder(Node* root){
        if(root != NULL && counter != 3){
            inorder(root->right);
            counter++;
            printf("ID: %d\n", root->ID);
            inorder(root->left);
        }
    }

Node* findNodeByID(Node* root, int ID) {
    if (root == NULL) return NULL;
    if (root->ID == ID) return root;
    Node* found = findNodeByID(root->left, ID);
    if (found != NULL) return found;
    return findNodeByID(root->right, ID);
}

    int main(){
        Node *root = NULL;
        int action;
        scanf("%d", &action); getchar();
        char Function;
        int ID, Exam_Pass, Have_C_Grade, International_Achievement;
        for(int i = 0; i < action; i++){
            scanf("%c", &Function);
            switch (Function)
            {
            case 'i':
                scanf(" %d %d %d %d", &ID, &Exam_Pass, &Have_C_Grade, &International_Achievement); getchar();
                root = insertStudent(root, ID, Exam_Pass, Have_C_Grade, International_Achievement);
                break;
            case 'd':
                // puts("deleting...");
                if(count == 0){
                    puts("Nothing to delete");
                }
                int deletionID;
                scanf(" %d", &deletionID); getchar();
                Node *nodeDelete = findNodeByID(root, deletionID);
                if(nodeDelete != NULL){
                    // puts("Student found.");
                    root = deleteStudent(root, nodeDelete->value, nodeDelete->International_Achievement, nodeDelete->ID);
                    count--;
                }
                break;
            }
        }

        inorder(root);
    }