#! /usr/bin/env zsh

export TESTTMP="$CRAMTMP/$TESTFILE"
export PATH="${TESTDIR%/*}/_build/bin:${PATH}"

FAKEPATH="$TESTTMP/path"
mkdir "${FAKEPATH}" || return
export PATH="${FAKEPATH}:${PATH}"

function setup-clean {
  rm -rf ${TESTTMP}
  mkdir ${TESTTMP}
}

function setup-script {
  echo '#!/bin/bash' > $2
  echo "$1" >> $2
  chmod +x $2
}

function die {
  printf "$1\n"
  exit 1
}

function setup-repos {
  mkdir $1 || return
  pushd $1 || return

  git init local || return
  git init --bare remote  || return
  local remote=$(pwd)/remote

  pushd local || return
  touch README  || return
  git add README  || return
  git commit -a -m "Add README"  || return

  git remote add origin file://$remote  || return
  git push -u origin master  || return

  git checkout -b synced  || return
  echo foo >> README|| return
  git commit -a -m wip|| return
  echo foo2 >> README|| return
  git commit -a -m wip2|| return
  git push -u origin synced|| return

  git checkout -b ahead -t synced|| return
  echo bar >> README|| return
  git commit -a -m wip3|| return

  git checkout synced|| return
  git checkout -b both -t synced|| return
  git commit --amend --fixup HEAD~1|| return
  git rebase HEAD~2 --autosquash|| return

  git checkout synced|| return
  git checkout -b behind -t synced|| return
  git reset --hard HEAD~1|| return

  git push origin behind:non-existent|| return
  git checkout -b gone -t origin/non-existent|| return
  git push -f origin :non-existent|| return

  popd
  popd
}

function bump-ahead {
  pushd $1

  git checkout ahead
  echo qux >> README
  git commit -a -m "qux"

  popd
}
