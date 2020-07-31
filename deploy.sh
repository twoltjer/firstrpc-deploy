#!/bin/bash
set -e
git submodule update --init --recursive
pushd _site
git checkout master
git pull
popd
bundle exec jekyll build
cp -R Media _site
pushd _site
git add -A
git commit -m "Deploy script"
git push
popd