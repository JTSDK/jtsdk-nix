JTSDK For Linux
===============
JTSDK is a collection of Bash scripts designed to assist
users in compiling the various applications from the `WSJT Project`_, used by
Amateur Radio Operators.


Package Requirments
-------------------

 1. The list facilitates compiling WSJT-X, WSJT and WSPR including
    documentation plus Manpages using AsciiDoc or Asciidoctor.
 2. This *is not* an all inclusive list. Your distribution may already have one
    or more of the packages installed by default.
 3. Some packages may be dependencies of others and automatically installed.
    The list makes no attempt determine the reverse depends.
 4. This list provides both Build and Runtime dependencies
 5. Other distributions may have different package names. Consult
    your distribution package management and adjust accordingly.


.. code-block:: bash

   Package List for Ubuntu ( 14.04, 16.04 ):

   asciidoc, asciidoctor, autoconf, automake, autotools-dev,
   clang-3.5, cmake (>= 2.8.9), coderay, g++ (>= 4.8.2), gcc (>= 4.8.2), gettext,
   gfortran, git, libfftw3-dev, libhamlib-dev, libhamlib-utils,
   libqt5multimedia5-plugins,libqt5opengl5-dev, libqt5serialport5-dev,
   libsamplerate0-dev, libtool, libudev-dev, libusb-dev, libusb-1.0-0-dev,
   libxml2-utils, pkg-config, portaudio19-dev, python3-dev, python3-numpy,
   python3-pil, python3-pil.imagetk, python3-pip, python3-setuptools,
   python3-tk, python3-dev, qtbase5-dev, qtmultimedia5-dev, subversion, texinfo,
   xmlto, xsltproc


Installation
------------
* Download jtsdk-nix-2.0.21.tar.gz
* Extract: tar -xf jtsdk-nix-2.0.21.tar.gz
* cd ./jtsdk-nix-2.0.21
* ./autogen.sh --prefix=/usr/local
* make
* sudo make install
* To Run Type: jtsdk

Uninstall
---------
* cd ./jtsdk-nix-2.0.21
* sudo make uninstall


Application Build Notes
-----------------------
* If building WSJT-X, build Hamlib3 first, then build WSJT-X.
* WSPR and WSJT do not require Hamlib3.
* Ensure you update Hamlib3 often, as updates are frequently posted.

Setup Help
----------
The best source of help in setting up your station or configuring WSJT-X is the
WSJT Group at (email address wsjtgroup@yahoogroups.com). The chances are good
that someone with similar interests and equipment has already solved your
problem and will be happy to help.


Bug Reports
-----------
One of your responsibilities as a WSJT-X user is to help the volunteer
programmers to make the program better. Bugs may be reported to WSJT Group 
(email address wsjtgroup@yahoogroups.com) or the WSJT Developers list 
(wsjt-devel@lists.sourceforge.net). To be useful, bug reports should include
at least the following information:

* Program version
* Operating system
* Concise description of the problem
* Sequence of steps required to reproduce the problem

Feature Requests
----------------
Suggestions from users often result in new program features. Good ideas are
always welcome: if there’s a feature you would like to see in WSJT-X, spell
it out in as much detail as seems useful and send it to us at one the the email
addresses given a few lines above. Be sure to explain why you think the feature
is desirable, and what sort of other users might find it so. 


WSJT Project Information
------------------------
Home Page: http://www.physics.princeton.edu/pulsar/K1JT/
Program Development: http://physics.princeton.edu/pulsar/k1jt/devel.html


.. _WSJT Project: http://physics.princeton.edu/pulsar/k1jt/