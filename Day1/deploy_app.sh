#!/bin/bash

#This script show real project working of script and error handling

<< task
Deploy an app
and handle all the error
task

create_clone(){
	echo "Clone the Git repo"
	git clone https://github.com/iam-tusharsinghbisht/python-monitoring-app.git
	cd python-monitoring-app
}

install_req(){
	echo "Install requirnments"
	sudo apt install nginx -y
}

req_restart(){
	ps -ef | grep "nginx" > /dev/null
	echo "nginx is running"
}

deploy(){
	echo "Build the app and run"
	docker build -t moni-app:latest .
	docker run -d -p 5000:5000 moni-app:latest
}

echo "******Deployment Started**********"
if ! create_clone; then
	echo "Repo already cloned"
fi

if ! install_req; then
	echo "installation Failed!"
	exit 1
fi

if ! req_restart; then
	echo "niginx is not running"
	exit 1
fi

if ! deploy; then
	echo "Deployment failed, mailing the admin"
	exit 1
fi
echo "******Deployment Successfull******"
