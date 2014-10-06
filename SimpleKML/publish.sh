#!/bin/sh

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  cp -R build/repo $HOME/repo
  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/st3fan/ivy.git gh-pages > /dev/null
  cd gh-pages
  cp -Rf $HOME/repo/* .
  git add -f .
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to gh-pages"
  git push -fq origin gh-pages > /dev/null
fi

