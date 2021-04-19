#!/bin/bash
today=$(date "+%F") #YYYY-MM-DD
NoFolder=0
for directory in $HOME/*

do
	dir=$(echo $(basename $directory))
	#echo $dir
	if [[ $dir =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2} ]]
	then 
		difference=$(echo $(( ($(date --date="$today" +%s) - $(date --date="$dir" +%s) )/(60*60*24) )))
 		# -d, --date=STRING       display time described by STRING, not `now'
		if [[ $difference -lt 7 ]]
		then
			mkdir $HOME/$today 2> /dev/null
			break;
		fi

		if [[ $difference -gt 7 ]]
		then
			existing_file=$dir
			break;
		fi  

		NoFolder=1
	fi
if [[ $NoFolder == 0 ]]
then
	mkdir $HOME/$today 2> /dev/null
fi

done

#punctul 2
if [ -d "$HOME/$today" ]
then
	cp $HOME/source/* $HOME/$today 2> /dev/null
	echo "Directorul "$today" a fost creat cu succes cu copiile de rezerva din "$HOME"/source" >> $HOME/backup-report.log
fi

#punctul 3
if [ ! -d "$HOME/$today" ]
then
	for directory in $HOME/source/*
	do
		dir=$(echo $(basename $directory))
		if [ ! -f "$HOME/$existing_file/$dir" ]
		then
			cp $HOME/source/$dir $HOME/$existing_file/
		fi
		if [ -f "$HOME/$existing_file/$dir" ]
		then
			size_existing=$(ls -lSrh $HOME/$existing_file/ | grep "$dir" | head -n 1 | awk '{print $5}')
			size_source=$(ls -lSrh $HOME/source/ | grep "$dir" | awk '{print $5}')
			if [[ $size_existing != $size_source ]]
			then
				new_name=$today"-"$dir
				mv $HOME/$existing_file/$dir $HOME/$existing_file/$new_name
				cp $HOME/source/$dir $HOME/$existing_file/
				NoFolder=2 #Daca au fost modificate 10 fisiere sa nu se introduca in backup 10 inregistrari
			fi
		fi
	done
if [[ $NoFolder == 2 ]]
then
	echo "Au fost efectuate modificari de backup in fisierul $existing_file la data de $today" >> $HOME/backup-report.log
fi
fi
exit 0