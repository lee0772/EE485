#!/bin/sh
touch file_one

rm -f file_two

if echo "True1" && [ -f file_one ] && echo "True3"
then
	echo "And list"
	rm -f file_one
else
	echo "And list fail"
fi

touch file_two
if [ -f file_one ] || echo "False1" || [ -f file_two ] || echo "False2"
then
	echo "Or list"
else
	echo "or list fail"
fi
