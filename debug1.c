#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct L *Lp;
struct L {
	Lp next;
	char *name;
};

Lp newL(char *str) {
	Lp n = (Lp)calloc(1,sizeof(struct L));
	n->name = strdup(str);
	return n;
}

Lp addfront(Lp list,Lp n) {
	n->next=list;
	return n;
}

int main (int argc, char *argv[]) {
	FILE *in;
	char str[128];
	Lp list = NULL;
	Lp p = NULL;
	
	in = fopen("debug1.txt","r");

	if (in) {
		while (fgets(str,128,in)) 
			list = addfront(list,newL(str));
	}
	for (p=list;p != NULL;p=p->next)
		printf("%s\n",p->name);

	p = list;
	while (p != NULL)
	{
		Lp temp = p;
		p = p->next;
		free(temp);
	}
}

