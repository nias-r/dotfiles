if [ -z ${TMUX+x} ]; then
    printf '〰%.0s' {1..`tput cols`}
	tmux -u new-session -A -s general
	exit 0
fi

export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/scripts/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/dotfiles/bin"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/redis@3.2/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"

# gcloud
if [[ -s "$HOME/google-cloud-sdk" ]]; then
	source "$HOME/google-cloud-sdk/completion.zsh.inc"
	source "$HOME/google-cloud-sdk/path.zsh.inc"
fi

# aws
source $HOME/.local/bin/aws_zsh_completer.sh

if [[ -s "$HOME/.local/bin/virualenvwrapper.sh" ]]; then
    source $HOME/.local/bin/virtualenvwrapper.sh
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON="$HOME/.local/venvs/virtualenvwrapper/bin/python"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(pyenv init -)"

export FZFZ_SUBDIR_LIMIT=0
export FZFZ_EXCLUDE_PATTERN="\.(git|stack)"
export FZF_DEFAULT_COMMAND='fd --type file'

source <(kubectl completion zsh)
if type "helm" > /dev/null; then
	source <(helm completion zsh | sed -E 's/\["(.+)"\]/\[\1\]/g')
fi

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

eval "$(thefuck --alias)"

