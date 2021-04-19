#!/bin/bash
nice -n 16 ./ex4_1.sh&
sleep 1
PID1=$(ps -aux | grep -E -h -s -i  "/bin/bash ./ex4_1.sh" | head -n 1 | awk '{printf("%s",$2)}')
(cpulimit -p $PID1 -l 20)&

nice -n 15 ./ex4_2.sh&
#sleep 1
PID2=$(ps -aux | grep -E -h -s -i  "/bin/bash ./ex4_2.sh" | head -n 1 | awk '{printf("%s",$2)}')
(cpulimit -p $PID2 -l 25)&

exit 0;

# pmap 2 | tail -n 1 |  awk '/[0-9]K/{print $2}'
nice -n 8 = max 20 % nice works from -20 to 20 which is 40 points... 1%=0.4, 20%=-12, 40%=-4, 60%=4, 80%=12,100%=20
nice -n 8 ./script4dop.bash& : If a command is terminated by the control operator &, the shell executes the command in the background in
a subshell.  The shell does not wait for the command to finish, and the return  status  is  0.
Thus a process run with nice +15 will receive 25% of the CPU time allocated to a normal-priority process: (20 − 15)/(20 − 0) = 0.25