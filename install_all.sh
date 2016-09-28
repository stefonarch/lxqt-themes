#!/bin/bash
#check if root
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi
#check for git
hash git &> /dev/null
if [ $? -eq 1 ]; then
	echo >&2 "Please install git to use this script"
	exit 1
else
    echo "Found git - ok"
fi
	cd /tmp
for i in \
	archlinux-dark \
	silver \
	black-red \
	black-green \
	ice

do
	echo "Downloading $i theme ........."
	git clone -q https://github.com/stefonarch/$i
	rm -rf $i/.git
	cp -a $i /usr/share/lxqt/themes/
	echo "LXQt theme '$i' installed"
	echo "+++++++++++++"
#cleanup
	rm -rf $i
done

echo "Install finished"