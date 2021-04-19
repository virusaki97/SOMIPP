#!/bin/bash
fisier1='fisier1.txt'
ps -u daniel | awk '{ print $1, $4;}' >$fisier1     #afisam prima si a patra coloana din tot tabelul, ce este PID si command
cat $fisier1
sed -i 1d $fisier1
echo "Numarul de procese initializate de utilizatorul user este de: "
wc -l $fisier1 | awk '{print $1}'   #wc -l va afisa nr de linii si denumirea fisierului, punem awk ca sa ne afiseze doar nr de linii
rm $fisier1
exit 0;