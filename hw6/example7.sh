#!/bin/bash

set foo bar bam

IFS=h
echo $@
echo $*
echo "$@"
echo "$*"

unset IFS
echo $@
echo $*
echo "$@"
echo "$*"
