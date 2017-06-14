setup
=====

  $ . $TESTDIR/setup.zsh
  $ setup-repos ./foo >/dev/null 2>&1 || die "setup failed"
  $ setup-repos ./bar >/dev/null 2>&1 || die "setup failed"
  $ git init ./qux >/dev/null 2>&1 || die "setup failed"

  $ bump-ahead ./foo/local >/dev/null 2>&1

  $ jagitor find ./
  /tmp/cramtests-????????/03.jagitor-status.t/qux (glob)
  /tmp/cramtests-????????/03.jagitor-status.t/bar/local (glob)
  /tmp/cramtests-????????/03.jagitor-status.t/foo/local (glob)

test relative path
==================

  $ jagitor status ./
  ./bar/local
  ahead        synced               ahead 1
  behind       synced               behind 1
  both         synced               ahead 1, behind 1
  gone         origin/non-existent  gone
               
  ./foo/local
  ahead        synced               ahead 2
  behind       synced               behind 1
  both         synced               ahead 1, behind 1
  gone         origin/non-existent  gone
               

test absolute path
==================

  $ jagitor status $TESTTMP
  ./bar/local
  ahead        synced               ahead 1
  behind       synced               behind 1
  both         synced               ahead 1, behind 1
  gone         origin/non-existent  gone
               
  ./foo/local
  ahead        synced               ahead 2
  behind       synced               behind 1
  both         synced               ahead 1, behind 1
  gone         origin/non-existent  gone
               
