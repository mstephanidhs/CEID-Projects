#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <unistd.h>
#include <sys/wait.h>

sem_t S12, S34;

int main() {

    // Αρχικοποίηση των 2 σημαφόρων που χρησιμοποιήθηκαν
    sem_init(&S12, 0, -1);
    sem_init(&S34, 0, -1);
    int child_status;

    pid_t ProcessP;

    ProcessP = fork(); // Θεωρούμε πως η διεργασία-παιδί ειναι η P και η διεργασία-γονέας είναι η Q

    // Διεργασία P
    if (ProcessP==0) {

        system("echo This is SC1");
        sem_post(&S12);
        system("echo This is SC3");
        sem_post(&S34);
        sem_wait(&S34); // Πρέπει πρώτα να εκτελεστεί η SC4 προκειμένουμε να προχωρήσουμε στην SC5
        system("echo This is SC5");
        exit(0);

    }

    system("echo This is SC2");
    sem_post(&S12);
    sem_wait(&S12); // Πρέπει πρώτα να εκτελεστεί η SC1 προκειμένουμε να προχωρήσουμε στην SC4
    system("echo This is SC4");
    sem_post(&S34);

    pid_t wpid = waitpid(ProcessP, &child_status, 0); // Τερματίζει η διεργασία-γονέας αφού έχει τερματιστεί η διεργασία-παιδί

    
    if (WIFEXITED(child_status)) 															 		/* WIFEXITED returns true if child exited normally */
	{
		printf("Child%d terminated with return value %d\n", wpid, WEXITSTATUS(child_status));		/* prints terminated child's id and its exit status */
	}
	else
	{
		printf("Child%d terminated abnormally\n", wpid);
	}

    return 0;
}