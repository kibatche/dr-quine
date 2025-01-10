CC = clang
RM = rm -rf
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
		${CC} ${CCFLAGS} ${OBJCOL} -o ${NAMECOL}
${NAMEGRA}: ${OBJGRA}
		${CC} ${CCFLAGS} ${OBJGRA} -o ${NAMEGRA}
${NAMESUL}: ${OBJSUL}
		${CC} ${CCFLAGS} ${OBJSUL} -o ${NAMESUL}

%.o: %.c
		${CC} ${CCFLAGS} -c $< -o $@
clean:
		${RM} ${OBJSUL} ${OBJCOL} ${OBJGRA}

fclean: clean
		${RM}  ${NAMECOL} ${NAMEGRA} ${NAMESUL} Sully_* Grace_kid.* test

re: fclean all
