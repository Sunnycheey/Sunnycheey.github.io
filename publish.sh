#!/bin/bash

read -p "Are you sure commit? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git add .
    git commit -m $1
    git push
fi