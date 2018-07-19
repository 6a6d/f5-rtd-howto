******************************
Converting from Microsoft Word
******************************

.. _f5-sphinx-theme: https://github.com/0xHiteshPatel/f5-sphinx-theme
.. _f5-agility-lab-template: https://github.com/0xHiteshPatel/f5-agility-lab-template.git

To convert a ``.docx`` file from Microsoft Word to reStructuredText:

#. Download or ``git clone`` the `f5-agility-lab-template`_
#. Copy your ``.docx`` file into the f5-agility-lab-template directory
#. Run the below command at the the command line.

    `bash$: `./containthedocs-convert.sh <filename.docx>``

#. Your converted file will be named ``filename.rst``
#. Images in your document will be extracted and placed in the ``media``
   directory

.. WARNING:: While the document has been converted to rST format you will still
   need to refactor the rST to use the structure implemented in this template.
