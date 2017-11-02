/******************************************************************************
* FILE: hello.c
* DESCRIPTION:
*   A "hello world" Pthreads program.  Demonstrates thread creation and
*   termination.
* AUTHOR: Blaise Barney
* LAST REVISED: 08/09/11
******************************************************************************/
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/time.h>
#define NUM_THREADS	10

#define NN 10
#define LL 1024 * 1024 * 2
char buf[LL + 1];

static long long ccc() {
    struct timeval start, end;
    gettimeofday( &start, NULL );
    return start.tv_sec * (long long) 1000000 + start.tv_usec;
}

void *PrintHello(void *threadid)
{
   long tid;
   tid = (long)threadid;
   printf("Hello World! It's me, thread #%ld!\n", tid);

    char dir[55];
    sprintf(dir, "mkdir -p tmp/%d", tid);
    system(dir);

    printf("%d started\n", tid);

    for (int i = 0; i < 1000; i ++) {
        sprintf(dir, "tmp/%d/%d", tid, i);
        long long sss = ccc();
        //FILE *fp = fopen(dir, "w");
        int fd = open(dir, O_DIRECT, O_WRONLY);
        printf("tid: %d, time: %lld\n", tid, ccc() - sss);
        //fprintf(fp, "%s", buf);
	write(fd, buf, LL);
        //fclose(fp);
        close(fd);
        printf("tid: %d, finished %d\n", tid, i);
    }

   pthread_exit(NULL);
}

int main(int argc, char *argv[])
{

    for (int i = 0; i < LL; i ++ ) buf[i] = 'a';
    buf[LL] = 0;
   pthread_t threads[NUM_THREADS];
   int rc;
   long t;
   for(t=0;t<NUM_THREADS;t++){
     printf("In main: creating thread %ld\n", t);
     rc = pthread_create(&threads[t], NULL, PrintHello, (void *)t);
     if (rc){
       printf("ERROR; return code from pthread_create() is %d\n", rc);
       exit(-1);
       }
     }

    for (int i = 0; i < NN; i ++) {
        void *retval;
        pthread_join(threads[i], &retval);
    }
   /* Last thing that main() should do */
   pthread_exit(NULL);
}

