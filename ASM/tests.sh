#!/usr/bin/env bash

./Colleen > res && diff -s res Colleen.s;rm res
rm Grace_kid.s
./Grace && diff -s Grace_kid.s Grace.s
mkdir test 2>/dev/null
make clean
cp Sully test/ && cd test && ./Sully
diff -s Sully_0.s Sully_1.s
diff -s Sully_0.s Sully_2.s
diff -s Sully_0.s Sully_3.s
diff -s Sully_0.s Sully_4.s
diff -s Sully_0.s Sully_5.s
diff -s Sully_1.s Sully_2.s
diff -s Sully_1.s Sully_3.s
diff -s Sully_1.s Sully_4.s
diff -s Sully_1.s Sully_5.s
diff -s Sully_2.s Sully_3.s
diff -s Sully_2.s Sully_4.s
diff -s Sully_2.s Sully_5.s
diff -s Sully_3.s Sully_4.s
diff -s Sully_3.s Sully_5.s
cd ..
rm -rf test
