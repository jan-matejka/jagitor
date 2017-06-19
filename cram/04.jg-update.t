setup
=====

  $ . $TESTDIR/setup.zsh
  $ git init remote

  $ bump-ahead remote >/dev/null 2>&1
  $ git clone remote local

  $ bump-ahead remote
  $ cd local && 

  $ jagitor find ./
  /tmp/cramtests-????????/03.jagitor-status.t/qux (glob)
  /tmp/cramtests-????????/03.jagitor-status.t/bar/local (glob)
  /tmp/cramtests-????????/03.jagitor-status.t/foo/local (glob)
