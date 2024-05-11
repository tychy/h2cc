CFLAGS=-std=c11 -g -static

h2cc: h2cc.c

test: h2cc
	./test.sh

clean:
	rm -f h2cc *.o *~ tmp*

.PHONY: test clean
