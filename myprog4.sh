#!/bin/bash

##This code take a wildcard as input and maybe pathname then this code search this wildcard in txt files in given path. If pathname is not given, the code search wildcard in whole paths.


varname=$1 ##Given wildcard
pathname=$2 ##Given pathname optional
##echo "$varname"

if [[ "$varname" =~ ^[0-9]+$ ]]
then
echo "Invalid input, your input must be a wildcard" 

else

if [ $# -eq 2 ]; ##if there are two input taken
then

if [[ "$pathname" =~ ^[0-9]+$ ]]
then
echo "Invalid input, your input must be a pathname" 
else
orig=$varname
mod=${orig//[*]/.*} ##this is a modifying on wildcard input to take multiple characters before and after of "*"
## echo "$mod"

if [[ "${varname:${#varname}-1}" == "*" ]]; then ##to control "*" is end of the wildcard 
   my_array=() ##array to keep txt names that contain given wildcard
while IFS= read -r line; do
    my_array+=( "$line" )
done < <(grep -H -r -l --include="*.txt" $mod $pathname) ##search given wildcard in given path by recursively
## declare -p my_array


for u in "${my_array[@]}"
do
tr -s '[:blank:]' '[\n*]' < $u | ##take txt files one by one that contains given wildcard
while IFS= read -r p; do
    
if [[ "$p" = $varname ]]; then  ##if this words assign given wildcard and they are matching uppercase this words
    new=${p^^} ## uppercase
    sed -i -e "s/$p/$new/g" $u  ## change this updated uppercase words in txt files in pathname
    echo "The word “$p” inside $u is substituted with “${p^^}”." 
fi

done 
done

else ## "*" is not end of the wildcard , for example middle an*e or *nne
orig=$varname
mod=${orig//[*]/.*} ##this is a modifying on wildcard input to take multiple characters before and after of "*"
##echo "$mod"




my_array=() ##array to keep txt names that contain given wildcard
while IFS= read -r line; do
    my_array+=( "$line" )
done < <(grep -H -r -l --include="*.txt" $mod $pathname) ##search given wildcard in given path by recursively
## declare -p my_array




for u in "${my_array[@]}"
do
tr -s '[:blank:]' '[\n*]' < $u | ##take txt files one by one that contains given wildcard
 while IFS= read -r p; do
    
if [[ "$p" = $varname ]]; then   ##if this words assign given wildcard and they are matching uppercase this words
     new=${p^^} ## uppercase
     sed -i -e "s/$p/$new/g" $u  ## change this updated uppercase words in txt files in pathname
     echo "The word “$p” inside $u is substituted with “${p^^}”." 

fi

done 

done

fi

fi


elif [ $# -eq 1 ]; ##if there are one input taken
then

orig=$varname 
mod=${orig//[*]/.*} ##this is a modifying on wildcard input to take multiple characters before and after of "*"
## echo "$mod"

if [[ "${varname:${#varname}-1}" == "*" ]]; then
   my_array=()
while IFS= read -r line; do
    my_array+=( "$line" )
done < <(grep -H -r -l --include="*.txt" $mod ) ##search given wildcard in home path by recursively
## declare -p my_array


for u in "${my_array[@]}"
do
tr -s '[:blank:]' '[\n*]' < $u |
while IFS= read -r p; do
    
if [[ "$p" = $varname ]]; then  ##if this words assign given wildcard and they are matching uppercase this words
    new=${p^^}
    sed -i -e "s/$p/$new/g" $u  
    echo "The word “$p” inside $u is substituted with “${p^^}”." 

fi

done 
done

else ## "*" is not end of the wildcard , for example middle an*e or *nne
orig=$varname
mod=${orig//[*]/.*} ##this is a modifying on wildcard input to take multiple characters before and after of "*"
## echo "$mod"




my_array=()
while IFS= read -r line; do
    my_array+=( "$line" )
done < <(grep -H -r -l --include="*.txt" $mod )  ##search given wildcard in home path by recursively
## declare -p my_array




for u in "${my_array[@]}"
do
tr -s '[:blank:]' '[\n*]' < $u |
 while IFS= read -r p; do
    
if [[ "$p" = $varname ]]; then  ##if this words assign given wildcard and they are matching uppercase this words
     new=${p^^}
     sed -i -e "s/$p/$new/g" $u  
     echo "The word “$p” inside $u is substituted with “${p^^}”." 

fi

done 

done

fi

else
echo "Invalid input number, please enter one or two input!!"


fi
fi


