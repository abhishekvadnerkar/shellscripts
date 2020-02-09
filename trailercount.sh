#!/bin/bash

#Initialize counters
rowcount=-1
tailcount=0 

while read line
do
 echo "$line"

 #check for blank lines
 if [[ $line == '' ]]
 then 
   continue
 fi

 #check for Trailer keyword
 if [[ $line == "TRAILER"* ]]
 then
   tailcount=$(( `echo "$line" | cut -d '|' -f2` ))
 else
   rowcount=$((rowcount+1))
 fi

done < $1
echo "Data count is: $rowcount lines"
echo "Tail count is: $tailcount lines"
echo
if [[ $rowcount == $tailcount ]]
then
  echo "Row & Tail count match.Processing file....."
else
  echo "Row & Tail count mis-match. Error!!!"
fi
