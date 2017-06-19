#! /usr/bin/env zsh

SELF="${0##*/}"
. jagitor-prelude

declare -a args
zparseopts -K -D -a args x
(( ${args[(I)-x]} )) && {
  set -x
  export JAGITOR_XTRACE=true
}

cmd-dispatch "$@"
