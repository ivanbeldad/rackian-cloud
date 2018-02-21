#!/bin/bash

# if travis environment go to build dir
if [ -n "$TRAVIS_BUILD_DIR" ]; then
  cd $TRAVIS_BUILD_DIR
fi

# add git repository and configure
git remote add github https://ivandelabeldad:$GITHUB_TOKEN@github.com/ivandelabeldad/rackian-cloud
git config --global user.name "Ivan de la Beldad Fernandez"
git config --global user.email "ivandelabeldad@gmail.com"

# update gh_pages with master changes
git checkout gh_pages
git merge master -m "merge master into gh_pages"

# ensure repo folder exists
mkdir repo -p
# create new package version
helm package . -d repo --version $TRAVIS_TAG
# update repo
helm repo index repo

# commit changes
git add repo/*
git commit -m "release new version $TRAVIS_TAG"
git push github gh_pages
