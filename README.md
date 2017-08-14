# AWS-Route-53-Backup

# Introduction

This project tracks the settings for the route 53 DNS entries in FU-PROD and FUWT aws accounts. It also contains scripts for manipulating the dns entries and future migration.

Not included

This project does notinclude jenkens settings. 

## How it works

Really quick version

copy the export file to a new folder and run the exportscript.sh to backup dns settings.

Before starting:
--------------
Install Required Software
1. Recommend using home-brew for installations: https://brew.sh
2. Install aws cli    
    brew install awscli
    
3. Install route 53 cli
    brew install cli53


## Display the list of Route 53 domains:
    cli53 list --profile fu-prod
    
## Script for Backing up Route 53 Entries:

This script lists all the domains in the default aws account's route 53 then saves the configurations for each domain into a text file.

Download a DNS Backup Script:
#!/bin/bash
cli53 list | awk '{ print $2 }' | tail -n +2 |
while read line; 
do
    cli53 export ${line} > "${line}bk"; 
done

Migrate Domain Setting Script:

ls 
while read line;
do
cli53 create &{line};
cli53 import --file ${line} “${line}”;
done
