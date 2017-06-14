#! /usr/bin/env zsh

SELF="${0##*/}"
. jagitor-prelude

declare -a args
declare -A aargs=( -s ":" )

zparseopts -K -D -E -a args -A aargs s: c -no-column

git check-ref-format "refs/heads/foo${aargs[-s]}" &&
  fatal "invalid separator: passes git-check-ref-format(1)"

(( ${args[(I)-s]} && ! ${args[(I)--no-column]} )) &&
  warning "-s has no effect without --no-column"

cols=(
  "%(refname:short)"
  "%(upstream:short)"
  "%(upstream:track,nobracket)"
)

sep=${aargs[-s]}
fmt=${(pj:$sep:)cols}

grep=( tee )
(( ${args[(I)-c]} )) && grep=( grep -P 'ahead |behind |gone$' )

column=( column -s "${aargs[-s]}" -t )
(( ${args[(I)--no-column]} )) && column=( tee )

git for-each-ref --format "$fmt" refs/heads/  | $grep | $column
