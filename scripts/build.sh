#!/usr/bin/env bash

set -e # exit with nonzero exit code if anything fails

rm -rf dist

# run the angular/ng-packagr build
npm run ng:build

# move/generate/update meta files into dist
gulp buildMeta

# generate ALL the documentation
mkdir dist/docs
npm run build-storybook
npm run docs:build && mv documentation dist/docs/
