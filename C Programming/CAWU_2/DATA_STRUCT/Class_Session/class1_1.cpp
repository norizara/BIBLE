#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int getHashKey(char *key){
	int sumhash = 0;
	for(int i = 0; key[i] != '\0'; i++){
		sumhash += key[i]; // Sum ASCII values
	}
	printf("%s %d\n", key, sumhash);
	return (sumhash % 100); // Correctly extract last two digits
}


int main(){
    getHashKey("Update");
}