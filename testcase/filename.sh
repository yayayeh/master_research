#!/bin/bash

for file in $(ls -v case_1w_l2_partial/)
do
	echo $file >> list.txt
done

