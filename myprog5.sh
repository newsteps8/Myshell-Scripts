##general explanation of the function find that I used in whole question
##find . -maxdepth 1 -type f  -size 0 -exec rm -i {} \;
##after find pathname comes, I used .(current directory) or $PWD
##-maxdepth 1 means it will delete the files which located in only defined directory, not in its subdirectories
##basically not recursive
##-type f means this function will find the files
##-size 0 means all the files whose size is zero
##-exec also acts like a "test" on the pathnames found by find
##rm -i meaning is remove the files and -i options ask to user to delete each file

if [ $# -eq 1 ]; ##if number of inputs are equal to 1
then
##this part determines that if the input is pathname or argument
	if [ -d "$1" ] ##if the input is a valid pathname
	then
		cd $1
		find $PWD -maxdepth 1 -type f  -size 0 -exec rm -i {} \; 
	elif [[ $1 = "-R" || $1 = "-r" ]]; ##if the input is a valid option
	then
		find . -type f  -size 0 -exec rm -i {} \;
	else
		echo "Unsuitable argument"
	fi

elif [ $# -eq 2 ]; ##if number of inputs are equal to 2
then
	if [ -d "$1" ] ##if the input is a valid pathname
	then
		cd $1
		if [[ $2 = "-R" || $2 = "-r" ]];
		then
			find $PWD -type f -size 0 -exec rm -i {} \;
		else
			echo "Wrong Option"
		fi
	else
		echo "Wrong Path"
	fi
	
elif [ $# -eq 0 ]; ##if number of inputs are equal to 0
then
	find . -maxdepth 1 -type f  -size 0 -exec rm -i {} \;
else
	echo "Wrong Number of Arguments"
fi
