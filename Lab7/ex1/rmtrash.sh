#! /bin/bash
echo "introduceti parametrul scriptului dat: "
read a

FILE=$HOME/.trash/
if [ ! -d "$FILE" ]; then
    mkdir "$FILE"
fi

touch "$a"
HardLink=$(date +%s)
ln "$a" "$FILE$HardLink"

directory=$(pwd)
rm $a
echo "Calea spre fisierul sters: " $directory"/"$a > $HOME/.trash.log 
echo "Numele linkului creat: " $HardLink >> $HOME/.trash.log 
exit 0