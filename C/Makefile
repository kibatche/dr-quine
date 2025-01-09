GCC = clang
RM = rm -f
CCFLAGS = -Wall -Wextra -Werror
SRCCOL = Colleen.c
SRCGRA = Grace.c
SRCSUL = Sully.c
OBJCOL = ${SRCCOL:.c=.o}
OBJGRA = ${SRCGRA:.c=.o}
OBJSUL = ${SRCSUL:.c=.o}
NAMECOL = Colleen
NAMEGRA = Grace
NAMESUL = Sully

all: ${NAMECOL} ${NAMEGRA} ${NAMESUL}

${NAMECOL}: ${OBJCOL}
		${GCC} ${CCFLAGS} ${OBJCOL} -o ${NAMECOL}
${NAMEGRA}: ${OBJGRA}
		${GCC} ${CCFLAGS} ${OBJGRA} -o ${NAMEGRA}
${NAMESUL}: ${OBJSUL}
		${GCC} ${CCFLAGS} ${OBJSUL} -o ${NAMESUL}

%.o: %.cpp
		${GCC} ${CCFLAGS} -c $< -o $@
clean:
		${RM} ${OBJSUL} ${OBJCOL} ${OBJGRA}

fclean: clean
		${RM}  ${NAMECOL} ${NAMEGRA} ${NAMESUL} Sully_*

re: fclean all
