# Git commands

## Branching
function current -d "alias Get current branch name"
	command git branch --show-current
end

function branch -d 'alias List or Switch to branch'
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
		command git switch $name
	else
		command git branch $name
		command git switch $name
	end
end

function feature -d 'alias Switch to feature branch'
	set len (count $argv)

	if test $len -eq 0
		echo "No argument given, needs branch name"
		return
	end

	set name $argv[1]
	set feature_name "feature/$name"

	branch $feature_name
end

function finish -d 'alias Finishes the current feature'
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

function master -d 'alias Checkout to master'
	branch master
end

function sandbox -d 'alias Checkout to sandbox'
	branch sandbox
end

function Sandbox -d 'alias Checkout to Sandbox'
	branch Sandbox
end

function development -d 'alias Checkout to development'
	branch development
end

function Development -d 'alias Checkout to Development'
	branch Development
end

function production -d 'alias Checkout to production'
	branch production
end

function Production -d 'alias Checkout to Production'
	branch Production
end

# Viewing current directories changes
function state -d 'alias Check branch status'
	command git status -sb $argv
end

function show -d 'alias Show summary'
	command git show --compact-summary --patch HEAD
end

function logs -d 'alias Nice looking log'
	command git log -80 --color --graph --pretty=format:"%C(red)%h%C(reset)%C(yellow)%d%Creset %s %C(green italic)(%cr)%C(reset) %C(blue)%an%C(reset) %C(white dim)%GK %C(reset)" --abbrev-commit | less -R
end

## Change in working directory
function unstage -d 'alias Unstage all changes'
	command git reset $argv
end

function stage -d 'alias Stage all changes'
	argparse u/unstage -- $argv
	or return

	if set -q _flag_unstage
		unstage
	else
	  command git add -A
	end
end

function undo -d 'alias Remove your changes from current branch'
	command git checkout -- .
end

function unstash -d 'alias Move changes from stash'
	command git stash pop
end

function stash -d 'alias Move changes to stash'
	argparse u/unstash -- $argv
	or return

	if set -q _flag_unstash
		unstash
	else
	  command git stash
	end
end

function commit -d 'alias Commit changes'
	command git commit $argv
end

function commit-all -d 'alias Stage and commit changes'
	stage
	commit
end

function amend -d 'alias Add changes to previous commit'
	commit --amend $argv
end

function amend-all -d 'alias Stage and add changes to previous commit'
	stage
	amend
end

function save -d 'alias Create a save point'
	stage
	commit -m ":WIP: save point"
end

function merge -d 'alias Merge branch to current'
	command git merge $argv
end

function clean -d 'alias Reset working directory to previous commit'
	command git clean -fdX
end

function untracked -d 'alias List untracked files'
	command git clean --dry-run -dX
end

function upstream -d 'alias Stage, commit and push'
	commit-all
	done
end

function unassume -d 'alias Touch these changes'
	command git update-index --no-assume-unchanged $argv
end

function assume -d 'alias Dont touch these changes'
	argparse n/unassume -- $argv
	or return

	if set -q _flag_unassume
		unassume $argv
	else
	  command git update-index --assume-unchanged $argv
	end
end

## Fetching
function clone -d 'alias Clone repo'
	command git clone $argv
end

function fetch -d 'alias Fetch remote changes'
	command git fetch $argv
end

function pull -d 'alias Pull changes from remote'
	command git pull origin (current) $argv
end

function push -d 'alias Push changes to remote'
	command git push origin (current) $argv
end

function done -d 'alias Pull and push'
	pull
	push
end

# Xclip commands
function copy -d 'alias Pipe output to clipboard'
	command xclip -selection clipboard
end

function paste -d 'alias Paste content from clipboard'
	command xclip -selection clipboard -o
end
