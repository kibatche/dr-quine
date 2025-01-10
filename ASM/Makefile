clang = clang
NASM = nasm
RM = rm -rf
CCFLAGS = -nostartfiles -no-pie
NASMFLAGS = -f elf64
SRCCOL = Colleen.s
SRCGRA = Grace.s
SRCSUL = Sully.s
OBJCOL = ${SRCCOL:.s=.o}
OBJGRA = ${SRCGRA:.s=.o}
OBJSUL = ${SRCSUL:.s=.o}
NAMECOL = Colleen
NAMEGRA = Grace
NAMESUL = Sully

all: ${NAMECOL} ${NAMEGRA} ${NAMESUL}

${NAMECOL}: ${OBJCOL} ${SRCCOL}
		${clang} ${CCFLAGS} ${OBJCOL} -o ${NAMECOL}
${NAMEGRA}: ${OBJGRA}
		${clang} ${CCFLAGS} ${OBJGRA} -o ${NAMEGRA}
${NAMESUL}: ${OBJSUL}
		${clang} ${CCFLAGS} ${OBJSUL} -o ${NAMESUL}

%.o: %.s
		${NASM} ${NASMFLAGS} $< -o $@
clean:
		${RM} ${OBJSUL} ${OBJCOL} ${OBJGRA} Sully_*.o Grace_kid.*

fclean: clean
		${RM}  ${NAMECOL} ${NAMEGRA} ${NAMESUL} Sully_* Grace_kid.*

re: fclean all
