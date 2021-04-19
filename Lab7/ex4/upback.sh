#!/bin/bash
most_recent=0
for i in $HOME/*/ 
do
	if [[ $(basename $i) =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2} ]]
	then
		dir=$(echo $(basename $i)) # Gasim directoria cu numele care ne trebuie !		
		break
	fi	
	
done

if [ ! -d $HOME/restore/ ]
then
	mkdir $HOME/restore/
fi

for a in $HOME/$dir/*
do
	if [[ $(basename $a) =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2} ]]
	then
		file_name=$(echo $(basename $a))
		File_Name=$(echo "${file_name%-*}")
		Last_Name=$(echo "${file_name##*-}")
		recent=$(echo $(date --date=$File_Name "+%s"))	
		for b in $HOME/$dir/*
		do
			if [[ $(basename $b) =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2} ]]
			then
				file_name2=$(echo $(basename $b))
				File_Name2=$(echo "${file_name2%-*}")
				Last_Name2=$(echo "${file_name2##*-}")
				recent2=$(echo $(date --date=$File_Name2 "+%s"))	
				if [[ $Last_Name == $Last_Name2 ]]
				then
					if [[ $recent2 -ge $recent ]]
					then
						most_recent=$recent2
						
					fi
				fi
				
			fi
		done
		if [[ $recent -ge $most_recent ]]
		then
			cp $HOME/$dir/$file_name $HOME/restore/
		fi
	fi 
done

exit 0