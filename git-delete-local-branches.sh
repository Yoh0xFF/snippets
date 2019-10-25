#!/bin/sh

# Update information about deleted remote branches
git remote prune origin

# Delete all local branches without remote
git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
