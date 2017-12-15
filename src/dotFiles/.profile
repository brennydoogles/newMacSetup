#!/usr/bin/env bash

# Want to add some custom directories to your PATH? Add them to this array
customPathDirs=( "~/bin" )
# Loop through the directories and add them to the path if they exist
for pathDir in "${customPathDirs[@]}"
do
    dir=$(bash -c "echo $pathDir")
	if [ -f $dir ]; then
        PATH=$PATH:"$dir"
    fi
done
export PATH

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)