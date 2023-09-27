#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <stdlib.h>
#include <time.h>
#include <semaphore.h>
#include "heaptree.h"


pid_t* pid;
int N, i;
int* p;
sem_t mutex, calculation_done;

//Μεταβλητές που θα χρησιμεύσουν στις ζητούμενες μετρήσεις
clock_t start, mend;
double time_taken, timetaken2;

int main() {

    //Φτιάχνω τον πίνακα, στον οποίο θα αποθηκευτούν οι διεργασίες
    printf("How many proccesses do you want?\n");
    scanf("%d", &N);
    pid = (pid_t*)malloc(N*sizeof(pid_t));

    //Φτιάχνω το (min) Heap Tree 
    Heap** root;
    key_t shmkey; //shared memory key
    int shmid; //shared memory id
    shmkey = ftok("~/Desktop/Marios - CEID/Λειτουργικά Συστήματα/Project2/MerosA_QuestionA/(A)", 1);
    shmid = shmget(shmkey, sizeof(Heap**), 0644 | IPC_CREAT);
    root = (Heap**)shmat(shmid, NULL, 0);

    *root = sampleTree(N);

    // Φτιάχνω την κοινά διαμοιραζόμενη μεταβλητή p
    key_t shmkeyp; //shared memory key
    int shmidp; //shared memory id

    shmkeyp = ftok("~/Desktop/Marios - CEID/Λειτουργικά Συστήματα/Project2/MerosA_QuestionA/(A)", 2);
    shmidp = shmget(shmkeyp, sizeof(int*), 0644 | IPC_CREAT);
    p = (int*)shmat(shmid, NULL, 0);
    *p = 0;

    // Αρχικοποίηση των σημαφόρων
    sem_init(&mutex, 0, 1);
    sem_init(&calculation_done, 0, 0);

    start = clock(); //Ξεκινάμε τον time

    //Δημιουργούμε τις Ν διεργασίες
    for (i=0; i<N; i++) {
        pid[i] = fork();
        if (pid==0) break;
    }

    //Διεργασίες-Παιδιά
    if (pid[i]==0) {
        sem_wait(&mutex);
        *p += findAndget(*root, i);
        sem_post(&mutex);
        //Η τελευταία διεργασία ενημερώνει την διεργασία-πατέρα ότι υλοποιήθηκε η πρόσθεση
        if ( (pid[i]==0) & (getpid()==(getppid()+N)) ) sem_post(&calculation_done);
    }

    //Διεργασία-Πατέρας
    else {
        sem_wait(&calculation_done); // Περιμένει για την τελευταία διεργασία-παιδί να υλοποιήσει την πρόσθεση
        mend = clock();
        time_taken = ((double) (mend-start)) / CLOCKS_PER_SEC;
        printf("\nΤο αποτέλεσμα είναι: %d", *p);
        printf("\nΟ υπολογισμός χρειάστηκε %lf δευτερόλεπτα\n", time_taken);
    }

    return 0;
}