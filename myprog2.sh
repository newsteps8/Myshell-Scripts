##checks if pathname is empty or not
if test -z "$1"	##if pathname is empty
then
	if [[ ! -e cprogs ]]	##checks if cprogs folder is exists or not
	then
   		mkdir cprogs
		mv $PWD/*.c $PWD/cprogs/ ##moves *.c files into cprogs located in current directory
	else
		echo "cprogs folder is exists"
	fi
else	##if pathname is not empty
	if [ -d "$1" ]	##if the pathname is valid
	then
		cd $1

		if [[ ! -e cprogs ]]	##checks if cprogs folder is exists or not
		then
   			mkdir cprogs
			mv $PWD/*.c $PWD/cprogs/ ##move *.c files into cprogs located in pwd
		else
			echo "cprogs folder is exists"
		fi

	else
		echo "$1 is not a valid directory"
	fi
fi
