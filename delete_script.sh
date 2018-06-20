#$Header: $
#!/usr/bin/ksh
######################################
# Author:       GOPAL KRUSHNA SAHU
# Date:         25-MAY-2018
#
# Description
#
# This scripts would be used to read the rele
#
#
#
#--------------------------------------------------------------------------
# Version History
#
# Date            Initials                 Description
# ~~~~            ~~~~~~~~                 ~~~~~~~~~~~
# 18-JUN-2018    Initial Version
###########################################################################
# Setting up Variables
###########################################################################
cd /c/Users/gopal.krushna.sahu/GitRepo/Devops_Repo

sed '/FILES_CHANGED_START/,/FILES_CHANGED_END/ { //!d }' file1.txt > file2.txt

#echo "Enter file name to check-in, enter multiple files with blank space"
#read $line
#echo "Do you want to continue Y/N"
git add .
git status --short > changes.txt

grep -i "^[A|M]" changes.txt | awk '{print $2}' > changes1.txt

#        sed -i '/FILES_CHANGED_START/r changes1.txt' file2.txt
git status 
echo "Enter File name in Sequence copy paste from the able modified file"
read filename

echo "$filename" | tr " " "\n" >> file3.txt 
 sed -i '/FILES_CHANGED_START/r file3.txt' file2.txt

#############################################################################
