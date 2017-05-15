#!/bin/bash

#On branch alpha
cur=`git status | head -1 | cut -d" " -f3`
if [ $cur == alpha ] ; then
    release=prebeta
    if [ ! -z "$1" ] ; then
	release=$1
    fi

    found=0
    for br in cloud prebeta beta master
    do
	if [ $found -eq 1 ] ; then
	    break
	fi
	if [ $br == $release ] ; then
	    found=1
	fi
	git checkout $br
	git pull
	git merge alpha --no-ff -m "merge alpha into $br. target branch - $release"
    done
else
    echo Wrong current branch - $cur
fi
