#!/bin/bash
DIARY_PATH="~/Diary/"
cd $DIARY_PATH
if [[ "$1" == "e" ]] || [[ "$1" == "edit" ]]
then
	if  date -d "$2" | grep 'invalid' -q -v
	then
		# Found valid date in $2 so open coressponding file
		$EDITOR $(date +%Y/%m/%d -d "$2").txt
	else
		# Did not find valid date in $2 so open todays file
		$EDITOR $(date +%Y/%m/%d).txt
	fi
	exit
fi


if  date -d "$1" | grep 'invalid' -q -v
then
	# Found valid date in $2 so open coressponding file
	DATE=$(date -d "$1")

else
	# Did not find valid date in $2 so open todays file
	DATE=$(date)
fi

mkdir -p $(date +%Y/%m/ -d "$DATE")



# If file exists AND is not empty, break line
if [ -f $(date +%Y/%m/%d -d "$DATE").txt ] # if file exists
then
	if [ -s $(date +%Y/%m/%d -d "$DATE").txt ] # if file is empty
	then
		echo "" >> $(date +%Y/%m/%d -d "$DATE").txt
	fi
fi
APPEND=$(date +%H:%M -d "$DATE")
if  date -d "$1" | grep 'invalid' -q -v
then
	echo $APPEND ${@:2} >> $(date +%Y/%m/%d -d "$DATE").txt
else
	echo $APPEND $* >> $(date +%Y/%m/%d -d "$DATE").txt
fi
# Add date argument to add / edit a log on particular day or sth
