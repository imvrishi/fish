ZSH_THEME="powerlevel10k/powerlevel10k"

# z in fzf
plugins=(
  git
  colorize
  common-aliases
  cp
  extract
  git-prompt
  lol
  safe-paste
  sudo
  systemadmin
  universalarchive
  zsh-interactive-cd # need fzf
  zsh_reload
  history-substring-search # need to pull from git
  zsh-autosuggestions # need to pull from git
  zsh-syntax-highlighting # need to pull from git
)

[[ -d "/opt/node/bin" && ! "$PATH" =~ "/opt/node/bin" ]] && PATH="/opt/node/bin:$PATH"
[[ -d "/usr/local/bin" && ! "$PATH" =~ "/usr/local/bin" ]] && PATH="/usr/local/bin:$PATH"
[[ -d "/usr/local/sbin" && ! "$PATH" =~ "/usr/local/sbin" ]] && PATH="/usr/local/sbin:$PATH"
[[ -d "$HOME/.local/bin" && ! "$PATH" =~ "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.yarn/bin" && ! "$PATH" =~ "$HOME/.yarn/bin" ]] && PATH="$HOME/.yarn/bin:$PATH"

function z() {
  case $1 in
    in) sudo zypper in -yl --recommends ${@:2} ;;
    rm) sudo zypper rm -yu ${@:2} ;;
    *) sudo zypper ${@:1} ;;
  esac
}

# clip
alias copy='xclip -sel clip'
alias paste='xclip -sel clip -o'
alias sc='sudo systemctl'
