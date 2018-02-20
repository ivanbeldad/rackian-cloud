#!/bin/bash

# if travis environment go to build dir
if [ -n "$TRAVIS_BUILD_DIR" ]; then
  cd $TRAVIS_BUILD_DIR
fi

# initialize helm
helm init --client-only

# add git repository and configure
git remote add origin https://ivandelabeldad:$GITHUB_TOKEN@github.com/ivandelabeldad/rackian-cloud
git config --global user.name "Ivan de la Beldad Fernandez"
git config --global user.email "ivandelabeldad@gmail.com"

# pull branches and update gh_pages with master changes
git pull --all
git checkout gh_pages
git merge master -m "merge master into gh_pages"

# ensure repo folder exists
mkdir repo -p
# create new package version
helm package . -d repo --version $TRAVIS_TAG
# update repo
helm repo index repo

# commit changes
git add .
git commit -m "release new version $TRAVIS_TAG"
