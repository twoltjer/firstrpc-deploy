#!/bin/bash
set -e
git submodule update --init --recursive
pushd _site
git checkout master
popd
bundle exec jekyll build
cp -R Media _site
rm _site/README.md
cp -R deploy-conf-files/* _site
pushd _site
git add -A
git commit -m "Deploy script"
git push
popd