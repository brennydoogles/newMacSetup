#!/bin/bash

# Want to add some custom directories to your PATH? Add them to this array
customPathDirs=( "/usr/local/share/python" "~/bin" "~/.rvm/bin" )
# Loop through the directories and add them to the path if they exist
for pathDir in "${customPathDirs[@]}"
do
    dir=$(bash -c "echo $pathDir")
	if [ -f $dir ]; then
        PATH="$dir":$PATH
    fi
done
export PATH

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export M2_HOME=$(brew --prefix maven)/libexec
export M2=$M2_HOME/bin
eval $(/usr/libexec/path_helper -s)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
