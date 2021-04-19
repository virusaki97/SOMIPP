#!/bin/bash

ppid=0

sleepavg=0

count=0

b=""

while read a

do

if [[ -n $a ]]

then

newppid=$(echo $a | grep -E -h -s -i -o "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")

newsleepavg=$(echo $a | grep -E -h -s -i -o "Average_Sleeping_Time=[0-9.]+" | grep -o "[0-9.]\+" | awk '{printf("%s",$1)}')

if [[ $ppid == $newppid ]]

then sleepavg=$(echo "$sleepavg+$newsleepavg" | bc -l -q)	# bc -l - defineste o biblioteca standarda de matematica; -q quit Do not print the normal GNU bc welcome.

count=$(echo "$count+1" | bc -l -q)

else

sleepavg=$(echo "$sleepavg/$count" | bc -l -q)

if [[ -n $b ]]

then

b=$b"Average_Sleeping_Children_of_ParentID="$ppid" is "$sleepavg$'\n'

fi

sleepavg=$newsleepavg

ppid=$newppid

count=1

fi

b=$b$a$'\n'

fi

done < klab55.tmp

sleepavg=$(echo "$sleepavg/$count" | bc -l -q)

if [[ -n $b ]]

then

b=$b"Average_Sleeping_Children_of_ParentID="$ppid" is "$sleepavg$'\n'

fi

echo "$b" > klab56.tmp
--------------------------beta version------------------------------------------------------------------------
#!/bin/bash
ppid=0
sleepavg=0
b=""

while read a

do

if [[ -n $a ]]

then

newppid=$(echo $a | grep -E -h -s -i -o "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")

currentpid=$(echo $a | grep -E -h -s -i -o "ProcessID=[0-9]+" | grep -o "[0-9]\+") 
c=$currentpid
echo "$c" >klab56.tmp
currentpid=$(sed -n '1p' klab56.tmp)
rm klab56.tmp

newsleepavg=$(echo $a | grep -E -h -s -i -o "Average_Sleeping_Time=[0-9]\+"\."[0-9]\+" | grep -o "[0-9]\+"\."[0-9]"\+)

voluntary=$(grep -E -h -s -i "voluntary_ctxt_switches" /proc/$currentpid/status | head -n 1 | awk '{printf($2)}')

nonvoluntary=$(grep -E -h -s -i "nonvoluntary_ctxt_switches" /proc/$currentpid/status | head -n 1 | awk '{printf($2)}')


if [[ $ppid == $newppid ]]

then sleepavg=$(( sleepavg + voluntary + nonvoluntary )) 

else
b=$b"Sum_switches_of_parrentID="$ppid" is "$sleepavg$'\n'
sleepavg=0;
sleepavg=$(( sleepavg + voluntary + nonvoluntary ))

fi
ppid=$newppid

b=$b$a$'\n'

fi


done < fisiertest.tmp

echo "$b" > fisiertest.tmp

--------------------------------------------------------------------------------------------------------------
voluntary=$(grep -E -h -s -i "voluntary_ctxt_switches" /proc/10914/status | awk '{printf($2)}')
nonvoluntary=$(grep -E -h -s -i "nonvoluntary_ctxt_switches" /proc/10914/status | awk '{printf($2)}')
a=$(grep -E -h -s -i "voluntary_ctxt_switches" /proc/17249/status | awk '{printf($2)}' | echo "${a::-1}" )      #echo "${a::-1}" - afiseaza a fara ultimul sau element