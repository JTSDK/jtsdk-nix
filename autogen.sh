#!/bin/sh
#
# Name			: autogen.sh
# Execution		: As normal user ./autogen.sh
# Copyright		: Copyright (C) 2014 Joseph H Taylor, Jr, K1JT
# Contributors	: Greg Beam, Joseph H Taylor, and others
# Comment		: Part of the JTSDK Linux Project
#
# JTSDK is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation either version 3 of the License, or
# (at your option) any later version. 
#
# JTSDK is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#-------------------------------------------------------------------------#

set -e

BASED=$(exec pwd)
PROGRAM=JTSDK

# Foreground colours
C_R='\033[01;31m'	# red
C_G='\033[01;32m'	# green
C_Y='\033[01;33m'	# yellow
C_C='\033[01;36m'	# cyan
C_NC='\033[01;37m'	# no color

autogen_help() {
clear
echo \
'JTSDK Autogen Help Options

Distribution  Suported Release(s)
   debian        Jessie
   ubuntu        14.04 (includes Xubuntu, Lubuntu, Kubuntu)
   mint          17

Several options exist for pre-processing the configure script: 
--with-distro		# Set Linux / FreeSBD Distribution
--with-python3		# Alternate location for python3
--with-f2py3		# alternalte locaiton for f2py3
--enable-parallel	# Enables Multi-Core builds

STANDARD INVOCATION:
./autogen.sh --with-distro=ubuntu --enable-parallel=yes

WITH ADDITIONAL LOCATIONS:
./autogen.sh --with-distro=ubuntu \
--with-python3=/usr/local/bin/python3 \
--with-f2py3=/usr/local/bin/f2py3 \
--enable-parallel=yes'

echo
exit 0
}

# Start main script
cd $BASED

if [ "$1" = "help" ] ; then
	autogen_help
else
	autoconf --version > /dev/null 2>&1
fi

# message if autoconf was found "0"=OK, "1"=Not Found
if test "$?" -eq 1; then
	clear
	echo
	echo "You must have autoconf installed to compile $PROGRAM."
	echo "Install the appropriate package for your distribution,"
	echo
	exit 1
fi

# run make clean if makefile and configure are found
if test -f ./Makefile -a ./configure ; then
	clear
	echo '---------------------------------------------------'
	echo ${C_Y}"Checking for Old Makefile & Configure Script"${C_NC}
	echo '---------------------------------------------------'
	echo ''
	echo 'Found old files, running make clean first'
	echo ''
	make -s clean
	echo '---------------------------------------------------'
	echo ${C_Y}"Running ( autoconf -f -i ) to process configure.ac"${C_NC}
	echo '---------------------------------------------------'
	autoconf -f -i
else
	clear
	echo '---------------------------------------------------'
	echo ${C_Y}"Running ( autoconf -f -i ) to process configure.ac"${C_NC}
	echo '---------------------------------------------------'
	autoconf -f -i
fi

# simple test for the configure script, after running autogen.sh
if test -s ./configure; then
	echo "Finished"
	echo "Running ./configure to configure the build"
else
# message if configure was not found
	echo
	echo "There was a problem generating the configure script"
	echo "Check config.status for details."	
	echo
	exit 1
fi

# message if no arguments were presented
if test -z "$*"; then
	echo "Using with default arguments"
else
# List user input arguments
	echo "Using ./configure $@"
fi

$BASED/configure "$@"

exit 0
