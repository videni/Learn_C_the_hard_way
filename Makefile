# Check here for how following rules work
# https://opensource.com/article/18/8/what-how-makefile

CFLAGS=-Wall -g
.PHONY = all clean

CC = cc


SRCS := $(wildcard *.c)
BINS := $(SRCS:%.c=%)

all: ${BINS}

%: %.o
	@echo "Checking.."
	${CC} ${CFLAGS} $< -o $@

%.o: %.c
	@echo "Creating object.."
	${CC} -c $<

clean:
	@echo "Cleaning up..."
	rm -rvf *.o ${BINS}