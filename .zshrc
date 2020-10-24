export EDITOR=/usr/local/bin/vim
export DEFAULT_USER=`whoami`

alias vim=/usr/local/bin/vim

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle z
antigen bundle git
antigen bundle mercurial
antigen bundle osx
antigen bundle docker
antigen bundle peterhurford/git-it-on.zsh
antigen bundle andrewferrier/fzf-z
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle vasyharan/zsh-brew-services
antigen bundle mdumitru/fancy-ctrl-z
antigen bundle caarlos0/zsh-git-sync
antigen bundle mafredri/zsh-async
antigen bundle richardnias/pure

export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

antigen apply

# pipenv
PIPENV_SHELL_FANCY=true

# GPG config
export GPG_TTY=$(tty)
