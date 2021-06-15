#!/bin/sh

foo=1

while [ $foo -le 10 ];
do
	touch "./test/$foo.txt"
	foo =$(($foo+1))
done
exit 0
