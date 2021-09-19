CC 		= g++
LIBS	= -lncurses -ltinfo
SRC		= *.cpp
EXE		= 5dlife
CFLAGS	= -O2
ALL: Build Run

Build:
	$(CC) $(SRC) $(LIBS) $(CFLAGS) -o $(EXE)

Clean:
	rm -rf *.cpp
	rm $(EXE)

Run:
	./$(EXE)
