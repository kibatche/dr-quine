/*
    comment1
*/
#include<stdio.h>
void dummy(){return;}int main(){
/*
    comment2
*/
char *c="/*%c    comment1%c*/%c#include<stdio.h>%cvoid dummy(){return;}int main(){%c/*%c    comment2%c*/%cchar *c=%c%s%c;dummy();printf(c,10,10,10,10,10,10,10,10,34,c,34);}";dummy();printf(c,10,10,10,10,10,10,10,10,34,c,34);}