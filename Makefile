CC = gcc 
CFLAGS = -Wall

all: loops loopd recursived recursives

loops: libclassloops.a

loopd: libclassloops.so

recursives: libclassrec.a

recursived: libclassrec.so

mains: main.o libclassrec.a
	$(CC) $(CFLAGS) main.o libclassrec.a -lm -o mains

clean: 
	rm -f *.o 

libclassloops.a: advancedClassificationLoop.o basicClassification.o
	ar rcs libclassloops.a advancedClassificationLoop.o basicClassification.o
	ranlib libclassloops.a

libclassloops.so: advancedClassificationLoop.o basicClassification.o
	$(CC) $(CFLAGS) -c -fPIC advancedClassificationLoop.c basicClassification.c
	$(CC) -shared advancedClassificationLoop.o basicClassification.o -o libclassloops.so

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	ar rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o
	ranlib libclassrec.a

libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) $(CFLAGS) -c -fPIC advancedClassificationRecursion.c basicClassification.c
	$(CC) -shared advancedClassificationRecursion.o basicClassification.o -o libclassrec.so

advancedClassificationLoop.o:  advancedClassificationLoop.c NumClass.h
	$(CC) $(CFLAGS) -c advancedClassificationLoop.c

advancedClassificationRecursion.o:  advancedClassificationRecursion.c NumClass.h
	$(CC) $(CFLAGS) -c advancedClassificationRecursion.c

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(CFLAGS) -c basicClassification.c 
	
main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c NumClass.h 

maindloop: main.o libclassloops.so
	$(CC) $(CFLAGS) main.o ./libclassloops.so -lm -o maindloop
 
maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) main.o ./libclassrec.so -lm -o maindrec












 	# gcc -c -Wall advancedClassificationLoop.c basicClassification.c