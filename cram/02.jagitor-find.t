setup
=====

  $ . $TESTDIR/setup.zsh
  $ setup-repos ./foo >/dev/null 2>&1 || die "setup failed"
  $ setup-repos ./bar >/dev/null 2>&1 || die "setup failed"

test default
============

  $ jagitor find ./
  /tmp/cramtests-????????/02.jagitor-find.t/bar/local (glob)
  /tmp/cramtests-????????/02.jagitor-find.t/foo/local (glob)

test no find args
=================

  $ jagitor find ./ --
  ./bar/local/.git
  ./foo/local/.git

test multiarg -exec
===================

  $ jagitor find ./ -- -exec dirname {} \;
  ./bar/local
  ./foo/local

test multiple execs
===================

  $ jagitor find ./ -- -exec echo {} \; -execdir echo foo \;
  ./bar/local/.git
  foo
  ./foo/local/.git
  foo

test absolute path
==================

  $ jagitor find $TESTTMP
  /tmp/cramtests-????????/02.jagitor-find.t/bar/local (glob)
  /tmp/cramtests-????????/02.jagitor-find.t/foo/local (glob)

test error
==========

  $ jagitor find
  jagitor-find: fatal: missing argument path
  [1]

  $ jagitor find --
  jagitor-find: fatal: missing argument path
  [1]

  $ jagitor find -- -print
  jagitor-find: fatal: missing argument path
  [1]
