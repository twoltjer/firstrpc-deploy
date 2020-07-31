#!/bin/bash
set -e

# Clone deploy repository
rm -rf deploy
git clone git@github.com:twtduck/firstrpc-deploy deploy

# Hard reset with every deployment
mv deploy/.git deploygit
rm -rf deploy
mkdir deploy 
mv deploygit deploy/.git

# Perform a full build
bundle exec jekyll clean
bundle exec jekyll build

# Copy site files to deploy
cp -R _site/* deploy
cp -R Media deploy
rm deploy/README.md
cp -R deploy-conf-files/* deploy
pushd deploy
git add -A
git commit -m "Deploy $(date)"
git push
popd