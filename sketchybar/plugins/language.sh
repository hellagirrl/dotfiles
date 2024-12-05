#!/bin/bash

# For this script to run you need to install jq to convert plist to JSON

LANG=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | \
       plutil -convert json -o - - | \
       jq -r '.[] | select(.InputSourceKind == "Keyboard Layout") | ."KeyboardLayout Name"')

echo "$LANG"

if [ -z "$LANG" ]; then
  LANG="?"
fi

case $LANG in
  "U.S.") ICON="A" ;;
  "RussianWin") ICON="Р" ;;
esac

sketchybar --set "$NAME" icon="$ICON"
