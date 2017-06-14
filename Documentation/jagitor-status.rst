jagitor-status
##############

print status of repositories
----------------------------

:Manual section: 1
:Date: 2017-06-18
:Author: Jan Matějka yac@blesmrt.net
:Manual group: jagitor manual

SYNOPSIS
========

  jagitor status <path> [-1]

DESCRIPTION
===========

Print status of changed local branches in git repositories under <path>.

Basicly calls ``git jg status -c`` in each repository and wraps it with
git dir path and separator line.

OPTIONS
=======

-1    An internal flag.

EXAMPLES
========

See ``man 1 jagitor``.

SEE ALSO
========

* ``man 1 jagitor``

* ``man 1 git-jg-status``

.. include:: common-foot.rst
