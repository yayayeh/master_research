#!/bin/bash
function="function"
WA1n="WA1n,"
WA1p="WA1p,"
WA2n="WA2n,"
WA2p="WA2p,"
WB1n="WB1n"
WB1p="WB1p"
WB2n="WB2n"
WB2p="WB2p"
WC1n="WC1n"
WC1p="WC1p"
WC2n="WC2n"
WC2p="WC2p"
WD1n="WD1n"
WD1p="WD1p"
WD2n="WD2n"
WD2p="WD2p"
WT1n="WT1n"
WT1p="WT1p"
WT2n="WT2n"
WT2p="WT2p,"
time="time"
solved="solved"
name="WA1n"

for file in $(ls -v n15/)
do
	echo "================"
	echo $file
	file_dir="n15/"$file
	time_dir="total/time.txt"
	
	function=$function","$(echo $file | awk -F'.' '{print $1}')
	echo $function

	infoObj=$(egrep 'Objective' $file_dir)
	objective=$(echo $infoObj | awk '{print $5}')
	echo $objective
	
	for i in $(seq 3 22)
	do
		if [ $i == 3 ]; then name="WA1n" 
		fi
		if [ $i == 4 ]; then name="WA1p" 
		fi
		if [ $i == 5 ]; then name="WA2n" 
		fi
		if [ $i == 6 ]; then name="WA2p" 
		fi
		if [ $i == 7 ]; then name="WB1n" 
		fi
		if [ $i == 8 ]; then name="WB1p" 
		fi
		if [ $i == 9 ]; then name="WB2p" 
		fi
		if [ $i == 10 ]; then name="WB2p" 
		fi
		if [ $i == 11 ]; then name="WC1n" 
		fi
		if [ $i == 12 ]; then name="WC1p" 
		fi
		if [ $i == 13 ]; then name="WC2n" 
		fi
		if [ $i == 14 ]; then name="WC2p" 
		fi
		if [ $i == 15 ]; then name="WD1n" 
		fi
		if [ $i == 16 ]; then name="WD1p" 
		fi
		if [ $i == 17 ]; then name="WD2n" 
		fi
		if [ $i == 18 ]; then name="WD2p" 
		fi
		if [ $i == 19 ]; then name="WT1n" 
		fi
		if [ $i == 20 ]; then name="WT1p" 
		fi
		if [ $i == 21 ]; then name="WT2n" 
		fi
		if [ $i == 22 ]; then name="WT2p" 
		fi


		#echo ${!name}
		info=$(egrep $name $file_dir)
		#eval aval=\$${!name}
		tmp=\$$name
		echo "a:"${!name}
		echo "b:"$tmp

		if [[ -n "$(egrep 'Subject' $file_dir)" ]]; then #-n means ""is not empty
			tmp=${!name}", "
			echo $tmp
		else
			if [[ -z "$info" ]]; then #-z means "" is empty
				#echo "no var here!"
				tmp=${!name}",0"
				echo $tmp
			else 
				#echo $(echo $info | awk '{print $2}')
				tmp=${!name}","$(echo $info | awk '{print $2}')
				echo $tmp
			fi
		fi
	done

	line=$(egrep $(echo $file | awk -F'.' '{print $1}') $time_dir)
	echo $line
	time=$time","$(echo $line | awk '{print $2}')
	if [[ $line =~ "X"  ]]; then #-n means ""is not empty
		solved=$solved",X"
	else
		solved=$solved", "
	fi
	echo $time
	echo $solved
done

for i in $(seq 3 22)
do
	if [ $i == 3 ]; then name="WA1n" 
	fi
	if [ $i == 4 ]; then name="WA1p" 
	fi
	if [ $i == 5 ]; then name="WA2n" 
	fi
	if [ $i == 6 ]; then name="WA2p" 
	fi
	if [ $i == 7 ]; then name="WB1n" 
	fi
	if [ $i == 8 ]; then name="WB1p" 
	fi
	if [ $i == 9 ]; then name="WB2p" 
	fi
	if [ $i == 10 ]; then name="WB2p" 
	fi
	if [ $i == 11 ]; then name="WC1n" 
	fi
	if [ $i == 12 ]; then name="WC1p" 
	fi
	if [ $i == 13 ]; then name="WC2n" 
	fi
	if [ $i == 14 ]; then name="WC2p" 
	fi
	if [ $i == 15 ]; then name="WD1n" 
	fi
	if [ $i == 16 ]; then name="WD1p" 
	fi
	if [ $i == 17 ]; then name="WD2n" 
	fi
	if [ $i == 18 ]; then name="WD2p" 
	fi
	if [ $i == 19 ]; then name="WT1n" 
	fi
	if [ $i == 20 ]; then name="WT1p" 
	fi
	if [ $i == 21 ]; then name="WT2n" 
	fi
	if [ $i == 22 ]; then name="WT2p" 
	fi

	echo ${!name}
done