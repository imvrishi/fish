# Alias's for SSH
# alias SERVERNAME='ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'

# Alias's to change the directory
alias web='cd /var/www/html'

# Alias's to mount ISO files
# mount -o loop /home/NAMEOFISO.iso /home/ISOMOUNTDIR/
# umount /home/NAMEOFISO.iso
# (Both commands done as root only.)

# SSH
alias ssh2kafka='ssh rishikesh.v@10.140.15.199'

# Basic edit and copy
alias ebrc='code ~/.bashrc'
alias cbrc='cat ~/.bashrc | copy'
alias eba='code ~/.bash_aliases'
alias cba='cat ~/.bash_aliases | copy'
alias cssh='cat ~/.ssh/id_rsa.pub | copy'

# Show help for this .bashrc file
alias hlp='less ~/.bashrc_help'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias diff='colordiff'
alias mount='mount | column -t'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ports='netstat -ano | grep LISTENING'
alias cls='clear'
alias c='cls'
alias rm='sudo trash'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias multitail='multitail --no-repeat -c'

# Change directory aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .1=..
alias .2=...
alias .3=....
alias .4=.....
alias .5=......

# Alias's for multiple directory listing commands
alias ls='ls -AFh --color=always' # add colors and file type extensions
alias lx='ls -lXB' # sort by extension
alias lk='ls -lSr' # sort by size
alias lc='ls -lcr' # sort by change time
alias lu='ls -lur' # sort by access time
alias lr='ls -lR' # recursive ls
alias lt='ls -ltr' # sort by date
alias lm='ls -l | more' # pipe through 'more'
alias lw='ls -x' # wide listing format
alias ll='ls -ls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only
alias l.='ls -d .*'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias l='ls | grep'

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h='history | grep'

# Search running processes
alias p='ps aux | grep'
alias topcpu="ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f='find . | grep'

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's to show disk space and space used in a folder
alias diskspace='du -S | sort -n -r | less'
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# SHA1
alias sha1='openssl sha1'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# clip
alias copy='xclip -sel clip'
alias paste='xclip -sel clip -o'

# ovpn
alias ovpn='sudo openvpn --config ~/client.ovpn'

# boot
alias boot2bios='systemctl reboot --firmware-setup'

# git
alias g='git'
alias ga='g add'
alias gc='g commit --verbose -m'
alias gcam='g commit --amend -C HEAD'
alias gac='ga . && gc'
alias gs='g status'
alias gss='gs -s'
alias glog='g log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
alias ghist='g log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias gb="g for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
alias gp='g pull'
alias gpf='g reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
alias gpp='gp && g push'
alias gff='g flow feature'
alias gffs='gff start'
alias gfff='gff finish --push --keepremote --no-ff'
alias rao='g remote add origin'
alias guc='g reset --soft HEAD~1'
alias gcm='g branch --merged | grep -v \"\\*\" | xargs -n 1 g branch -d'
alias gsw='g switch'
alias gswm='gsw master'
alias gsws='gsw sandbox'
alias gst='g stash'
alias gstp='gst pop'
alias gstl='gst list'
alias grl='g ref log'
alias gdf='g diff --name-only'

# apt
apt ()
{
	case $1 in
		install) sudo apt install -y --install-recommends ${@:2} ;;
		*) sudo apt ${@:1} ;;
	esac
}

