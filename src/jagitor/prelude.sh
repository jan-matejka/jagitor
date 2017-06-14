#!/bin/false
# vim: filetype=zsh

setopt no_unset
setopt pipe_fail
setopt warn_create_global

function fatal {
  f-msg "$@"
  exit 1
}

function f-msg {
  local msg=$1
  shift
  msg=$(printf $msg "$@")
  printf >&2 -- "%s: fatal: %s\n" $SELF $msg
}

function f-already-exists {
  fatal "%s %s already exists" "$@"
}

function f-git-initialized {
  fatal "%s already initialized" "$1"
}

function f-not-executable {
  fatal "%s %s not executable" "$@"
}

function f-not-regular {
  fatal "%s %s exist but is not a regular file" "$@"
}

function f-symlink {
  fatal "%s %s is symlink" "$@"
}

function check-arg {
  test -z "${2:-}" && fatal "missing argument %s" $1
}

function check-git-clean {
  test $(git status -su | wc -l) -gt 0 && {
    f-msg "unclean git work tree"
    git status -su
    exit 1
  }
}

function check-executable {
  type "$1" >/dev/null 2>&1 || fatal "cannot execute %s" $1
}

function cmd-dispatch {
  check-arg "command" ${1:-}

  local cmd=$SELF-$1
  shift

  check-executable $cmd
  exec $cmd "$@"
}
