#!/bin/bash
for i in $(seq 4 15)
do
	mkdir n$i
done

for i in $(seq 0 101)
do
	cp total/f$i"."* n4/
	echo $i
done

for i in $(seq 102 448)
do
	cp total/f$i"."* n5/
	echo $i
done

for i in $(seq 449 1238)
do
	cp total/f$i"."* n6/
	echo $i
done

for i in $(seq 1239 2241)
do
	cp total/f$i"."* n7/
	echo $i
done

for i in $(seq 2242 3312)
do
	cp total/f$i"."* n8/
	echo $i
done

for i in $(seq 3313 3993)
do
	cp total/f$i"."* n9/
	echo $i
done

for i in $(seq 3994 4424)
do
	cp total/f$i"."* n10/
	echo $i
done

for i in $(seq 4425 4704)
do
	cp total/f$i"."* n11/
	echo $i
done

for i in $(seq 4705 4877)
do
	cp total/f$i"."* n12/
	echo $i
done

for i in $(seq 4878 4978)
do
	cp total/f$i"."* n13/
	echo $i
done

for i in $(seq 4979 5058)
do
	cp total/f$i"."* n14/
	echo $i
done

for i in $(seq 5059 5109)
do
	cp total/f$i"."* n15/
	echo $i
done