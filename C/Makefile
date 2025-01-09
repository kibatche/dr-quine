CLANG = gcc
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
		${CLANG} ${CCFLAGS} ${OBJCOL} -o ${NAMECOL}
${NAMEGRA}: ${OBJGRA}
		${CLANG} ${CCFLAGS} ${OBJGRA} -o ${NAMEGRA}
${NAMESUL}: ${OBJSUL}
		${CLANG} ${CCFLAGS} ${OBJSUL} -o ${NAMESUL}

%.o: %.cpp
		${CLANG} ${CCFLAGS} -c $< -o $@
clean:
		${RM} ${OBJSUL} ${OBJCOL} ${OBJGRA}

fclean: clean
		${RM}  ${NAMECOL} ${NAMEGRA} ${NAMESUL}

re: fclean all
