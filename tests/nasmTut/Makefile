SRC  	=  *.nasm
OBJ  	=  *.o

EXE  	=  nasmTut
ASEM 	=  nasm
LDR		=  ld

FLAGS	=  -felf64

All: Build Link Run

Build:
	nasm ${FLAGS} ${SRC}

Link:
	ld ${OBJ} -o ${EXE}

Run:
	./${EXE}

