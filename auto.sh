#!/bin/bash

git checkout master
git pull
echo "quel est le numero du billet tufin?"
read tufin
git checkout -b SC-$tufin
mkdir SC-$tufin
touch SC-$tufin/SC-$tufin.txt