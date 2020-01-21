#!/bin/bash
# loop*figures.bash
i1=$1
i2=$2
result=$((i1-i2)) ##difference
y=$(($result % 2)) ## difference of input 
z=$(($result / 2))

if ! [ $# -eq 2 ]; ## control how many input is entered
then
echo "Please enter only two argumans" 

elif [ $i1 -eq $i1 2>/dev/null ] || [ $i2 -eq $i2 2>/dev/null ] ##control i1 and i2 is integer or not
then


if  [ $i1 -gt $i2 ] && [ $y -eq 0 ] ## control i1>i2 and difference between i1 and i2 is even or not
then
   
for((m=1; m<=z; m++))  
do
## print stars   
    for((a=1; a<=i1; a++)) 
    do
      echo -ne "*"; 
    done
# New line 
    echo; 
done  
   
## print spaces
for((i=1; i<=i2; i++))
do
   for((m=1; m<=z; m++))
   do
    echo -ne "*"; 
   done
   for((m=1; m<=i2; m++))
   do
    echo -ne " "; 
   done
   for((m=1; m<=z; m++))
   do
    echo -ne "*"; 
   done

# New line 
    echo; 
done

for((m=1; m<=z; m++)) 
do
## print stars     
    for((a=1; a<=i1; a++)) 
    do
      echo -ne "*"; 
    done
# New line 
    echo; 
done  


else
    echo "First input must be bigger than second input and difference of this inputs must be even number!!"

fi
else
echo "Please enter only integer argumans"

fi






