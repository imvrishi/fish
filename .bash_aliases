# ls
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -alh --color=auto'
alias la='ls -A --color=auto'
alias l.='ls -d .* --color=auto'
alias l='ls -CF --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# cd
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

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias sha1='openssl sha1'
# install  colordiff package :)
alias diff='colordiff'
alias mount='mount | column -t'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ports='netstat -ano | grep LISTENING'
alias c='clear'
#alias shutdown='shutdown /s /t 0'
#alias reboot='shutdown /r /t 0'
alias rm='rm -rfI --preserve-root'
#alias ram='wmic MEMORYCHIP get BankLabel, DeviceLocator, MemoryType, TypeDetail, Capacity, Speed'
#alias free='systeminfo | grep Memory'
alias df='df -h'
alias du='du -ch'
# alias r='$(fc -ln -1)'

# clip
alias copy='xclip -sel clip'
alias paste='xclip -sel clip -o'

# ovpn
alias ovpn='sudo openvpn --config ~/client.ovpn'

# boot
alias boot2bios='systemctl reboot --firmware-setup'
alias add2boot='sudo chmod 755 $1 && sudo update-rc.d $1 defaults'
alias remove2boot='sudo update-rc.d -f $1 remove'

# apt
alias add='sudo apt install --install-recommemds -y'
alias remove='sudo apt purge -y'
alias clean='sudo apt autoclean && sudo apt autoremove && sudo apt clean'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade -y'

# git
alias gc='git add . && git commit -m $1'
alias gs='git status'
alias gss='git status -s'
alias gl='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
alias gb="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
alias gp='git pull'
alias gpp='git pull && git push'
