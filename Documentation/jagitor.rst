jagitor
#######

A stupid portmanteau of git and janitor
---------------------------------------

:Manual section: 1
:Date: 2017-06-18
:Author: Jan Matějka yac@blesmrt.net
:Manual group: jagitor manual

SYNOPSIS
========

  jagitor [-x] <command> [<args>]

DESCRIPTION
===========

jagitor is a git wrapper and addon to help manage multiple git
repositories by

* displaying a status of branches on found repos

* providing a simple interface to run the same command on found repos

OPTIONS
=======

-x    Enable XTRACE shell option for debugging.

COMMANDS
========

* ``man 1 git-jg-status``

* ``man 1 jagitor-status``

* ``man 1 jagitor-find``

EXAMPLES
========

Find all your repos::

  $ jagitor find ~/all-my-repos
  ./foo
  ./bar
  ./qux/quux

Show status in single repo::

  $ cd ~/all-my-repos/foo && git jg status
  ahead   origin/synced        ahead 1
  behind  origin/synced        behind 1
  both    origin/synced        ahead 1, behind 1
  gone    origin/non-existent  gone
  master  origin/master
  synced  origin/synced

Show status in all the repos::

  $ jagitor status ~/all-my-repos
  ./jagitor
  wip             up/wip           ahead 3, behind 1

  ./headdesk-www
  master          hd/master        ahead 2


Exec a command in all the repos::

  $ jagitor find ~/all-my-repos -- -execdir git fetch --all


For more detailed examples see test cases in ./cram/

BUILD & INSTALLATION
====================

$ make && make check && make install

DEPENDENCIES
============

Build:

* python-docutils

* GNU make

Tests:

* ``cram <https://github.com/brodie/cram>``

Runtime:

* zsh

* git

* findutils

* util-linux

* grep

.. include:: common-foot.rst
