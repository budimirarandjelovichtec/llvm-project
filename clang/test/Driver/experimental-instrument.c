// RUN: %clang -g -O1 -Xclang -fexperimental-instrument %s 2>&1 | FileCheck %s


#include <stdio.h>

extern int fnExt();

struct Coordinates {
	int x, y, z;
};

void insertCoordinates(struct Coordinates coord) {
	printf("Insert your coordinates:\n");
	printf("x = "); scanf("%d", &coord.x);
	printf("y = "); scanf("%d", &coord.y);
	printf("z = "); scanf("%d", &coord.z);
}

void printCoordinates(struct Coordinates coord) {
	printf("Your coordinates are: (%d, %d, %d)", coord.x, coord.y, coord.z);
}

int main(int argc, char** argv) {
	struct Coordinates coords;
	
	insertCoordinates(coords);
	printCoordinates(coords);
	
	return 0;
}
