#!/bin/bash

cp ~/.bash_profile ~/.vimrc .
git add .
git commit -m '"'`date`'"'
git push
