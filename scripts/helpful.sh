#!/usr/bin/env bash

function findHere()
{
    find . | fzf
}
alias find-here=findHere
alias pjson='python3 -m json.tool'

function copy()
{
  if [ -t 0 ]; then
    cat "$@" | pbcopy
  else
    pbcopy < /dev/stdin
  fi
}

alias paste=pbpaste

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

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
	local out file key
	IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
	key=$(head -1 <<< "${out[*]}")
	file=$(head -2 <<< "${out[*]}" | tail -1)
	if [ -n "$file" ]; then
		if [ "$key" = ctrl-o ]; then
				open "$file"
		else
				${EDITOR:-vim} "$file"
		fi
	fi
}
