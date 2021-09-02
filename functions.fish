# Git commands

function logs -d 'alias Nice looking log'
	command git log -80 --color --graph --pretty=format:"%C(red)%h%C(reset)%C(yellow)%d%Creset %s %C(green italic)(%cr)%C(reset) %C(blue)%an%C(reset) %C(white dim)%GK %C(reset)" --abbrev-commit | less -R
end

# Xclip commands
function copy -d 'alias Pipe output to clipboard'
	command xclip -selection clipboard
end

function paste -d 'alias Paste content from clipboard'
	command xclip -selection clipboard -o
end
