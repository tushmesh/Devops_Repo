#$Header: $
#!/usr/bin/ksh
######################################
# Author:       GOPAL KRUSHNA SAHU
# Date:         22-06-2018
#
# Description
#
# This scripts would be used to read the release note and put it in the required
# sequence for deployment
#
#
#
#--------------------------------------------------------------------------
# Version History
#
# Date            Initials                 Description
# ~~~~            ~~~~~~~~                 ~~~~~~~~~~~
# 22-06-2018    Initial Version
###########################################################################
# Setting up Variables
###########################################################################
cd /c/Users/gopal.krushna.sahu/GitRepo/Devops_Repo/MDM/Release_Note

sed '/FILES_CHANGED_START/,/FILES_CHANGED_END/ { //!d }'  ReleaseNote.txt >  ReleaseNotefinal.txt

git status --short > modified_file_list.txt
#git add .
grep -i "^[A|M]" modified_file_list.txt | awk '{print $2}' > modified_file_list_final.txt

git status
echo "Enter file name in required Sequence and proceed"
read filename

>sequence.txt

echo "$filename" | tr " " "\n" >> sequence.txt
sed -i '/FILES_CHANGED_START/r file3.txt' ReleaseNotefinal.txt

echo $filename
#git add $filename

#############################################################################

