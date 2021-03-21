Converting a Word Doc to Markdown
=================================

.. _f5-sphinx-theme: https://github.com/0xHiteshPatel/f5-sphinx-theme
.. _f5-agility-lab-template: https://github.com/0xHiteshPatel/f5-agility-lab-template.git


Conversion Process
------------------

To convert a ``.docx`` file from Microsoft Word to reStructuredText follow the below steps.

.. note::
    The conversion process will place all of the course content into a single reStructedText file.

#. Download or ``git clone`` the `f5-agility-lab-template`_
#. Copy your ``.docx`` file into the f5-agility-lab-template directory
#. Run the below command at the the command line.

    `$: `./containthedocs-convert.sh <filename.docx>``

#. Your converted file will be named ``filename.rst``
#. Images in your document will be extracted and placed in the ``media`` directory

Fixing the Converted Document
-----------------------------

#. Create an additional reStructedText file for each major section in your document.
#. Copy and paste the converted text from the originally converted text file to the new reStructedText file.

Verify Content Accuracy
-----------------------

#. Check each reStructedText file to ensure that formatting is correct.
#. Ensure that the images were converted successfully and look correct.

.. warning::
    Images may not have converted correctly and may need to be recaptured!
