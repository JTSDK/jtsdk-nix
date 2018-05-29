# JTSDK For Linux

JTSDK is a collection of Bash scripts designed to assist
users in compiling the various applications from the [WSJT Project](https://physics.princeton.edu/pulsar/k1jt/) used by
Amateur Radio Operators.

***

## Package Requirments

 1. The list facilitates compiling WSJT-X, WSJT and WSPR including
    documentation plus Manpages using AsciiDoc or Asciidoctor.
 2. This **is not** an all inclusive list. Your distribution may already have
 one or more of the packages installed by default.
 3. Some packages may be dependencies of others and automatically installed.
    The list makes no attempt determine the reverse depends.
 4. This list provides both Build and Runtime dependencies
 5. Other distributions may have different package names. Consult
    your distribution package management and adjust accordingly.


Package List for Ubuntu ( 14.04, 16.04, 18.04 ):

> NOTE - Releases between LTS versions may also work. However, the primary focus
is to ensure all LST releases are fully functional and upgradable.

```bash
asciidoc, asciidoctor, autoconf, automake, autotools-dev, clang-3.5 | clang-3.9,
cmake (>= 2.8.9), coderay, g++ (>= 4.8.2), gcc (>= 4.8.2), gettext, gfortran,
git, libfftw3-dev, libhamlib-dev, libhamlib-utils,libqt5multimedia5-plugins,
libqt5opengl5-dev, libqt5serialport5-dev, libsamplerate0-dev, libtool, libudev-dev,
libusb-dev, libusb-1.0-0-dev, libxml2-utils, pkg-config, portaudio19-dev,
python3-dev, python3-numpy, python3-pil, python3-pil.imagetk, python3-pip,
python3-setuptools, python3-tk, python3-dev, qtbase5-dev, qtmultimedia5-dev,
subversion, texinfo, xmlto, xsltproc 
```
***

## Installaiton via Launchpad PPA
If you are using any of the current Ubuntu distributions, installation and
updates via the [JTSDK Launchpad PPA](https://launchpad.net/~ki7mt/+archive/ubuntu/jtsdk)
is by far the best solution.

### Add the PPA
```bash
sudo add-apt-repository ppa:ki7mt/jtsdk
sudo apt-get update
sudo apt-get install jtsdk
```

### Install Dependencies
Included with the [JTSDK PPA](https://launchpad.net/~ki7mt/+archive/ubuntu/jtsdk)
are (3) meta packages, of which, one must be installed. The dependencies for
JTSDK are small. However, dependencies for application compling can be substantial.
This is yet another reason to use the [JTSDK PPA](https://launchpad.net/~ki7mt/+archive/ubuntu/jtsdk)
over source installation.


```bash
# Three Meta Packages are available

Package         Description
------------------------------------------------------------------
jtsdk-minimal   minimal build, does not include docs and manpages
jtsdk-standard  minimal + docs
jtsdk-full      minimal + docs + manpages
```

After adding the PPA and installing jtsdk, install one of the meta packages
(its best to install jtsdk-full):

```bash
# Install dependencies
sudo apt-get install jtsdk-full
```

***

## Debin Installation

All install actions are performed in a terminal. This examples is based on
Trusty. Other versions of Debian may change this procedure. It is up to the user
to determine whihc version of Ubuntu corrispons to their version of Debian.
Remember, Launchpad is designed for Ubuntu, not Debain.

```bash
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 862549F9
```

### Edit the Source List
```bash
sudo nano /etc/apt/sources.list

# Add the following to the end of sources.list

# Note : trusty may change for Debian 8, 9, or 10. You need to determine this
#        need beforehand.
# -----
deb http://ppa.launchpad.net/ki7mt/jtsdk/ubuntu trusty main
# -----

# Ctrl+X to save and exit

sudo apt-get update
sudo add-apt-repository ppa:ki7mt/jtsdk
sudo apt-get update
sudo apt-get install jtsdk

# Install meta package dependencies
sudo apt-get install jtsdk-full
```

### Add Addiontal Requirments

### Caveats 
Some derivatives ( Ubuntu Mate 15.10 for example ) require a special package
installation sequence for portrtaudio19-dev. This is from end user reports, and
may or may not be applicable or suitable for all distribution.

```bash
sudo apt-get install libjack-jackd2-dev
sudo apt-get install portautio19-dev
```

### TO RUN

```bash
Using Dash ....: Search JTSDK, double click the JTSDK icon
Command Line ..: Open Terminal Ctrl+Alt+T, type: jtsdk
```

***

## Installation from Source Code

> NOTE - you should always use the latest tagged releases, even if this document referrs top an earlier version 

* Download - [jtsdk-nix-2.0.25.tar.gz](https://github.com/KI7MT/jtsdk-nix/tree/jtsdk-nix-2.0.25)

```bash
# Extrct the archive
tar -xf jtsdk-nix-2.0.25.tar.gz

# cd and build
./jtsdk-nix-2.0.25
./autogen.sh --prefix=/usr/local
make

# If there were no errors, make install
sudo make install

# To Run Type:
jtsdk
```

## Uninstall
For uninstalling a previously built and installed version:

```bash cd
# cd to original checkout
cd ./jtsdk-nix-2.0.25
./autogen.sh --prefix=/usr/local
make
sudo make uninstall
```

## Application Build Notes
* If building WSJT-X, build Hamlib3 first, then build WSJT-X.
* WSPR and WSJT do not require Hamlib3.
* Ensure you update Hamlib3 often, as updates are frequently posted.

## Setup Help
The best source of help in setting up your station or configuring WSJT-X is the
WSJT Group at (email address wsjtgroup@yahoogroups.com). The chances are good
that someone with similar interests and equipment has already solved your
problem and will be happy to help.

***

## REPORTING WSJT ISSUES

One of your responsibilities as a WSJT-X user is to help the volunteer
programmers to make the program better. Bugs may be reported to WSJT Group 
(email address wsjtgroup@yahoogroups.com) or the WSJT Developers list 
(wsjt-devel@lists.sourceforge.net). To be useful, bug reports should include
at least the following information:

* Program version
* Operating system
* Concise description of the problem
* Sequence of steps required to reproduce the problem

### Feature Requests
Suggestions from users often result in new program features. Good ideas are
always welcome: if there’s a feature you would like to see in WSJT-X, spell
it out in as much detail as seems useful and send it to us at one the the email
addresses given a few lines above. Be sure to explain why you think the feature
is desirable, and what sort of other users might find it so. 


### WSJT Project Information
* [Home Page](http://www.physics.princeton.edu/pulsar/K1JT/)
* [Program Development](http://physics.princeton.edu/pulsar/k1jt/devel.html)
* [WSJT Project](http://physics.princeton.edu/pulsar/k1jt/)

***

## REPORTING JTSDK ISSUES
Use : [JTSDK@Groups.io](https://groups.io/g/JTSDK)
