#!/usr/bin/env bash

cd Contents/MacOS/Packages
rename "s/.sublime-package/.zip/" *.sublime-package
find . -name "*.zip" | xargs -P 5 -I fileName sh -c 'unzip -o -d "$(dirname "fileName")/$(basename -s .zip "fileName")" "fileName"'
rm *.zip
cd ../../..
