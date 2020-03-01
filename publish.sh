#!/bin/bash
read -p "Are you sure build? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker run --rm \
    --volume="$PWD:/srv/jekyll" \
    -it myjekyll:1.1.0 \
    jekyll build
fi
read -p "Are you sure commit " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

    function myfunc()
    {
        printf "\'%s\'" "$1"
    }
    # define function which quote the command arg
    message=$(myfunc "$1")
    echo $message
    git add .
    echo 'git add successfully!'
    git commit -m $message
    echo 'git commit successfully'
    git push
fi