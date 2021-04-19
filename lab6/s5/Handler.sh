#! /bin/bash
raspuns1=$raspuns2
operatie1=$operatie2

if  (echo $a | grep -E "^-?[0-9]+$" 1>/dev/null) # 1=stout 2=stderror
then
    if [[ $operatie1 == "+" ]]
       then
        echo "Introduceti un numar ce va fi sumat cu ultimul rezultat: "
        read var1 < /dev/tty
        raspuns1=$(( raspuns1+var1 ))
        echo "Rezultatul adunarii:" $raspuns1
	echo ""
        fi
        if [[ $operatie1 == "*" ]]
        then
        echo "Introduceti un numar ce va fi inmultit cu ultimul rezultat: "
        read var1 < /dev/tty
        echo $raspuns1
        raspuns1=$(( raspuns1*var1 ))
        echo "Rezultatul inmultirii:" $raspuns1
	echo ""
        fi

fi

if [[ $a == "+" ]] 
then 
    operatie1="+"
    echo "Introduceti doua numere ce vor fi adunate !"
    echo "Introduceti primul numar: "
    read var1 < /dev/tty
    echo "Introduceti al doilea numar: "
    read var2 < /dev/tty # /dev/tty - ia din terminal !
    raspuns1=$(( var1 + var2 ))
    echo "Rezultatul adunarii: "$raspuns1""
    echo ""
fi

if [[ $a == "*" ]] 
then 
    operatie1="*"
    echo "Introduceti doua numere ce vor fi inmultite !"    
    echo "Introduceti primul numar: "
    read var1 < /dev/tty
    echo "Introduceti al doilea numar: "
    read var2 < /dev/tty # /dev/tty - ia din terminal !
    raspuns1=$(( var1 * var2 ))
    echo "Rezultatul inmultirii: "$raspuns1""
    echo ""
fi
echo "$operatie1" > temporary.tmp
echo "$raspuns1" >> temporary.tmp

exit 0
