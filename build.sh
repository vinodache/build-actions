#!/bin/bash -e

if ! type fastlane > /dev/null 2>&1; then
  if type brew > /dev/null 2>&1; then
    brew install fastlane
  else
    sudo gem install fastlane -NV
  fi
fi

script_path=$(cd $(dirname ${0}); pwd)
cp -r ${script_path}/fastlane ./
echo "Current directory `pwd`"
fastlane export_ipa
echo "Current directory `pwd`"
fastlane pilot upload