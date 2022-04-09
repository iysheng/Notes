#!/bin/bash

set -e

REPOS=~/Public/telnet_32

do_push2repo()
{
	if [ $# -lt 1 ];then
		return -1
	fi
	cd $1;
	echo -e "ready push to \033[35;7m`pwd`\033[0m"
	REMOE_REPOS=`git remote -v |  awk '/(push)/ && /iysheng/ {print $1}' 2> /dev/null`
	if [ -n '$REMOE_REPOS' ];then
		for remote_repo in $REMOE_REPOS;do
			git push $remote_repo `git branch | awk '{print $2}'`;
			sleep 1;
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
	echo -e "ready pull from \033[35;7m`pwd`\033[0m"
	REMOE_REPOS=`git remote -v | awk '/(pull)|(fetch)/ && /iysheng/ {print $1}' 2> /dev/null`
	if [ -n '$REMOE_REPOS' ];then
		for remote_repo in $REMOE_REPOS;do
			git pull $remote_repo `git branch | awk '{print $2}'`;
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
        	do_push2repo $repo;
		else
			echo -e "invalid push repo:\033[31;7m$repo\033[0m"
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
        	do_pull_from_repo $repo;
		else
			echo -e "invalid pull repo:\033[31;7m$repo\033[0m"
    	fi
    done
}

# 默认 push 当前仓库到 repo
if [ $# -lt 1 ];then
    do_sync_to_repos `pwd`
	exit 0
fi

while getopts "s:l:dD" opt; do
    case $opt in
    s ) do_sync_to_repos $OPTARG;;
    l ) do_sync_from_repos $OPTARG;;
    d ) do_sync_to_repos;; # 默认就是尝试 push 默认仓库
    D ) do_sync_from_repos;; # 默认就是尝试 pull 默认仓库
    \?) echo "usage `basename $0` [-s [repo]] [-l [repo]]"
        exit 1
    esac
done
