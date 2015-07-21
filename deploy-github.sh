#!/bin/sh

SRC=~/work/samuelchen.github.io
SITE=${SRC}/public
ENV=~/work/hexo
BRANCH=hexo-pages
COMMENT=$1

# activate the virtual env
source ${ENV}/bin/activate

# enter src path
cd ${SRC}

# process the working branch
git checkout ${BRANCH}
git add .
git commit -m "${COMMENT}."
git push origin ${BRANCH}

# clean & generate
hexo clean
hexo generate

tmpath=/tmp/hexo-public.${RANDOM}
mv ${SITE} ${tmpath}

# process master branch (public site)
git checkout master
rm -rf ${SRC}/*
cp -r ${tmpath}/* .
git add .
git commit -m "${COMMENT}."
git push origin master

rm -rf ${tmpath}

git checkout ${BRANCH}

