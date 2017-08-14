#!/bin/bash
cli53 list --profile fu-prod| awk '{ print $2 }' | tail -n +2 |
while read line; 
do
	cli53 export --profile fu-prod ${line} | awk '$4== "NS" {print $5}' >> "${line}";
done
