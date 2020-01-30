#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

# fonts
echo '- installing fonts...'
find . -name '*.otf' -o -name '*.ttf' -exec echo "cp -v {} ~/Library/Fonts/" \;



