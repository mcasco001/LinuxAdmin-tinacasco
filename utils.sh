#! /usr/bin/env bash

echo "utils just ran!"
alias ll="ls -laFh"
alias list="ls -laFh"
alias grep="grep --color=auto"

alias gh='history | grep' #List command history based on filter
alias df="df -h" #Display disk usage 
#Adds any changes on the main branch and commits, then push the update
alias gpush='git add . && git commit -m "Updated" && git push'
alias sutils="source utils.sh" #This will run the update on the utils.sh, instead of typing source utils.sh everytime


#function git-acp() {
#	git add .
#	git commit -m 'This was committed with git-acp'
#	echo "git push would've run now!"
#	#git push }

function git-acp() {
	if [-z "$1"]; then
		echo "Error: Type in a commit message!"
		return 1
	fi
	git add .
	git commit -m "$1" || return 3
	echo "git push would've run now!"
	git push && echo "Push successful" || (echo "Failed to push :(" && return 3)
	}
