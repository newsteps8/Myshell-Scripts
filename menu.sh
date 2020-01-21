#!/bin/bash -f

while :
do
	clear
	echo "-------------------------------------"
	echo " Main Menu "
	echo "-------------------------------------"
	echo "1. Check for palindromes"
	echo "2. Move .c files"
	echo "3. Draw hollowed square"
	echo "4. Uppercase conversion"
	echo "5. Delete files"
	echo "6. Exit"
	echo "======================="
	read -p "Enter your menu choice [1-5]: " choose
	case $choose in
		1) read -p "Enter a String: " op1; ./myprog1.sh $op1 ; echo "Press a key. . ." ; read ;;
		2) read -p "Enter a Path: " op1; ./myprog2.sh $op1; echo "Press a key. . ." ; read ;;
		3) read -p "Ente Two Integers: " op1 op2; ./myprog3.sh $op1 $op2; echo "Press a key. . ." ; read ;;
		4) read -p "PLACEHOLDER: " op1 op2; ./myprog4.sh $op1 $op2; echo "Press a key. . ." ; read ;;
		5) read -p "Enter a Path and/or Option: " op1 op2; ./myprog5.sh $op1 $op2; echo "Press a key. . ." ; read ;;
		6) exit 0 ;;
		*) echo "Opps!!! Please select choice 1,2,3,4, or 5";
	esac
done
