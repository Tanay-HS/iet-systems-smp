#include <stdio.h>
#include <unistd.h>

int main() {
    printf("My PID is: %d\n", getpid());
    
    printf("Go check my memory map now! Sleeping...\n");
    sleep(300); 
    
    return 0;
}
