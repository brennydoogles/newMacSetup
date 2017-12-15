#!/usr/bin/env bash
# Want to add some bash_completion files? Add them to this array
bashCompletionFiles=( "/etc/bash_completion" "$(brew --prefix)/etc/bash_completion" )
# Loop through the files and load them into the session if they exist
for completionFile in "${bashCompletionFiles[@]}"
do
    file=$(bash -c "echo $completionFile")
	if [ -f $file ]; then
        source $file
    fi
done

#   Change Prompt
#   ------------------------------------------------------------
    export PS1="________________________________________________________________________________\n| \w @ \h (\u) \n| => "
    export PS2="| => "

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR=/usr/bin/nano

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k