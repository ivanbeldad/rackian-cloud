#!/bin/bash

# configure git name and email
git config --global user.name "Travis CI"
git config --global user.email "ivandelabeldad@gmail.com"

# add git repository and pull all branches
mkdir rackian-cloud && cd rackian-cloud
git init
git remote add origin https://ivandelabeldad:$GITHUB_TOKEN@github.com/ivandelabeldad/rackian-cloud.git
git pull --all
git checkout master

# update gh_pages with master changes
git checkout gh-pages
git merge master -m "merge master into gh-pages"

# ensure repo folder exists
mkdir repo -p
# create new package version
helm package . -d repo --version $TRAVIS_TAG
# update repo
helm repo index repo

# commit changes
git add repo/*
git commit -m "release new version: $TRAVIS_TAG"
git push github gh-pages
