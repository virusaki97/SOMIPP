#! /bin/bash
echo $$ >.removable.tmp
variable=1
USR1()
{
variable=$((variable+2))
echo $variable
}
USR2()
{
variable=$((variable*2))
echo $variable
}
SIGTERM()
{
echo "Process ended !"
exit 0;
}
while true
do
trap 'USR1' USR1
trap 'USR2' USR2
trap 'SIGTERM' SIGTERM
done
exit 0