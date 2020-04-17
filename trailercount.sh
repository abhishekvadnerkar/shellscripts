#!/bin/bash
file=$1
bklocation=/HealthPlan_Files/Incoming_Files/HealthFirst/TrailerRecordRemoved
cp -p $file $bklocation
filename=$(basename $file)
bkp_file=$bklocation/$filename
out="output"
rcount=0
trailer=0
rcount=`cat $bkp_file |sed '/^[[:space:]]*$/d' | sed '/^$/d'| wc -l`
trailer=`cat $bkp_file |sed '/^[[:space:]]*$/d' | sed '/^$/d'|tail -n 1| cut -d "(" -f2 | cut -d ")" -f1 | cut -d " " -f1`
rcount=$((rcount-1))
#echo "Row count minus header and trailer is: $rcount"
#echo "Trailer count is : $trailer"
if [[ $rcount == $trailer ]]
then
   out=$bklocation
   sed -i '$d' $bkp_file
else
   out="false"
fi
