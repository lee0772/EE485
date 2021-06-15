#!/bin/sh
echo “Is it morning? Please answer yes or no”
read timeofday

case "$timeofday" in 
	yes | y | Yes | YES ) echo “Good Morning”;;
	[nN]* ) echo “Good Afternoon”;;
	* ) echo “Sorry”
	exit 1;;
esac
