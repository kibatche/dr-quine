#!/usr/bin/env bash

./Colleen > res && diff -s res Colleen.c;rm res
rm Grace_kid.c && ./Grace && diff -s Grace_kid.c Grace.c
mkdir test 2>/dev/null
cp Sully test/ && cd test && ./Sully
diff -s Sully_0.c Sully_1.c
diff -s Sully_0.c Sully_2.c
diff -s Sully_0.c Sully_3.c
diff -s Sully_0.c Sully_4.c
diff -s Sully_0.c Sully_5.c
diff -s Sully_1.c Sully_2.c
diff -s Sully_1.c Sully_3.c
diff -s Sully_1.c Sully_4.c
diff -s Sully_1.c Sully_5.c
diff -s Sully_2.c Sully_3.c
diff -s Sully_2.c Sully_4.c
diff -s Sully_2.c Sully_5.c
diff -s Sully_3.c Sully_4.c
diff -s Sully_3.c Sully_5.c
