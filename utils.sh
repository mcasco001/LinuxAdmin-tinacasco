#! /usr/bin/env bash

echo "utils just ran!"
alias list="ls -laFh"
alias grep="grep --color=auto"

alias gh='history | grep' #List command history based on filter
alias df="df -h" #Display disk usage
 
#Adds any changes on the main branch and commits, then push the update
alias gpush='git add . && git commit -m "Updated" && git push'

function git-acp() {
	git add .
	git commit -m 'This was committed with git-acp'
	echo "git push would've run now!"
	#git push

}
