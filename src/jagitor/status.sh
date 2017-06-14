#! /usr/bin/env zsh

SELF="${0##*/}"
. jagitor-prelude

declare -a args
zparseopts -K -D -a args 1

(( ${args[(I)-1]} )) && {
  xs=$(git-jg-status -c --no-column)
  [[ -z $xs ]] && return 0

  printf ".${PWD#$1}\n$xs\n:\n"
  return 0
}

check-arg ${1:-} "path"
cd $1 || return
jagitor-find ./ \
  -- -execdir jagitor-status -1 $(realpath $1) \; \
| column -s ":" -t
