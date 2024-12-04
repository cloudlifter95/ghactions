#!/bin/sh -l

echo "Hello $1"
printenv
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
echo "redirected_input=$1" >> $GITHUB_OUTPUT

