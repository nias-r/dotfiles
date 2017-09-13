#!/usr/bin/env bash

function findHere()
{
    find . | fzf
}
alias find-here=findHere
alias google='source ~/scripts/other/google.sh'
alias pjson='python3 -m json.tool'
