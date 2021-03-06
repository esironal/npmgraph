#!/usr/bin/env bash

set -e

HOST=`hostname`

if [ $HOST != "francis-lewis" ]; then
  echo "Invalid host"
  exit 0
fi

git fetch
git reset --hard origin/master

VERSION=$(grep -oP '(?<="version": ")[^"]+' < package.json)
echo "Setting APP_VERSION=${VERSION}"
sed --in-place -e "s/APP_VERSION/${VERSION}/" index.html
