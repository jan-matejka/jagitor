#! /usr/bin/env zsh

SELF="${0##*/}"
. jagitor-prelude

# man git(1)
export GIT_WORK_TREE="$(hddb-path git)"
export GIT_DIR="${GIT_WORK_TREE}/.git"
export HDDB_VISUAL="${VISUAL:-vim}"

cmd-dispatch "$@"
