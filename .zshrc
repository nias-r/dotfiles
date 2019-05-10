export EDITOR=/usr/local/bin/vim
export DEFAULT_USER=richardnias

alias vim=/usr/local/bin/vim

source $HOME/dotfiles/scripts/bindkeys.sh
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
