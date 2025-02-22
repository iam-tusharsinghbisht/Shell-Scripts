#!/bin/bash

#This script demonstrate error handling in scripts

create_dir(){
	mkdir demo1
}

if ! create_dir; then
	echo "This directory already exists!"
	exit 1
fi

echo "Dir Created : This line wont be printed in case directory already exist!"
