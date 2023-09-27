#include <stdio.h>
#include <pthread.h>
#include <stdatomic.h>
#define N   2
#define MAX 500

int flag[N], turn;
atomic_int X=0;

void lock_init();
void lock(int process);
void unlock(int process);
void* child_process_i(void *p);

int main() {

    pthread_t p1, p2;
    lock_init();
    static int id0 = 0;
    static int id1 = 1;
    
    //Δημιουργία 2 threads που τρέχουν την συνάρτηση child_process_i
    pthread_create(&p1, NULL, child_process_i, &id0);
    pthread_create(&p2, NULL, child_process_i, &id1);

    //Περιμένω να τελειώσουν και τα 2 threads
    pthread_join(p1, NULL);
    pthread_join(p2, NULL);

    printf("Actual Count: %d | Expected Count: %d\n", X, MAX*2); 

    return 0;
}


//Η ζητούμενη συνάρτηση 
void* child_process_i(void *p) {

    int i, tmp=0;
    int process = *(int *)p;

    lock(process);

    //Κρίσιμη περιοχή
    for (i=0; i<MAX; i++) {
        tmp = X;
        tmp = tmp+1;
        X = tmp;
    } 

    unlock(process);

}

void lock_init() {

    //Αρχικοποίηση των απαραίτητων στοιχείων για τη λειτουργία του αλγορίθμου Peterson
    flag[0] = flag[1] = 0;
    turn = 0;
}

//Εκτελείται, ώστε να εισέλθει μόνο μια διεργασία στην κρίσιμη περιοχή
void lock(int process) {

    flag[process] = 1;
    turn = 1-process;

    while (flag[1-process]==1 && turn==1-process); 
}

//Εκτελείται, αφού εξέλθει από την κρίσιμη περιοχή 
void unlock(int process) {
    
    flag[process] = 0;
}