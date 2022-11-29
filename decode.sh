#!/bin/bash
find  /home/albatross -maxdepth 1 -iname '*.wav' -exec mv -u -t /home/albatross/aptdec/build {} + 
mapfile -t contents < <(find /home/albatross/aptdec/build -amin -30 -iname '*.wav') && echo "${contents[@]}"

#if ("$contents[0]" == "0") then
#	echo "error finding file"
#	else
cd /home/albatross/aptdec/build
./aptdec "${contents[0]}"
#fi


