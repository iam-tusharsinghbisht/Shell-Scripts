#!/bin/bash

<< task
This script install aws CLI
task

set -x


install_aws_cli(){
	if aws --version > /dev/null; then
		echo "AWS CLI already installed, Skipping Installation"
		aws --version
	else
		echo "Installing AWS CLI"
		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
		unzip awscliv2.zip
		sudo ./aws/install
		echo "Installed successfully"
		aws --version
	fi
}

echo "****Task Execution Start*****"
if ! install_aws_cli; then
	echo "Error install aws cli"
	exit 1
fi
echo "****Task Execution Successfull****"

