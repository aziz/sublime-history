#!/usr/bin/env bash

find . -type f -name *.dmg -exec 7z x \{\} \; > /dev/null 2>&1
cp -r ./Sublime\ Text/Sublime\ Text.app/Contents/ .
rm -Rf ./Sublime\ Text
rm *.dmg
cd Contents/MacOS/Packages
rename "s/.sublime-package/.zip/" *.sublime-package
find . -name "*.zip" | xargs -P 5 -I fileName sh -c 'unzip -o -d "$(dirname "fileName")/$(basename -s .zip "fileName")" "fileName"'
rm *.zip
cd ../../..
