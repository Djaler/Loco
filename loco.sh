#!/bin/bash
number=0
final=0
echo 0 > loco.tmp
if [ $# -ge 1 ]
then
	number=$1
	if [ $# -eq 2 ]
	then
		final=1
	fi
fi

if [ $number -ne 0 ]
then
	tmp=$(cat loco.tmp)
	declare -i tmp
	while [ $tmp != $number ]
	do
		tmp=$(cat loco.tmp)
	done
else
	echo "Press any key to start"
	read
fi

clear
./sl &
sleep $(echo $(tput cols) \* 0.04 | bc -l)

if [ $final -ne 1 ]
then
	let "number += 1"
	echo $number > loco.tmp
else
	rm loco.tmp
fi

wait %1

clear
exit 0