#!/bin/zsh
# This ZSH plugin reads the text from the current buffer 
create_completion() {
    # Get the text typed until now.
    text=${BUFFER}
    completion=$(echo -n "$text" | $ZSH_CUSTOM/plugins/zsh_copilot/create_completion.py $CURSOR)
    #pipe completion into test.txt
    #call same with sudo
    text_before_cursor=${text:0:$CURSOR}
    text_after_cursor=${text:$CURSOR}
    # Add completion to the current buffer.
    #BUFFER="${text}${completion}"
    BUFFER="${text_before_cursor}${completion}${text_after_cursor}"
    prefix_and_completion="${text_before_cursor}${completion}"
    # Put the cursor at the end of the completion
    CURSOR=${#prefix_and_completion}
}

# Bind the create_completion function to a key.
zle -N create_completion

#what still can be wrong perhaps is the shebang header. even when the header worked already in my home directory? 
#in the end it is again a problem with some trivial thing - should check that in github..?

#can check if i can pipe the current input into a txt file