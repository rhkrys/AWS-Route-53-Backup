#!/bin/bash
cli53 list | awk '{ print $2 }' | tail -n +2 |
while read line; 
do
    cli53 export ${line} > "${line}"; 
done
