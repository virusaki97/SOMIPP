#! /bin/bash
filename=".confidential.txt"
raspuns2=1
operatie2="+"
export operatie2
export raspuns2
export a

while read a
do
if [[ $a == "QUIT" ]]
then exit 0
fi
/bin/bash ./Handler.sh
operatie2=$(head -n 1 temporary.tmp)
raspuns2=$(tail -n 1 temporary.tmp)

done < $filename
rm temporary.tmp
exit 0