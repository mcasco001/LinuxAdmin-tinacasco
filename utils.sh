#!/usr/bin/env bash

echo "utils just ran!"
alias ll="ls -laFh"
alias list="ls -laFh"
alias grep="grep --color=auto"

alias gh='history | grep' #List command history based on filter
alias df="df -h" #Display disk usage 
#Adds any changes on the main branch and commits, then push the update
alias gpush='git add . && git commit -m "Updated" && git push'
alias sutils="source utils.sh" #This will run the update on the utils.sh, instead of typing source utils.sh everytime
alias gpm="git pull origin main" #This will fetch and merge changes from the remote repo into local repo.


#function git-acp() {
#	git add .
#	git commit -m 'This was committed with git-acp'
#	echo "git push would've run now!"
#	#git push }

#This function will check if there is a commit message and return 1 if true
function git-acp() {
	if [ -z "$1" ]; then
		echo "Error: Type in a commit message!" #Print error message if there is no commit message
		return 1
	fi

#Staging changes
	git add . || return 2 #if git add fails, return 2 error
	git commit -m "$1" || return 2 #If there is a change, it will push the changes, otherwise it will return 2
	echo "git push would've run now!"
	git push && echo "Push successful" || (echo "Failed to push :(" && return 3)
	}

#Function to update and upgrade packages
function updateall() {
	sudo apt update && sudo apt upgrade -y
	}

#Function to check disk space

function check_disk_space() {
	THRESHOLD=80 #This will be the threshold that will trigger the warning in %

	USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//') #This is going to get the root usage
	if [ "$USAGE" -ge "$THRESHOLD" ]; then
		echo "Warning: Disk usage is at ${USAGE}%!"
		return 1 #This is the exit code for the High disk usage

	else

		echo "Disk usage is at ${USAGE}%. You're fine."
		return 0 #This will just return the disk usage value if not exceeding threshold.
	fi
}
