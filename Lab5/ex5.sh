#!/bin/bash

status=""

for pid in $(ps -A -o pid)

do

file="/proc/"$pid"/status"

file1="/proc/"$pid"/sched"

ppid=$(grep -E -h -s -i "ppid:\s(.+)" $file | grep -o "[0-9]\+")

sleepavg=$(grep -E -h -s -i "avg_atom(.+)" $file1 | grep -o "[0-9.]\+")

if [[ -z $sleepavg ]]

then sleepavg=0

fi

if [[ $ppid != "" ]]

then status=$status"ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Sleeping_Time="$sleepavg$'\n'

fi

done

echo "$status" | sort -t " " -k2 > klab55.tmp

exit 0

-----------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

status=""

for pid in $(ps -A -o pid)

do

file="/proc/"$pid"/status"

file1="/proc/"$pid"/sched"

ppid=$(grep -E -h -s -i "ppid:\s(.+)" $file | grep -o "[0-9]\+")

exec_run=$(grep -E -h -s -i "se.sum_exec_runtime" $file1 | awk '{printf($3)}')
nr_switches=$(grep -E -h -s -i "nr_switches" $file1 | awk '{printf($3)}')
impartire=$(bc<<<"scale=6; $exec_run / $nr_switches")

if [[ $ppid != "" ]]

then
status=$status"ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Sleeping_Time="$impartire$'\n'
#if[[$impartire -g 0]] then echo "Here we go bitch !" fi
fi

done

echo "$status" | sort -t " " -k2 > fisiertest.tmp

exit 0

-------------------------------------------------------------------------------------------------------------