# remove dangling links
rdln ()
{
  for i in `path`; do
    if [ -d "$i" ]; then
      for j in `find $i -maxdepth 1 -xtype l`; do
        echo $j
        rm -f $j
      done
    fi
  done
}

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   sudo tar xvjf $archive    ;;
				*.tar.gz)    sudo tar xvzf $archive    ;;
				*.bz2)       sudo bunzip2 $archive     ;;
				*.rar)       sudo rar x $archive       ;;
				*.gz)        sudo gunzip $archive      ;;
				*.tar)       sudo tar xvf $archive     ;;
				*.tbz2)      sudo tar xvjf $archive    ;;
				*.tgz)       sudo tar xvzf $archive    ;;
				*.zip)       sudo unzip $archive       ;;
				*.Z)         sudo uncompress $archive  ;;
				*.7z)        sudo 7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Searches for text in all files in the current folder
ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp()
{
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Copy and go to the directory
cpg ()
{
	if [ -d "$2" ];then
		cp $1 $2 && cd $2
	else
		cp $1 $2
	fi
}

# Move and go to the directory
mvg ()
{
	if [ -d "$2" ];then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
}

# Create and go to the directory
mkdirg ()
{
	mkdir -p $1
	cd $1
}

# Goes up a specified number of directories  (i.e. up 4)
up ()
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

#Automatically do an ls after each cd
cdl ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

# Returns the last 2 fields of the working directory
pwdtail ()
{
	pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Automatically install the needed support files for this .bashrc file
setup_system ()
{
	apt update
	apt upgrade -y
	sudo add-apt-repository -y ppa:gerardpuig/ppa
	apt i preload multitail tree colordiff net-tools curl trash-cli tilix
	apt i cowsay fortune lolcat ncdu ranger sl xsnow bsdgames
	apt i gnome-tweak-tool flatpak gnome-software-plugin-flatpak
	apt i openjdk-17-jdk ubuntu-cleaner
	apt i gufw tlp tlp-rdw
	apt i rar unrar p7zip-full p7zip-rar
	apt i ubuntu-restricted-extras
	apt i vlc libdvd-pkg
	apt i redis git git-flow
	apt i cpu-checker
	apt i qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager
	apt i clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
  apt i gcc g++ make cmake
	wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
	sudo ufw enable
	sudo systemctl enable tlp
	flatpak remote-add --if-not-exists flathub https://flathub-org/repo/flathub.flatpakrepo

	curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
	apt i nodejs
	curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
	echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	apt update
	apt i yarn
	yarn global add typescript @nestjs/cli 0x autocannon nodemon pm2 expo-cli
	yarn global bin
	yarn config get prefix
	yarn config set prefix ~/.yarn
	[[ -d "$HOME/.yarn/bin" && ! "$PATH" =~ "$HOME/.yarn/bin" ]] && PATH="$HOME/.yarn/bin:$PATH"
	# gnome-extensions espresso simple-net-speed
	# install dbeaver vscode slack meld android-studio flutter image-optimizer
	egrep -c '(vmx|svm)' /proc/cpuinfo
	kvm-ok
	flutter config --enable-linux-desktop
	[[ -d "/opt/flutter/bin" && ! "$PATH" =~ "/opt/flutter/bin" ]] && PATH="/opt/flutter/bin:$PATH"
}

# Show current network information
netinfo ()
{
	echo "--------------- Network Information ---------------"
	echo "Local IP"
	ifconfig | awk /'inet / {print $2}'
	echo ""
	echo "Broadcast"
	ifconfig | awk /'broadcast/ {print $6}'
	echo ""
	echo "Mask"
	ifconfig | awk /'inet / {print $4}'
	echo "---------------------------------------------------"
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
	# Dumps a list of all IP addresses for every device
	# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

	# Internal IP Lookup
	echo -n "Internal IP: " ; ifconfig wlp0s20f3 | awk /'inet / {print $2}'

	# External IP Lookup
	# curl icanhazip.com
	# curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g'
	# curl ifconfig.me
	echo -n "External IP: " ; curl icanhazip.com
}

# View Apache logs
apachelog ()
{
	if [ -f /etc/httpd/conf/httpd.conf ]; then
		cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
	else
		cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
	fi
}

# Edit the Apache configuration
apacheconfig ()
{
	if [ -f /etc/httpd/conf/httpd.conf ]; then
		sedit /etc/httpd/conf/httpd.conf
	elif [ -f /etc/apache2/apache2.conf ]; then
		sedit /etc/apache2/apache2.conf
	else
		echo "Error: Apache config file could not be found."
		echo "Searching for possible locations:"
		sudo updatedb && locate httpd.conf && locate apache2.conf
	fi
}

# Edit the PHP configuration file
phpconfig ()
{
	if [ -f /etc/php.ini ]; then
		sedit /etc/php.ini
	elif [ -f /etc/php/php.ini ]; then
		sedit /etc/php/php.ini
	elif [ -f /etc/php5/php.ini ]; then
		sedit /etc/php5/php.ini
	elif [ -f /usr/bin/php5/bin/php.ini ]; then
		sedit /usr/bin/php5/bin/php.ini
	elif [ -f /etc/php5/apache2/php.ini ]; then
		sedit /etc/php5/apache2/php.ini
	else
		echo "Error: php.ini file could not be found."
		echo "Searching for possible locations:"
		sudo updatedb && locate php.ini
	fi
}

# Edit the MySQL configuration file
mysqlconfig ()
{
	if [ -f /etc/my.cnf ]; then
		sedit /etc/my.cnf
	elif [ -f /etc/mysql/my.cnf ]; then
		sedit /etc/mysql/my.cnf
	elif [ -f /usr/local/etc/my.cnf ]; then
		sedit /usr/local/etc/my.cnf
	elif [ -f /usr/bin/mysql/my.cnf ]; then
		sedit /usr/bin/mysql/my.cnf
	elif [ -f ~/my.cnf ]; then
		sedit ~/my.cnf
	elif [ -f ~/.my.cnf ]; then
		sedit ~/.my.cnf
	else
		echo "Error: my.cnf file could not be found."
		echo "Searching for possible locations:"
		sudo updatedb && locate my.cnf
	fi
}

# For some reason, rot13 pops up everywhere
rot13 () {
	if [ $# -eq 0 ]; then
		tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	else
		echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	fi
}

# Trim leading and trailing spaces (for scripts)
trim()
{
	local var=$@
	var="${var#"${var%%[![:space:]]*}"}"  # remove leading whitespace characters
	var="${var%"${var##*[![:space:]]}"}"  # remove trailing whitespace characters
	echo -n "$var"
}

#######################################################
# Set the ultimate amazing command prompt
#######################################################
alias cpu="grep 'cpu ' /proc/stat | awk '{printf(\"%.1f\n\", (\$2+\$4)*100/(\$2+\$4+\$5))}'"
function __setprompt
{
	local LAST_COMMAND=$? # Must come first!

	# Define colors
	local LIGHTGRAY="\033[0;37m"
	local WHITE="\033[1;37m"
	local BLACK="\033[0;30m"
	local DARKGRAY="\033[1;30m"
	local RED="\033[0;31m"
	local LIGHTRED="\033[1;31m"
	local GREEN="\033[0;32m"
	local LIGHTGREEN="\033[1;32m"
	local BROWN="\033[0;33m"
	local YELLOW="\033[1;33m"
	local BLUE="\033[0;34m"
	local LIGHTBLUE="\033[1;34m"
	local MAGENTA="\033[0;35m"
	local LIGHTMAGENTA="\033[1;35m"
	local CYAN="\033[0;36m"
	local LIGHTCYAN="\033[1;36m"
	local NOCOLOR="\033[0m"

	# Show error exit code if there is one
	if [[ $LAST_COMMAND != 0 ]]; then
		# PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
		PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
		if [[ $LAST_COMMAND == 1 ]]; then
			PS1+="General error"
		elif [ $LAST_COMMAND == 2 ]; then
			PS1+="Missing keyword, command, or permission problem"
		elif [ $LAST_COMMAND == 126 ]; then
			PS1+="Permission problem or command is not an executable"
		elif [ $LAST_COMMAND == 127 ]; then
			PS1+="Command not found"
		elif [ $LAST_COMMAND == 128 ]; then
			PS1+="Invalid argument to exit"
		elif [ $LAST_COMMAND == 129 ]; then
			PS1+="Fatal error signal 1"
		elif [ $LAST_COMMAND == 130 ]; then
			PS1+="Script terminated by Control-C"
		elif [ $LAST_COMMAND == 131 ]; then
			PS1+="Fatal error signal 3"
		elif [ $LAST_COMMAND == 132 ]; then
			PS1+="Fatal error signal 4"
		elif [ $LAST_COMMAND == 133 ]; then
			PS1+="Fatal error signal 5"
		elif [ $LAST_COMMAND == 134 ]; then
			PS1+="Fatal error signal 6"
		elif [ $LAST_COMMAND == 135 ]; then
			PS1+="Fatal error signal 7"
		elif [ $LAST_COMMAND == 136 ]; then
			PS1+="Fatal error signal 8"
		elif [ $LAST_COMMAND == 137 ]; then
			PS1+="Fatal error signal 9"
		elif [ $LAST_COMMAND -gt 255 ]; then
			PS1+="Exit status out of range"
		else
			PS1+="Unknown error code"
		fi
		PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
	else
		PS1=""
	fi

	# Date
	# PS1+="\[${DARKGRAY}\](\[${CYAN}\]\$(date +%a) $(date +%b-'%-m')" # Date
	# PS1+="${BLUE} $(date +'%-I':%M:%S%P)\[${DARKGRAY}\])-" # Time

	# CPU
	PS1+="\[${DARKGRAY}\](\[${MAGENTA}\]$(cpu)%\[${DARKGRAY}\]:"

	# Jobs
	PS1+="\[${MAGENTA}\]\j\[${DARKGRAY}\]:"

	# Network Connections (for a server - comment out for non-server)
	PS1+="\[${MAGENTA}\]$(awk 'END {print NR}' /proc/net/tcp)\[${DARKGRAY}\]:"

	# PS1+="\[${DARKGRAY}\])-"

	# User and server
	# local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
	# local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
	# if [ $SSH2_IP ] || [ $SSH_IP ] ; then
	# 	PS1+="(\[${RED}\]\u@\h"
	# else
	# 	PS1+="(\[${RED}\]\u"
	# fi

	# Total size of files in current directory
	# PS1+="("
	PS1+="\[${GREEN}\]$(ls -l | grep -m 1 total | cut -d ' ' -f 2)\[${DARKGRAY}\]:"

	# Number of files
	PS1+="\[${GREEN}\]\$(ls -1 | wc -l)\[${DARKGRAY}\])"

	# Current directory
	PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${DARKGRAY}\]"

	# Skip to the next line
	# PS1+="\n"

	if [[ $EUID -ne 0 ]]; then
		PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
	else
		PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
	fi

	# PS2 is used to continue a command using the \ character
	PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

	# PS3 is used to enter a number choice in a script
	PS3='Please enter a number from above list: '

	# PS4 is used for tracing a script in debug mode
	PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
PROMPT_COMMAND='__setprompt'
