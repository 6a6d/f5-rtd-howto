*************
Initial Setup
*************

.. _f5-sphinx-theme: https://github.com/0xHiteshPatel/f5-sphinx-theme
.. _f5-agility-lab-template: https://github.com/0xHiteshPatel/f5-agility-lab-template.git

F5 Sphinx Theme
---------------

The `f5-sphinx-theme`_ repository contains a template that should be used when creating lab documentation for F5's Agility Labs.

Initial Setup
-------------

#. Download or ``git clone`` the `f5-agility-lab-template`_
#. Download and install Docker CE (https://docs.docker.com/engine/installation/)
#. Build the sample docs ``./containthedocs-build.sh``.

.. Note::
    The first time you build a container (~1G in size) will be downloaded from Docker Hub.

#. Open the ``docs/_build/html/index.html`` file on you system in a web browser to view the rendered content.
