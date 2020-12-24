## ls
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -lah'
alias l.='ls -d .* --color=auto'

## cd
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

## grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias sha1='openssl sha1'
# install  colordiff package :)
# alias diff='colordiff'
alias mount='mount | column -t'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ports='netstat -ano | grep LISTENING'
alias c='clear'
alias shutdown='shutdown /s /t 0'
alias reboot='shutdown /r /t 0'
alias rm='rm -rfI --preserve-root'
alias ram='wmic MEMORYCHIP get BankLabel, DeviceLocator, MemoryType, TypeDetail, Capacity, Speed'
alias free='systeminfo | grep Memory'
alias df='df -h'
alias du='du -ch'
# alias r='$(fc -ln -1)'

## nginx
alias xstart=' var="$PWD"; cd /c/nginx; start ./nginx.exe;     cd $var'
alias xstop='  var="$PWD"; cd /c/nginx; ./nginx.exe -s stop;   cd $var'
alias xquit='  var="$PWD"; cd /c/nginx; ./nginx.exe -s quit;   cd $var'
alias xreload='var="$PWD"; cd /c/nginx; ./nginx.exe -s reload; cd $var'

## git
alias gs='git status'
alias gss='git status -s'
alias gl='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
alias gb="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
alias gp='git pull'
alias gpp='git pull && git push'

## php cgi
alias phpcgi='/c/php/php7413/php-cgi.exe -b 127.0.0.1:9000 &'
