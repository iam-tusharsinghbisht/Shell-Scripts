#!/bin/bash

# THis script create a new user with username providied by user.

read -p "Enter username: " username

echo "Username: $username"

sudo useradd -m $username

echo "New user added ; $username"
