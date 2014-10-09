###
## Basic Makefile for randsleep
###

CWD=`pwd`
CC=gcc
RM=/bin/rm

all: randsleep

randsleep:
	$(CC) -o randsleep randsleep.c

clean:	
	$(RM) -rf *.o randsleep
