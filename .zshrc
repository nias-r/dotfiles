export EDITOR=vim
export DEFAULT_USER=richardnias

export PATH="$PATH:$HOME/scripts/bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="/Users/nias/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GOPATH="/Users/nias/.go"
export PATH="$PATH:$GOPATH/bin"

source /Users/nias/scripts/helpful.sh
source /Users/nias/scripts/bindkeys.sh
source /Users/nias/scripts/tinycareterm.sh
source /Users/nias/antigen.zsh

antigen use oh-my-zsh

antigen bundle z
antigen bundle git
antigen bundle osx
antigen bundle command-not-found
antigen bundle peterhurford/git-it-on.zsh
antigen bundle andrewferrier/fzf-z
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle vasyharan/zsh-brew-services
antigen bundle lukechilds/zsh-better-npm-completion

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

export RPROMPT='%F{black}%K{green}%D %*%k%f'
eval "$(thefuck --alias)"

if [ -z ${TMUX+x} ] 
	then
		tmux new-session -A -s general 
	else
		gim | lolcat
fi	

export PATH="/usr/local/sbin:$PATH"
