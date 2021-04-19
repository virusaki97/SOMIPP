#!/bin/bash

ps -A -o pid | awk '{file1="/proc/"$1"/statm"; getline f<file1; close (file1); split(f, a); print $1, ":", a[2]-a[3]}' | sort -r -n -t ":" -k2 > klab54.tmp

exit 0

$1 in awk = first column
file1="/proc/"$1"/statm" in variabila file1 punem prima coloana din toate subdirectoriile statm din directoria /proc
getline reads the record of the file into the variable
split converts a sttring to array in a[1],a[2],a[3]
-k2: sorteaza dupa al doilea element din sort -t ":" -t: field separator