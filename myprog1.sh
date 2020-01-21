#!/bin/bash
# Shell script to test if a string is a palindrome
# This uses the well known method to scan half the string matching
# the i and len - i chars, if one mismatch is found it quits immediately
 
var=$1
string_1=$var
i=0
len=${#string_1} 
string_2=${string_1,,}
if [ $# -eq 1 ];
then
	if [ "$var" == "" ] 
	then
	echo "Please enter a word,phrase or sequence." ##control input is entered or not

	else
		if [ "$var" == " " ] 
		then
		echo "Please enter a word,phrase or sequence." ##control input is entered or not

		else
		#get the mid value upto which the comparison would be done
		Middle=$(($len/2))
		 
		while [ $i -lt $Middle ] 
		  do
		    if [ "${string_2:$i:1}" != "${string_2: -$(($i+1)):1}" ] ##control head of string is equal to end of string or not
		      then
		      echo "\"$string_2\" IS NOT a Palindrome"
		      exit
		    fi
		    i=$(($i+1)) ##iterate
		done
		echo "\"$string_2\" IS a Palindrome"



fi
fi
else
echo "Wrong Number of Arguments" ##control number of arguments
fi
