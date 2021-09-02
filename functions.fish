# Git commands

function logs -d 'alias Nice looking log'
	command git log -80 --color --graph --pretty=format:"%C(red)%h%C(reset)%C(yellow)%d%Creset %s %C(green italic)(%cr)%C(reset) %C(blue)%an%C(reset) %C(white dim)%GK %C(reset)" --abbrev-commit | less -R
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
