#!/bin/bash
d=$(date '+%d.%m.%y_%H:%M:%S')
mkdir /home/test 2> /dev/null && echo "catalog test was created successfully" >> ~/raport.tmp && touch ~/test/$d
ping -c 1 traiasca_moldova.md 2> /dev/null || echo "ERROR: Host Unreachable" >> ~/raport.tmp
row_num=$(wc -l ~/raport.tmp | awk '{ print $1}')
sleep 1s
d=$(date '+%d.%m.%y_%H:%M:%S')
mkdir /home/test 2> /dev/null && echo "catalog test was created successfully" >> ~/raport.tmp && touch ~/test/$d
ping -c 1 traiasca_moldova.md 2> /dev/null || echo "ERROR: Host Unreachable" >> ~/raport.tmp
tail -n $row_num ~/raport.tmp
exit 0;
