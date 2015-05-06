#! /bin/bash
result=$(tns platform list | grep 'Installed platforms.*ios');
if [[ "$result" == "" ]]; then
    tns platform add ios
fi

tns run ios --emulator
