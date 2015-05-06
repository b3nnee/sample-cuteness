#! /bin/bash


npmresult=$(npm list-g | grep 'nativescript@');
if [[ "$npmresult" == "" ]]; then
    npm install -g nativescript
fi

unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]]; then
    iosresult=$(tns platform list | grep 'Installed platforms.*ios');
    if [[ "$iosresult" == "" ]]; then
        tns platform add ios
    fi
    tns run ios --emulator
else
    androidresult=$(tns platform list | grep 'Installed platforms.*android');
    if [[ "$androidresult" == "" ]]; then
        tns platform add android
    fi
    tns run android --emulator
fi

