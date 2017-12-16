#!/bin/bash

# Discover the true location of our script:
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

dotFileDir="${DIR}/dotFiles"

dotFiles=( ".bash_prompt" ".bash_profile" ".bash_alias" ".bashrc" ".profile" ".bash_function" )
# Loop through the files and load them into the session if they exist
for dotFile in "${dotFiles[@]}"
do
    echo "Processing $dotFile"
    dfHome=$(bash -c "echo ~/$dotFile")
    dfHomeBak=$(bash -c "echo ${dfHome}_bak")
    dfTemplate=$(bash -c "echo ${dotFileDir}/${dotFile}")
    if [ -f ${dfHome} ]; then
        if [ -f ${dfTemplate} ]; then
            mv "$dfHome" "$dfHomeBak"
            command cp -f "$dfTemplate" "$dfHome"
        fi
    else
        if [ -f ${dfTemplate} ]; then
            command cp -f "$dfTemplate" "$dfHome"
        fi
    fi
done