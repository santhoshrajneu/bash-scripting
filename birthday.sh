#!/bin/bash

BIRTHDAY="07/31/1999";
echo $BIRTHDAY;

SUM=0
num_regex='^[0-9]+$'
for (( i=0; i<${#BIRTHDAY}; i++ )); do
    if [[ ${BIRTHDAY:$i:1} =~ $num_regex ]] ; then
        SUM=`expr $SUM + ${BIRTHDAY:$i:1}`
    fi
done

echo $SUM
