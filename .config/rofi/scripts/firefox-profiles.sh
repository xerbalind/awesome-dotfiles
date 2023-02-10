#!/usr/bin/env bash
set -e 

#Based on: https://gist.github.com/fischejo/

#Some defaults
MOZILLA_CONFIG=~/.mozilla
FIREFOX='/usr/bin/env firefox'
COLOR="#ffa31a"

echo -en "\0markup-rows\x1ftrue\n"

NAMES=($(awk -F "=" '/Name/ {print $2}' $MOZILLA_CONFIG/firefox/profiles.ini | tr -d ' '))
if [ -z $ROFI_INFO ];then
    echo -en "\0prompt\x1fProfile\n"
    for name in "${NAMES[@]}"
    do
        echo -en "<span foreground='$COLOR'>$name</span> \0info\x1f$name\n"
    done
else
    PATHS=($(awk -F "=" '/Path/ {print $2}' $MOZILLA_CONFIG/firefox/profiles.ini | tr -d ' '))
    for i in "${!NAMES[@]}"; do
        if [[ "${NAMES[$i]}" = "${ROFI_INFO}" ]]; then
            $FIREFOX --new-instance --profile "$MOZILLA_CONFIG/firefox/${PATHS[$i]}" >/dev/null &
            exit
        fi
    done

    $FIREFOX --new-instance --ProfileManager >/dev/null &
fi
