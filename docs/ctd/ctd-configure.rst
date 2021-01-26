*******************
Configuration & Use
*******************

.. _f5-sphinx-theme: https://github.com/0xHiteshPatel/f5-sphinx-theme

To use this template:

#. Download or ``git clone`` the `f5-sphinx-theme`_
#. Copy contents of this repo to a new directory ``cp -Rf . /path/to/your/docs``
#. ``cd /path/to/your/docs``
#. Edit ``docs/conf.py``
#. Modify the following lines:

   - ``classname = "Your Class Name"``
   - ``github_repo = "https://github.com/f5devcentral/your-class-repo"``

#. Build docs ``./containthedocs-build.sh`` (*see Build Scripts below*)
#. Open the ``docs/_build/html/index.html`` file on you system in a web browser
#. Edit the ``*.rst`` files as needed for your class
#. Rebuild docs as needed using ``./containthedocs-build.sh``
