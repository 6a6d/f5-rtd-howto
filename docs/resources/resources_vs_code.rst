********************
Editor Installation
********************

Below is an example of using a 3rd party editor to create/modify reStructuredText documents.

VS Code
=======

Microsoft VS Code can be downloaded from the below URL for Windows, Mac, and Linux.

* https://code.visualstudio.com/

After installing VS Code, there are several helpful extensions that can make editing markdown easier and more intuitive.

Install the following extensions for VS Code.

- Git Blame
- Git History
- gitignore
- Python
- reStructuredText
- SpellChecker

reStructuredText Preview Configuration
--------------------------------------

In order to support the reStructuredText extensions preview capability, some additional Python packages will need to be installed.

- Sphinx
- sphinx-autobuild
- sphinx-rtd-theme
- sphinxcontrib-addmetahtml
- sphinxcontrib-blockdiag
- sphinxcontrib-googleanalytics
- sphinxcontrib-images
- sphinxcontrib-nwdiag
- sphinxcontrib-websupport
- sphinxjp.themes.basicstrap
- recommonmark

Run the following command in your terminal.

.. code-block:: bash

  $ pip install f5-sphinx-theme Sphinx sphinx-autobuild sphinx-rtd-theme sphinxcontrib-addmetahtml sphinxcontrib-blockdiag sphinxcontrib-googleanalytics sphinxcontrib-images sphinxcontrib-nwdiag sphinxcontrib-websupport sphinxjp.themes.basicstrap recommonmark

.. important:: Ensure that the folder containing your conf.py and reStructuredText files is opened and not the parent directory containing a 'docs' folder.

Atom
====

.. todo::

  Insert instructions for Atom usage with RTD.

VIM
===

.. todo::

  Insert instructions for VIM usage with RTD.
