/* test.c */

#include <stdio.h>

static int first = 0 ;
int second = -1 ;
int third ;

int main() {
	int local ;
	local = 0;
	first = local ;
	printf ("value: %d\n", local) ;

}
