#!/bin/bash

# Want to add some new files to be automatically loaded if they exist? Add them to this array
loadFiles=( "~/.bash_prompt" "~/.bash_alias" "~/.bashrc"  "~/.bash_function" "~/.java_profile" "~.go_profile" "~/.profile" )
# Loop through the files and load them into the session if they exist
for loadFile in "${loadFiles[@]}"
do
    file=$(bash -c "echo $loadFile")
	if [ -f $file ]; then
        source $file
    fi
done
