#   file: Makefile
# author: Sam Toney
#   date: 2/18/2025
#  brief: Makefile for employee assignment.

# compiler and flags
CC = g++
CFLAGS = -c -Wall -Wextra

# defining target
TARGET = employee

# defining object files
OBJECTS = main.o Employee.o Officer.o Supervisor.o

# default to target
all: $(TARGET)

# link object files for executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# compile main file
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp

# compile employee files
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

# compile officer files
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

# compile supervisor files
Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp

# clean up excess files
clean:
	rm -f *.o *~ $(TARGET)

