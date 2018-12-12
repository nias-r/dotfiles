if [ -z ${TMUX+x} ]; then 
	echo "〰〰〰〰〰〰〰〰〰〰〰〰〰"
	tmux -u new-session -A -s general
	exit 0
fi

if [[ -o login ]]; then
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM

	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

	export GOPATH="$HOME/go"
	export PATH="$PATH:/usr/local/sbin"
	export PATH="$PATH:$GOPATH/bin"
	export PATH="$PATH:$HOME/scripts/bin"
	export PATH="$PATH:$HOME/.local/bin"
	export PATH="$PATH:$HOME/.cargo/bin"
	export PATH="$PATH:$HOME/dotfiles/scripts/bin"
	export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
	export PATH="/usr/local/opt/redis@3.2/bin:$PATH"
	export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

	if [[ -s "$HOME/.local/bin/virualenvwrapper.sh" ]]; then
		export WORKON_HOME=~/.virtualenvs
		export VIRTUALENVWRAPPER_PYTHON="$HOME/.local/venvs/virtualenvwrapper/bin/python"
	fi

	export LC_ALL=en_GB.UTF-8
	export LANG=en_GB.UTF-8

	gim
fi

export EDITOR=/usr/local/bin/vim
export DEFAULT_USER=richardnias

alias vim=/usr/local/bin/vim

source $HOME/dotfiles/scripts/helpful.sh
source $HOME/dotfiles/scripts/bindkeys.sh
source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle z
antigen bundle git
antigen bundle osx
antigen bundle command-not-found
antigen bundle peterhurford/git-it-on.zsh
antigen bundle andrewferrier/fzf-z
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle vasyharan/zsh-brew-services
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle mdumitru/fancy-ctrl-z
antigen bundle caarlos0/zsh-git-sync
antigen bundle mafredri/zsh-async
antigen bundle richardnias/pure

antigen apply

eval "$(thefuck --alias)"

# eval "$(direnv hook zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gcloud
if [[ -s "$HOME/google-cloud-sdk" ]]; then
	source $HOME/google-cloud-sdk/completion.zsh.inc
	source $HOME/google-cloud-sdk/path.zsh.inc
fi

# aws
source $HOME/.local/bin/aws_zsh_completer.sh

# virtualenvwrapper
if [[ -s "$HOME/.local/bin/virualenvwrapper.sh" ]]; then
	source $HOME/.local/bin/virtualenvwrapper.sh
fi

# pipenv
PIPENV_SHELL_FANCY=true

export PATH="$HOME/.yarn/bin:$PATH"

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# GPG config
export GPG_TTY=$(tty)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(pyenv init -)"

export FZFZ_SUBDIR_LIMIT=0
export FZFZ_EXCLUDE_PATTERN="\.(git|stack)"
export FZF_DEFAULT_COMMAND='fd --type file'
