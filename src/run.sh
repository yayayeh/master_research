#!/bin/bash
for i in $(seq 4 15)
do
	bash copy$i".sh" >> n$i"_all.csv"
done
