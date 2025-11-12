#!/bin/bash

# This file used to switch php version
# Check if a PHP version is provided as an argument
if [ -z "$1" ]; then
	echo "Usage: $0 <php_version>"
	echo "Example: $0 7.4"
	exit 1
fi

php_version=$1

# Prompt the user to select the PHP version
# echo "User php version: (e.g., 7.4 8.1):"
# read php_version

# Check if php version if exsits
check_use_php_path=$(update-alternatives --list php | grep $php_version)
if [ -z "$check_use_php_path" ]; then
	echo "PHP version $php_version not found"
	exit 1
fi

# Temporarily select php8.2 to avoid error when doing 'valet use ...'
php_path=$(update-alternatives --list php | grep 8.2)
echo "Using php path : $php_path"

# Update alternatives for PHP
sudo update-alternatives --set php $php_path >>/dev/null

# Use the specified PHP version with Valet
# The php version will changed here: (including php in cli)
valet use $php_version

echo "Switched to php$php_version"
