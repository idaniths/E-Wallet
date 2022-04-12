#!/usr/bin/env sh

set -env
npm run build
cd dist 
git init
git add -A
git commit -m 'new deployment'
git push -f git@github.com:idaniths/e-wallet.git main:gh-pages
cd -
