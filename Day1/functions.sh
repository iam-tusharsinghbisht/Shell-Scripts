#!/bin/bash

#This script demostrate the working of functions

add(){
a=$1
b=$2

addition=$(( a + b ))
echo "Sum of a and b: $addition"
}

add $1 $2
