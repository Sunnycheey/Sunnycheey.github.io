#!/bin/bash
read -p "Are you sure build? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker run --rm \
    --volume="$PWD:/srv/jekyll" \
    -it myjekyll:1.1.0 \
    jekyll build
    # we also need replace the number of post in readme
    # the location of `number of post` is marked in the
    # format `NUM_OF_POSTS`
    file_number=$(ls _posts | wc -l)
    sed "s/NUM_OF_POSTS/$file_number/" README.md > README.md

fi
read -p "Are you sure commit " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git add .
    echo 'git add successfully!'
    git commit -m "$1"
    echo 'git commit successfully'
    git push
fi