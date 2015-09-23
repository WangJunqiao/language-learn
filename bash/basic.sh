#!/bin/bash

a=5
b='hello'
c="hello"

d=`ls` #get output of this command
echo $d

e=$(ls | grep a) #get output of this command
echo $e


