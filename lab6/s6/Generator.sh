#! /bin/bash
while true
do
echo "Introduceti un sir de caractere: "
read a < /dev/tty		#< /dev/tty asteapta introducerea din terminal /dev/tty is a special file, representing the terminal for the current process
if [[ $a == "TERM" ]]
then
kill -SIGTERM $(cat .removable.tmp)
fi
if [[ $a == "quit" ]]
then
echo "Process ended !"
fi
done
exit 0