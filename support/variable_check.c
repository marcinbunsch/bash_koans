#include <stdio.h>
#include <stdlib.h>

int main(void) {
  char *myenvvar=getenv("MY_EXPORTED_VARIABLE");
  if (myenvvar) {
    printf("%s",myenvvar);
  }
}
