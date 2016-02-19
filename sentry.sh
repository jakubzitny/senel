#!/bin/bash
# https://goo.gl/JHfD1G

webpack --config webpack.js.coffee

apiKey=e5075c5a21194fb7b304d08ead0d7fbd
urlBase=https://sentry.avcd.cz/api/0/projects/avocode/
urlBase=https://app.getsentry.com/api/0/projects/avocode/
projectSlug=test/
releasesEndpoint=$urlBase$projectSlug"releases/"

version=`grep version package.json | sed 's/\"//g;s/://g;s/\ //g;s/version//g;s/,//g'`

curl $releasesEndpoint \
  -u $apiKey: \
  -X POST \
  -d "{\"version\": \"$version\"}" \
  -H 'Content-Type: application/json'

releaseId=$version

releaseFileEndpoint=$releasesEndpoint$releaseId"/files/"

curl $releaseFileEndpoint \
  -u $apiKey: \
  -X POST \
  -F file=@app.js.map \
  -F name="/Volumes/Data/Documents/Avocode/repos/bordel/senel/app.js.map"

curl $releaseFileEndpoint \
  -u $apiKey: \
  -X POST \
  -F file=@app.js \
  -F name="/Volumes/Data/Documents/Avocode/repos/bordel/senel/app.js"
