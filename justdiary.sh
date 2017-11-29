#!/bin/bash

DIARY_PATH="~/Diary/"
cd $DIARY_PATH

CONTENT=$(echo $* | egrep -o ': .*' | sed "s/: //") #Get everyhing after ": "
DATE=$(echo $* | sed "s/: $CONTENT//") #Get date so everyting before ": "

if date -d "$DATE" | grep 'invalid' -q -v; then
	# Found valid date
	DATE=$(date -d "$DATE")
	echo $DATE > /tmp/date.justdairy.tmp
else
	# Did not find valid date
	if date -d "$*" | grep 'invalid' -q -v; then
		DATE=$(date -d "$*")
		echo $DATE > /tmp/date.justdairy.tmp
	else
		ALL=$*
		if date -d "${ALL%:*}" | grep 'invalid' -q -v; then
			echo ${ALL%:*} > /tmp/date.justdairy.tmp
		else
			echo "no date so today"
			date > /tmp/date.justdairy.tmp
			touch /tmp/nodate.justdairy.tmp
		fi
	fi
fi

DATE=$(cat /tmp/date.justdairy.tmp)
rm /tmp/date.justdairy.tmp

mkdir -p $(date +%Y/%m/ -d "$DATE")

if [ -f /tmp/nodate.justdairy.tmp ]; then
	rm /tmp/nodate.justdairy.tmp
	CONTENT=$*
fi

if [[ ${#CONTENT} == 0 ]]; then
	$EDITOR $(date +%Y/%m/%d -d "$DATE").txt
	exit
fi

if [ -f $(date +%Y/%m/%d -d "$DATE").txt ] # if file exists
then
	if [ -s $(date +%Y/%m/%d -d "$DATE").txt ] # if file is empty
	then
		echo "" >> $(date +%Y/%m/%d -d "$DATE").txt
	fi
fi
APPEND=$(date +%H:%M -d "$DATE")
echo $APPEND $CONTENT >> $(date +%Y/%m/%d -d "$DATE").txt
exit
