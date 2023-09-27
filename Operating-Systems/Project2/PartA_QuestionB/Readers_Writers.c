#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <stdbool.h>
#define N   2

int rc = 0; // σημαφόρος για ανάγνωση 
int wc = 0; // σημαφόρος για εγγραφή
sem_t cSem; // σημαφόρος για αποκλειστική πρόσβαση στις rc, wc
sem_t DataBase; // σημαφόρος για αποκλειστική πρόσβαση στη "βάση"
bool priority;
int data = 1; // Το δεδομένο που θα προσπελαύνουν εγγραφείς και αναγνώστες


void *reader(void *readerID);
void *writer(void *writerID);

int main() {

    int a[N] = {1,2}; // Χρησιμοποιείται για την αρίθμηση των αναγνώσεων/εγγραφών

    pthread_t read[N], write[N];
    sem_init(&cSem,0,1);   
    sem_init(&DataBase,0,1); 

    for (int i=0; i<N; i++) {
        pthread_create(&read[i], NULL, (void *)reader, (void *)&a[i]);
        pthread_create(&write[i], NULL, (void *)writer, (void *)&a[i]);
    }

    for (int i=0; i<N; i++) {
        pthread_join(read[i], NULL);
        pthread_join(write[i], NULL);
    }

    sem_destroy(&cSem);
    sem_destroy(&DataBase);

    return 0;
}

void *reader(void *readerID) {

    sem_wait(&cSem);
    rc = rc+1;
    sem_post(&cSem);

    sem_wait(&DataBase);

    if (priority==0) {

        printf("Reader %d: read data as %d\n", *((int *)readerID), data);
        sem_wait(&cSem);
        rc = rc-1;
        if (wc!=0) priority = 1;
        sem_post(&cSem);
        
    }

    else {

        sem_wait(&cSem);
        if (wc==0) priority = 0;
        rc = rc-1;
        sem_post(&cSem);
    }

    sem_post(&DataBase);

}

void *writer(void *writerID) {
    
    sem_wait(&cSem);
    wc = wc+1;
    sem_post(&cSem);

    sem_wait(&DataBase);

    if (priority==1) {
        
        data = data*2;
        printf("Writer %d modified data to %d\n", (*((int *)writerID)), data);
        sem_wait(&cSem);
        wc = wc-1;
        if(rc!=0) priority = 0;
        sem_post(&cSem);
    }

    else {

        sem_wait(&cSem);
        if (rc==0) priority = 1;
        wc = wc-1;
        sem_post(&cSem);
    }

    sem_post(&DataBase);
}

