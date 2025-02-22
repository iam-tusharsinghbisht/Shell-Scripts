#!/bin/bash

#This script check if a is greater than b

a=$1
b=$2

if (( a > b )); then
	echo "a: $1 is greater than b: $2"
elif (( a == b )); then
	echo "a: $1 is equal to b: $2"
else
	echo "a: $1 is less than b: $2"
fi
