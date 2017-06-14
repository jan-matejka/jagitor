git-jg-status
#############

print status of a repository
----------------------------

:Manual section: 1
:Date: 2017-06-18
:Author: Jan Matějka yac@blesmrt.net
:Manual group: jagitor manual

SYNOPSIS
========

  git jg status [-c] [--no-column [-s <separator>]]

DESCRIPTION
===========

Print a status of all local branches in current directory git repository.
Similar to ``git branch --list -vv`` but more pleasant for quick overview
and compatible with calling over multiple repos.

Status consists of columns in order:

1. short local branch name

2. fully qualified upstream ref

3. optional branch status (ahead, behind, both or gone)

This command basicly does call ``git-branch --list`` with a bunch of
custom ``--format``, see `OPTIONS`_.

OPTIONS
=======

-c                Show only changed branches meaning branches that have
                  set tracking remote and either branch diverged.

--no-column       Do not columnize the ouput.

-s <separator>    Join fields by <separator>

EXAMPLES
========

See ``man 1 jagitor``.

SEE ALSO
========

* ``man 1 column``

* ``man 1 git-for-each-ref``

.. include:: common-foot.rst
