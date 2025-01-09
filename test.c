#include <fcntl.h>

int main()
{
    char *s = "test";
    dprintf(1,"%1$c%2$c%1$c%2$c%3$s\n",'a','b',s);
}