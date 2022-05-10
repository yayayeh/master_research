#!/bin/bash

WA1n="WA1n"
WA1p="WA1p"
WA2n="WA2n"
WA2p="WA2p"
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
WT2p="WT2p"

for file in $(ls -v case_1w_l2_partial/)
do
	echo "================"
	echo $file
	tmp=$(echo $file | awk -F'.' '{print $2}')
	if [ $tmp == "lp" ]; then
		echo $file >> list.txt
	fi
	


done
