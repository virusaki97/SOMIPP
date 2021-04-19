#! /bin/bash

while read a
do

if [[ -n $(grep -E -h -s -i "$a" $HOME/.trash.log | grep "Calea spre fisierul sters" | awk '{print $5} ') ]]
then

path=$(dirname $(grep -E -h -s -i "$a" $HOME/.trash.log | grep "Calea spre fisierul sters" | awk '{print $5} '))
filename=$(basename $(grep -E -h -s -i "$a" $HOME/.trash.log | grep "Calea spre fisierul sters" | awk '{print $5} '))
line_number=$(echo $(grep -n "$a" $HOME/.trash.log | awk '{print $1}' | grep -o '[[:digit:]]*'))
linked_file=$(head -n $(($line_number+1)) $HOME/.trash.log | tail -n 1 | grep -o '[[:digit:]]*')

echo "Doriti restabilirea fisierului "$filename" ? [y/n]"
read b < /dev/tty #read from terminal ! 

if [[ $b == "y" ]]
then
cp $HOME/.trash/$linked_file $path
mv $path/$linked_file $path/$filename
fi
#echo $line_number" : "$path 
else
linked_file=$(grep -E -h -s -i "$a" $HOME/.trash.log | grep "Numele linkului creat" | awk '{print $4} ')
fi

done < $HOME/.trash.log

exit 0;