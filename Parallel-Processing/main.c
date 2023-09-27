#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#define N 5

int main(){

  	pid_t pid[N];
	int SA[N+1];
	int i;
	int child_status;
	boolean choosing[N];
	int number[N];

	for(i=1;i<=N;i++){
	SA[i] = 0;
	}

	for(i=1;i<=N;i++){

	pid[i] = fork();

	if (pid[i] == 0){

	choosing[i] = TRUE;
	number[i] = MAX{number[1],number[2],number[3],number[4],number[5]} +1;
	choosing[i] = FALSE;


}
}

for(i=1;i<=N;i++){

pid_t wpid = waitpid(pid[i],&child_status,0);

for(int j=1;j<=N;j++){
SA[j] = SA[j] + i;

}
}
return(0);
}
