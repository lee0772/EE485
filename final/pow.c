#include <stdio.h>

static int power (int iBase, int iExp){
	int iPower = 1, iIndex;
	for (iIndex = 1; iIndex <= iExp; iIndex++)
		iPower *= iBase;
	return iPower;
}

int main(void){
	int iBase, iExp, iPower;
	printf("Base: ");
	scanf("%d", &iBase);
	printf("Power: ");
	scanf("%d", &iExp);

	iPower = power(iBase, iExp);
	printf("%d to the %d power is %d.\n", iBase, iExp, iPower);
	return 0;
}

