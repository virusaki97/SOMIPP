#!/bin/bash
d=$(date '+%d.%m.%y_%H:%M:%S')
mkdir /home/test 2> /dev/null && echo "catalog test was created successfully" >> ~/raport.tmp && touch ~/test/$d
ping -c 1 traiasca_moldova.md 2> /dev/null || echo "ERROR: Host Unreachable" >> ~/raport.tmp
exit 0;