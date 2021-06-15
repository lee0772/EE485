#!/bin/bash

myvar="Hi, EE485"

echo "first argument is", $1

echo $myvar
echo "$myvar"

echo "Enter some text... "
read myvar
echo '$myvar' now equals $myvar

exit 0
