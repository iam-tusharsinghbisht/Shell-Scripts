#!/bin/bash

#This script demostrate loops for and while

#For loop: print 1 to 10

for i in {1..10}; do
	echo "Loop: $i"
done

count=10

while (( count > 1 )); do
	echo "while loop: $count"
	(( count-- ))
done


