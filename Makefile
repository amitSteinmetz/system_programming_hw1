CC = gcc 
CFLAGS = -Wall -g 

all: mains maindloop maindrec libclassloops.a

loops: libclassloops.a

loopd: libclassloops.so

recursives: libclassrec.a

recursived: libclassrec.so

mains: main.o libclassrec.a
	$(CC) $(CFLAGS) main.o libclassrec.a -lm -o mains

maindloop: main.o libclassloops.so
	$(CC) $(CFLAGS) main.o ./libclassloops.so -lm -o maindloop

maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) main.o ./libclassrec.so -lm -o maindrec

clean: 
	rm -f *.o *.a *.so mains mandreq maindloop

libclassloops.a: advancedClassificationLoop.o basicClassification.o
	ar rcs libclassloops.a advancedClassificationLoop.o basicClassification.o

libclassloops.so: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared advancedClassificationLoop.o basicClassification.o -o libclassloops.so

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	ar rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o

libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared advancedClassificationRecursion.o basicClassification.o -o libclassrec.so

advancedClassificationLoop.o:  advancedClassificationLoop.c NumClass.h
	$(CC) $(CFLAGS) -c -fPIC advancedClassificationLoop.c

advancedClassificationRecursion.o:  advancedClassificationRecursion.c NumClass.h
	$(CC) $(CFLAGS) -c -fPIC advancedClassificationRecursion.c

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(CFLAGS) -c -fPIC basicClassification.c
	
main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c NumClass.h