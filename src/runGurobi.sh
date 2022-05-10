#!/bin/bash
count=1
while read line || [ -n "$line" ];
do
	echo "\n************" $count
	count=$(($count+1))
	function=$(echo $line | cut -d"." -f 1)
	echo $function
	echo $line
	./function2lp $function	
done < $1

#python test.py < $1
