export EDITOR=vim
export DEFAULT_USER=richardnias

if [[ -o login ]]; then
	export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

	export NVM_DIR="/Users/nias/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

	export GOPATH="/Users/nias/.go"
	export PATH="$PATH:$GOPATH/bin:$HOME/scripts/bin:/usr/local/sbin:/Users/nias/Library/Python/3.6/bin:/Users/nias/.local/bin"
	
	export WORKON_HOME=~/.virtualenvs
	export VIRTUALENVWRAPPER_PYTHON="/Users/nias/.local/venvs/virtualenvwrapper/bin/python"
fi

source /Users/nias/scripts/helpful.sh
source /Users/nias/scripts/bindkeys.sh
source /Users/nias/scripts/tinycareterm.sh
source /Users/nias/.antigen.zsh

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
antigen bundle nias-r/pure

antigen apply

export RPROMPT='%F{black}%K{green}%D %*%k%f'
eval "$(thefuck --alias)"

if [ -z ${TMUX+x} ]                        
then
	echo "〰〰〰〰〰〰〰〰〰〰〰〰〰"
else 
	if [[ -o login ]]; then
		gim
	fi
fi

eval "$(direnv hook zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gcloud
source /Users/nias/google-cloud-sdk/completion.zsh.inc
source /Users/nias/google-cloud-sdk/path.zsh.inc

# aws
source /usr/local/bin/aws_zsh_completer.sh

# virtualenvwrapper
source /Users/nias/.local/bin/virtualenvwrapper.sh 

# pipenv
PIPENV_SHELL_FANCY=true
