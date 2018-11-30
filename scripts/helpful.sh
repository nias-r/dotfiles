#!/usr/bin/env bash

h() {
    echo "Custom commands:"
    echo "bcp       -> brew clean package"
    echo "bip       -> brew install package"
    echo "bup       -> brew upgrade package"
    echo "c         -> \`charm .\`"
    echo "copy      -> copy from file or stdin"
    echo "cpw       -> copy password"
    echo "fbr       -> git checkout branch"
    echo "fkill     -> kill process by name"
    echo "fo        -> open file (CTRL-O to use \`open\`)"
    echo "paste     -> pbpaste"
    echo "pjson     -> prettify json"
}

alias c='charm .'

alias pjson='python3 -m json.tool'

cpw() {
    lpass show -c --password $(lpass ls  | fzf | awk '{print $(NF)}' | sed 's/\]//g')
}

function copy()
{
  if [[ -t 0 ]]; then
    cat "$@" | pbcopy
  else
    pbcopy < /dev/stdin
  fi
}

alias paste=pbpaste

# fzf checkout branch
fbr() {
	local tags branches target
	tags=$(
git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
	branches=$(
git branch --all | grep -v HEAD |
sed "s/.* //" | sed "s#remotes/[^/]*/##" |
sort -u | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
	target=$(
(echo "$tags"; echo "$branches") |
	fzf --no-hscroll --no-multi --delimiter="\\t" -n 2 \
		--ansi --preview="git log -200 --pretty=format:%s $(echo {+2..} |  sed 's/$/../' )" ) || return
	git checkout "$(echo "$target" | awk '{print $2}')"
}

# Open a file
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
	local out file key
	IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
	key=$(head -1 <<< "${out}")
	file=$(head -2 <<< "${out}" | tail -1)
	if [[ -n "$file" ]]; then
		if [[ "$key" = ctrl-o ]]; then
				open "$file"
		else
				${EDITOR:-vim} "$file"
		fi
	fi
}

# fkill - kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [[ "x$pid" != "x" ]]; then
        echo ${pid} | xargs kill -${1:-9}
    fi
}

# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]lugin
bip() {
    local inst
    inst=$(brew search | fzf -m)

    if [[ ${inst} ]]; then
        for prog in $(echo ${inst}); do
            brew install ${prog};
        done
    fi
}

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]lugin
bup() {
    local upd
    upd=$(brew leaves | fzf -m)

    if [[ ${upd} ]]; then
        for prog in $(echo ${upd}); do
            brew upgrade ${prog}
        done
    fi
}

# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]lugin (e.g. uninstall)
bcp() {
  local uninst
  uninst=$(brew leaves | fzf -m)

  if [[ ${uninst} ]]; then
    for prog in $(echo ${uninst}); do
        brew uninstall ${prog}
    done
  fi
}