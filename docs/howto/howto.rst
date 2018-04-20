********
Overview
********

.. _GitHub: https://github.com/6a6d/f5-rtd-howto
.. _Issue: https://github.com/6a6d/f5-rtd-howto/issues

**Support**

Bugs and enhancements can be made by opening an `issue`_ within the `GitHub`_ repository.

Installing Sphinx
=================

Choose one of the following three methods to install sphinx, sphinx-autobuild, and sphinx_rtd_theme.

Globally
--------
To install Sphinx globally run the below pip commands from your favorite CLI.

.. code-block:: none
  :linenos:

  $ pip install sphinx
  $ pip install sphinx-autobuild
  $ pip install sphinx_rtd_theme

Locally
-------

To install Sphinx locally to your home directory.

.. code-block:: none
  :linenos:

  $ pip install --user sphinx
  $ pip install --user sphinx-autobuild
  $ pip install --user sphinx_rtd_theme

Python Virtual Environment
--------------------------

To create a Python virtual environment and install Sphinx within said environment run the following commands.

.. code-block:: none
  :linenos:

  $ pip install virtualenv
  $ cd my_project_folder
  $ virtualenv my_project
  $ source my_project/bin/activate
  $ pip install sphinx
  $ pip install sphinx-autobuild
  $ pip install sphinx_rtd_theme

If you want to exit the virtual environment, use the below command.

.. code-block:: none
  :linenos:

  $ deactivate

Create the Sphinx Environment
=============================

Change to your project directory.

.. code-block:: none
  :linenos:

  $ cd my_project

If using a Python virtual environment with sphinx, first activate the environment.

.. code-block:: none
  :linenos:

  $ source my_project/bin/activate 

Create a folder for your project's documentation and make it your current working directory.  Run the sphinx-quickstart command to build the an initial Sphinx configuration.

.. code-block:: none
  :linenos:

  $ mkdir docs
  $ cd docs
  $ sphinx-quickstart

Accept the defaults.  These can be changed later.

.. code-block:: none

  $ sphinx-quickstart
  Welcome to the Sphinx 1.5.5 quickstart utility.

  Please enter values for the following settings (just press Enter to accept a default value, if one is given in brackets).

  Enter the root path for documentation.
  > Root path for the documentation [.]: <enter>

  You have two options for placing the build directory for Sphinx output.  Either, you use a directory "_build" within the root path, or you separate "source" and "build" directories within the root path.
  > Separate source and build directories (y/n) [n]:  <enter>

  Inside the root directory, two more directories will be created; "_templates" for custom HTML templates and "_static" for custom stylesheets and other static files. You can enter another prefix (such as ".") to replace the underscore.
  > Name prefix for templates and static dir [_]: <enter>

  The project name will occur in several places in the built documentation.
  > Project name: Testing with Read the Docs <enter>
  > Author name(s): Joshua Murray <enter>

  Sphinx has the notion of a "version" and a "release" for the software. Each version can have multiple releases. For example, for Python the version is something like 2.5 or 3.0, while the release is something like 2.5.1 or 3.0a1.  If you don't need this dual structure, just set both to the same value.
  > Project version []: 1.0 <enter>
  > Project release [1.0]: <enter>

  If the documents are to be written in a language other than English, you can select a language here by its language code. Sphinx will then translate text that it generates into that language.

  For a list of supported codes, see http://sphinx-doc.org/config.html#confval-language.
  > Project language [en]: <enter>

  The file name suffix for source files. Commonly, this is either ".txt" or ".rst".  Only files with this suffix are considered documents.
  > Source file suffix [.rst]: <enter>

  One document is special in that it is considered the top node of the "contents tree", that is, it is the root of the hierarchical structure of the documents. Normally, this is "index", but if your "index" document is a custom template, you can also set this to another filename.
  > Name of your master document (without suffix) [index]: <enter>

  Sphinx can also add configuration for epub output:
  > Do you want to use the epub builder (y/n) [n]: y <enter>

  Please indicate if you want to use one of the following Sphinx extensions:
  > autodoc: automatically insert docstrings from modules (y/n) [n]:  <enter>
  > doctest: automatically test code snippets in doctest blocks (y/n) [n]:  <enter>
  > intersphinx: link between Sphinx documentation of different projects (y/n) [n]:  <enter>
  > todo: write "todo" entries that can be shown or hidden on build (y/n) [n]: y <enter>
  > coverage: checks for documentation coverage (y/n) [n]: <enter>
  > imgmath: include math, rendered as PNG or SVG images (y/n) [n]: <enter>
  > mathjax: include math, rendered in the browser by MathJax (y/n) [n]: <enter>
  > ifconfig: conditional inclusion of content based on config values (y/n) [n]: <enter>
  > viewcode: include links to the source code of documented Python objects (y/n) [n]: <enter>
  > githubpages: create .nojekyll file to publish the document on GitHub pages (y/n) [n]: <enter>

  A Makefile and a Windows command file can be generated for you so that you only have to run e.g. 'make html' instead of invoking sphinx-build directly.
  > Create Makefile? (y/n) [y]: <enter>
  > Create Windows command file? (y/n) [y]: <enter>

  Creating file ./conf.py.
  Creating file ./index.rst.
  Creating file ./Makefile.
  Creating file ./make.bat.

  Finished: An initial directory structure has been created.

  You should now populate your master file ./index.rst and create other documentation source files. Use the Makefile to build the docs, like so:
  make builder
  where "builder" is one of the supported builders, e.g. html, latex or linkcheck.

Customize the Sphinx Environment
================================

Configure your conf.py file to apply the Read the Docs theme.  Add an "import sphinx_rtd_theme" near the top of the config file just under the other import statements that are commented out.

.. code-block:: python
  :linenos:

  # import os
  # import sys
  import sphinx_rtd_theme

Comment out the default Sphinx theme.

.. code-block:: none
  :linenos:

  html_theme = 'alabaster'
  # html_theme = 'alabaster'

Add the below lines to the bottom of the config file.

.. code-block:: python
  :linenos:

  html_theme = "sphinx_rtd_theme"
  html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

Verify that everything is working with sphinx-autobuild.

.. code-block:: none
  :linenos:

  $ sphinx-autobuild docs docs/_build/html

Then visit the documentation being served at http://127.0.0.1:8000. Each time a change to the documentation source is detected, the HTML is rebuilt and the browser automatically reloaded.
