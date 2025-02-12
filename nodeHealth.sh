#!/bin/bash
###########################
# Author: Priva
# Date 2/2/25
# this script outputs the node health
# V1
# ########################

set -x #debug mode
set -e #exit the script when there is an error, will not work in case of pipefail
set -o #exit the script if pipe fail (|)  

#disk size
df -h

#memory
free -g

#resources
nproc

ps -ef | grep "root" | awk -F" " '{print $1}'
