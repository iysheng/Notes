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
	if [ -n '$REMOE_REPOS' ];then
		for remote_repo in $REMOE_REPOS;do
			git push $remote_repo `git branch | awk '{print $2}'`
		done
    else
		return -2
	fi
}

do_pull_from_repo()
{
	if [ $# -lt 1 ];then
		return -1
	fi
	cd $1;
	echo $1
	REMOE_REPOS=`git remote -v | awk '/(pull)|(fetch)/ && /iysheng/ {print $1}' 2> /dev/null`
	if [ -n '$REMOE_REPOS' ];then
		for remote_repo in $REMOE_REPOS;do
			git pull $remote_repo `git branch | awk '{print $2}'`
		done
    else
		return -2
	fi
}

do_sync_to_repos()
{
	if [ $# -gt 0 ];then
    	remote_repos=$@
	else
		remote_repos=$REPOS
	fi

    for repo in $remote_repos;do
    	if [ -d $repo ];then
			echo -e "ready push to \033[35m$repo\033[0m"
        	do_push2repo $repo;
		else
			echo -e "invalid push repo:\033[31m$repo\033[0m"
    	fi
    done
}

do_sync_from_repos()
{
	if [ $# -gt 0 ];then
    	remote_repos=$@;
	else
		remote_repos=$REPOS;
	fi

    for repo in $remote_repos;do
    	if [ -r $repo ];then
			echo -e "ready pull from \033[35m$repo\033[0m"
        	do_pull_from_repo $repo;
		else
			echo -e "invalid pull repo:\033[31m$repo\033[0m"
    	fi
    done
}

while getopts "s:l:" opt; do
    case $opt in
    s ) do_sync_to_repos $OPTARG;;
    l ) do_sync_from_repos $OPTARG;;
    \?) echo "usage  [-s [repo]] [-l [repo]]"
        exit 1
    esac
done
