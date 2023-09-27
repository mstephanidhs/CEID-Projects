#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/wait.h>
#include <time.h>
#define true 1
#define false 0
#define N   3

// Αρχικοποίηση των διαμοιραζόμενων μεταβλητών του προγράμματος
int free_s = N;
bool free_a[N];

sem_t Sc; // Σημαφόρος για τον έλεγχο στις διαδικασίες Enter_p() και Leave_p(int free_p)
sem_t Sm; // Σημαφόρος που μπλοκάρει/ξεμπλοκάρει μια διαδικασία ανάλογα με το αν υπάρχουν θέσεις ή όχι
sem_t S; // Σημαφόρος που συμβάλλει στην αποφυγή αδιεξόφων

void Enter_p();
void Leave_p(int free_p); 
void car();

int main() {

    // Αρχικοποίηση Σημαφόρων
    sem_init(&Sc, 0, 1);
    sem_init(&Sm, 0, 0);
    sem_init(&S, 0, N);
    srand(time(0));
    int p, i, wpid;
    int status = 0;

    // Αρχικοποίηση του boolean πίνακα
    for (int i=0; i<N; i++) {
        
        free_a[i] = true;
    }

    printf("Enter the number of processes: ");
    scanf("%d", &p);

    pid_t pid[p];

    for (i=0; i<p; i++) {

        pid[i] = fork();
        if (pid[i]==0) car(); 
        else break;
    }

    while ((wpid = wait(&status)) > 0); // Η διεργασία-πατέρας περιμένει για τις διεργασίες-παιδιά

    return 0;
}

void car() {

    int pslot;

    sem_wait(&S);
    Enter_p();
    printf("Enter your parking number %d process in order to leave the Parking: ", getpid());
    scanf("%d", &pslot);
    Leave_p(pslot);
    sem_post(&S);
}

// "Πρόχειρη" συνάρτηση που δίνει μια θέση του parking που είναι ελεύθερη
int ChooseSlot() {

    int slot;
    int count = 0;

    while(count==0) {

        slot = rand()%N+1;
        if (free_a[slot]==true) count=1;
    }
 
    return slot;
}

// Υλοποιείται η συνάρτηση Enter_p() του δοθέντος ψευδοκώδικα με χρήση μιας ενιαίας κρίσιμης περιοχής υπό συνθήκη
void Enter_p() {

    int free_p;
    printf("Welcome to our Parking %d process!\n", getpid());

    sem_wait(&Sc);

    if (free_s>0) free_s = free_s-1;
    else sem_wait(&Sm);

    free_p = ChooseSlot();
    free_a[free_p] = false;
    printf("The parking ticket of %d process is %d\n", getpid(), free_p);

    sem_post(&Sc);
}

// Υλοποιείται η συνάρτηση Leave_p(int free_p) του δοθέντος ψευδοκώδικα με χρήση μιας ενιαίας κρίσιμης περιοχής υπό συνθήκη
void Leave_p(int free_p) {

    sem_wait(&Sc);

    free_s = free_s+1;
    free_a[free_p] = true;
    sem_post(&Sm);

    sem_post(&Sc);

    printf("Thank you for coming %d!\n", getpid());
}


