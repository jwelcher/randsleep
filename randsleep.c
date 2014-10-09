/* $Id$
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main (int argc, char *argv[])
{
    int error;
    unsigned int maxsleepsecs;
    unsigned int sleepsecs;
    
    /* Input check to make sure we are dealing with an integer */
    if ( argc != 2 ) {
        printf( "usage: %s maxsleepsecs\n", argv[0] );
        exit(1);
    }

    /* input check */
    if ( (maxsleepsecs = atoi(argv[1])) ) {
        if ( maxsleepsecs > 315532800 ) {
            printf("I refuse to sleep for a year.\n");
            exit(2);
        }
    } else {
        printf("Error. Not a number.\n");
        exit(3);
    }

    /* Initialize random number generator */

    /* this ties random number to time... for that second all randoms numbers the same */
    /* srandom(time(&t)); */

    /* initializes a state array, using the random(4) random number device which 
       returns good random numbers, suitable for cryptographic use. */
    srandomdev();

    /* BSD random() returned ranges from 0 to 2147483647 */
    /* picking a random integer up to maximum */
    sleepsecs = ( random() % maxsleepsecs ) + 1;
    /* sleepsecs = ( random() ); */
    /*printf("Sleep for %d secs\n", sleepsecs);*/
    sleep(sleepsecs);
}


/* Local Variables:      */
/* mode: c               */
/* indent-tabs-mode: nil */
/* c-basic-style: bsd    */
/* c-basic-offset: 4     */
/* fill-column: 78       */
/* comment-column: 0     */
/* End:                  */
