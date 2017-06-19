#! /usr/bin/env zsh

SELF="${0##*/}"
. jagitor-prelude

find_args=( -execdir pwd \; )

i=${argv[(ie)--]}
(( $i <= $# )) && {
  find_args=( ${argv[i + 1,-1]} )
  shift -p $(( $# - $i + 1 ))
}

check-arg ${1:-} "path"

find $1 -type d -name .git ${find_args}
