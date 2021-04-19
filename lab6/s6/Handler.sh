#! /bin/bash
echo $$ > .removable.tmp	# $$ - Process ID of current shell instance
Stop()
{
echo "Process was terminated !"
exit 0
}
while true
do
trap 'Stop' SIGTERM		# daca primeste semnalul SIGTERM de la kill -SIGTERM $PID, atunci indeplineste functia SIGTERM
a=$RANDOM
echo $a
sleep 1
done
exit 0