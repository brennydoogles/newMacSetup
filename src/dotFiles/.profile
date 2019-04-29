#!/bin/bash

# Want to add some custom directories to your PATH? Add them to this array
customPathDirs=( "/usr/local/share/python" "~/bin" "~/.rvm/bin" "/Users/brendondugan/Library/Android/sdk/platform-tools" )
# Loop through the directories and add them to the path if they exist
for pathDir in "${customPathDirs[@]}"
do
    dir=$(bash -c "echo $pathDir")
	if [ -d $dir ]; then
        PATH="$dir":$PATH
    fi
done
export PATH


eval $(/usr/libexec/path_helper -s)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
