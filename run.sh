#!/bin/bash
## Added new Comment
git status

while read line; do

 	sed -i "/CHANGED_FILES_START/a $line"  replace.txt
done < RN.txt


#echo  "Enter the files to check-in :  "

#  declare -a arr=("$@")
 # echo $arr
echo "Enter File name in Sequence " 
read filename

echo "$filename" | tr " " "\n" >> file.txt

## My Changes

