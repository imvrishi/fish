# Git commands

## Branching
function current -d "Get current branch name"
	command git branch --show-current
end

function branch -d 'Switch to branch'
	set len (count $argv)

	if test $len -eq 0
		command git branch -a
		return
	end

	set opts 0

	for v in $argv
		switch $v
			case -\*
				set opts 1
			case '*'
				set name $v
		end
	end

	if test $opts -eq 1
		command git branch $argv
		return
	end

	set local (count (git branch --list "$name"))
	set remote (count (git branch -r --list "origin/$name"))
	set total (math $local + $remote)

	if test $total -gt 0
		command git checkout $name
	else
		command git checkout -b $name
	end
end

function feature -d 'Switch to feature branch'
	set len (count $argv)

	if test $len -eq 0
		echo "No argument given, needs branch name"
		return
	end

	set name $argv[1]
	set feature_name "feature/$name"

	branch $feature_name
end

function finish -d 'Finishes the current feature'
	set name (current)

	switch $name
		case "feature/*"
			pull
			push -u
			branch master
			merge $name
			branch -D $name
	end
end

function master -d 'Checkout to master'
	branch master
end

# Viewing current directories changes
function state -d 'Check branch status'
	command git status -sb $argv
end

function show -d 'Show summary'
	command git show --compact-summary --patch HEAD
end

function logs -d 'Nice looking log'
	command git log -80 --color --graph --pretty=format:"%C(red)%h%C(reset)%C(yellow)%d%Creset %s %C(green italic)(%cr)%C(reset) %C(blue)%an%C(reset) %C(white dim)%GK %C(reset)" --abbrev-commit | less -R
end

## Change in working directory
function unstage -d 'Unstage all changes'
	command git reset $argv
end

function stage -d 'Stage all changes'
	argparse u/unstage -- $argv
	or return

	if set -q _flag_unstage
		unstage
	else
	  command git add -A
	end
end

function undo -d 'Remove your changes from current branch'
	command git checkout -- .
end

function unstash -d 'Move changes from stash'
	command git stash pop
end

function stash -d 'Move changes to stash'
	argparse u/unstash -- $argv
	or return

	if set -q _flag_unstash
		unstash
	else
	  command git stash
	end
end

function commit -d 'Commit changes'
	command git commit $argv
end

function commit-all -d 'Stage and commit changes'
	stage
	commit
end

function amend -d 'Add changes to previous commit'
	commit --amend $argv
end

function amend-all -d 'Stage and add changes to previous commit'
	stage
	amend
end

function save -d 'Create a save point'
	stage
	commit -m ":WIP: save point"
end

function merge -d 'Merge branch to current'
	command git merge $argv
end

function clean -d 'Reset working directory to previous commit'
	command git clean -fdx
end

function untracked -d 'List untracked files'
	command git clean --dry-run -dx
end

function upstream -d 'Stage, commit and push'
	commit-all
	done
end

function unassume -d 'Touch these changes'
	command git update-index --no-assume-unchanged $argv
end

function assume -d 'Dont touch these changes'
	argparse n/unassume -- $argv
	or return

	if set -q _flag_unassume
		unassume $argv
	else
	  command git update-index --assume-unchanged $argv
	end
end

## Fetching
function clone -d 'Clone repo'
	command git clone $argv
end

function fetch -d 'Fetch remote changes'
	command git fetch $argv
end

function pull -d 'Pull changes from remote'
	command git pull origin (current) $argv
end

function push -d 'Push changes to remote'
	command git push origin (current) $argv
end

function done -d 'Pull and push'
	pull
	push
end

# Xclip commands
function copy -d 'Pipe output to clipboard'
	command xclip -selection clipboard
end

function paste -d 'Paste content from clipboard'
	command xclip -selection clipboard -o
end
