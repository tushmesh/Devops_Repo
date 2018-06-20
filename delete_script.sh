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
git add .
git status --short > changes.txt

grep -i "^[A|M]" changes.txt | awk '{print $2}' > changes1.txt

while read line; do

	echo $line
        sed -i '/FILES_CHANGED_START/,/FILES_CHANGED_END/ { //!p }' file2.txt

	done < changes1.txt

#############################################################################
