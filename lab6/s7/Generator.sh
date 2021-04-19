#! /bin/bash

while true
do
read a
case $a in 
"+")
kill -USR1 $(cat .removable.tmp)
;;
"*")
kill -USR2 $(cat .removable.tmp)
;;
"TERM")
kill -SIGTERM $(cat .removable.tmp)
;;
"exit")
exit 0
;;
esac
done

exit 0