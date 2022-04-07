#!/bin/bash

set -e

REPOS=~/Public/telnet_32

do_push2repo()
{
	if [ $# -lt 1 ];then
		return -1
	fi
	cd $1;
	REMOE_REPOS=`git remote -v |  awk '/(push)/ && /iysheng/ {print $1}' 2> /dev/null`
	if [ -n $REMOE_REPOS ];then
		for remote_repo in $REMOE_REPOS;do
			git push $remote_repo `git branch | awk '{print $2}'`
		done
    else
		return -2
	fi
}

for repo in $REPOS;do
	if [ -r $repo ];then
    	do_push2repo $repo;
	fi
done
