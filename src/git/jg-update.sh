#! /usr/bin/env zsh

SELF="${0##*/}"
. jagitor-prelude

sep=":"

function behind {
  local fn
  local -a fs

  read ln
  fs=(${(@s:$sep:)ln})

  [[ ! ${fs[3]} =~ "^behind [0-9]+$" ]] && return
  echo ${(pj:$sep:)fs[1,2]}
}

function merge {
  local head rref
  read head
  read rref

  git push . $(git rev-parse $rref):$head
}

git-jg-status --no-column -s "$sep" | behind | merge
