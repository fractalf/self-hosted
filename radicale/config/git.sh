#!/bin/sh
cd /data/collections

if [ ! -d .git ]; then
    git init
    git config user.name "$GIT_NAME"
    git config user.email "$GIT_EMAIL"
    echo -e ".Radicale.cache\n.Radicale.lock\n.Radicale.props\n.Radicale.tmp-*" > .gitignore
fi

git add -A
git diff --cached --quiet || git commit -m "Update"

