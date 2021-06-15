#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <errno.h>

#define FALSE 0
#define TRUE 1

int
main (void){

  int i, pid; 
  char *token, command[2000], *arguments[10];

  while(TRUE){
    // clear command buffer and read commmand  
    memset(command, 0, sizeof(command));
    if(fgets(command, sizeof(command), stdin) == NULL){
      fprintf(stderr, "wrong command\n");
      exit(-1);
    }

    // remove '\n'
    command[strlen(command)-1] = 0;

    // store command in argv[0]. If no command, exit -1
    token = strtok(command," ");
    if (token == NULL) {exit(-1);}
    if (!strcmp(token, "exit")){
      exit(0);
    }
    arguments[0] = token;


    // fork and get pid
    pid = fork();
  
    if (pid != 0){    // parents process (shell)
      wait(NULL);
    } else {          // child process that actually run the command
      for (i = 1; i < 10; i++){
        token = strtok(NULL, " ");
        if (token == NULL) break;
        arguments[i] = token;
      }
      arguments[i] = NULL;
      
      // run the command
      execvp(arguments[0], arguments);
      fprintf(stderr, "fail to execute %s, error = %d\n", arguments[0], errno);
      exit(-1);
    }
  }
  return 0;
}
