setup
=====

  $ . $TESTDIR/setup.zsh
  $ setup-repos ./foo >/dev/null 2>&1 || die "setup failed"

  $ cd foo/local
  $ git branch --list -vv
    ahead  ??????? [synced: ahead 1] wip3 (glob)
    behind ??????? [synced: behind 1] wip (glob)
    both   ??????? [synced: ahead 1, behind 1] fixup! wip (glob)
  * gone   ??????? [origin/non-existent: gone] wip (glob)
    master ??????? [origin/master] Add README (glob)
    synced ??????? [origin/synced] wip2 (glob)

test happy
==========

  $ git jg status
  ahead   synced               ahead 1
  behind  synced               behind 1
  both    synced               ahead 1, behind 1
  gone    origin/non-existent  gone
  master  origin/master        
  synced  origin/synced        

  $ git jg status --no-column
  ahead:synced:ahead 1
  behind:synced:behind 1
  both:synced:ahead 1, behind 1
  gone:origin/non-existent:gone
  master:origin/master:
  synced:origin/synced:

  $ git jg status -c
  ahead   synced               ahead 1
  behind  synced               behind 1
  both    synced               ahead 1, behind 1
  gone    origin/non-existent  gone

  $ git jg status -c --no-column
  ahead:synced:ahead 1
  behind:synced:behind 1
  both:synced:ahead 1, behind 1
  gone:origin/non-existent:gone

  $ git jg status -s "^" --no-column
  ahead^synced^ahead 1
  behind^synced^behind 1
  both^synced^ahead 1, behind 1
  gone^origin/non-existent^gone
  master^origin/master^
  synced^origin/synced^

test error
==========

  $ git jg status -s "-"
  git-jg-status: fatal: invalid separator: passes git-check-ref-format(1)
  [1]

  $ git jg status -s "^"
  git-jg-status: warning: -s has no effect without --no-column
  ahead   synced               ahead 1
  behind  synced               behind 1
  both    synced               ahead 1, behind 1
  gone    origin/non-existent  gone
  master  origin/master        
  synced  origin/synced        
