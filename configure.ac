# ------------------------------------------------------------------------------
# Process this file with autoconf -*- autoconf -*-
# ------------------------------------------------------------------------------
AC_PREREQ([2.69])
AC_INIT([JTSDK],[2.0.6],[wsjt-devel@lists.sourceforge.net],[],
[http://physics.princeton.edu/pulsar/k1jt/devel.html])
JTSDK_AUTHORS="Greg Beam, Joseph H Taylor, and others"
JTSDK_COPYRIGHT="Copyright (C) 2015 Joseph H Taylor, Jr, K1JT"

# ------------------------------------------------------------------------------
#  distro setup - dont waste time if distro is not supported
# ------------------------------------------------------------------------------
AC_ARG_WITH([distro],
AC_HELP_STRING([--with-distro=DISTRO], [Distro Name: (debian, ubuntu, mint)]), [distro=$with_distro])

if test -n "$with_distro" ; then
	DISTID=`echo ${with_distro} | tr A-Z a-z`
	AC_SUBST([DISTRO], ["$DISTID"])

	case "${DISTRO}" in
		ubuntu|kubuntu|xubuntu|lubuntu )
			AC_UBUNTU_CONFIG ;;
		debian )
			AC_DEBIAN_CONFIG ;;
		raspbian|rpi2 )
			AC_DEBIAN_CONFIG ;;
		mint )
			AC_MINT_CONFIG ;;
		* )
			echo ''
			AC_MSG_ERROR([Unsupported Distribution: ${DISTRO}

The Following distribuitons are currently supported:

 * Debian, Mint, Ubuntu
 * Ubuntu includes, Xubuntu, Lubuntu and Kubuntu
 * Debian included raspbian

 Usage:
 ./autogen.sh --with-distro=<distribution>

 For Ubuntu....: ./autogeh.sh --with-distro=ubuntu
 For Mint......: ./autogeh.sh --with-distro=mint
 For Debian....: ./autogeh.sh --with-distro=debian
 For Raspbian..: ./autogeh.sh --with-distro=debian
 
])	;;
	esac
else
	AC_MSG_WARN([Distribution Not Specified])
	echo ''
	echo ' You must specify a supported distribution in order to'
	echo ' configure the Makefiles. Supported Distributions:'
	echo ''
	echo '  Distribution   Version'
	echo '   Debian         Jessie   or  later (8.*)'
	echo '   Mint           Rebecca  or  later (17.*)'
	echo '   Ubuntu         Trusty   or  later (14.04* | 14.10* |15.04*)'
	echo ''
	echo '   Note(s):'
	echo '    1. Ubuntu includes Xubuntu, Lubuntu, Kubuntu'
	echo '    2. Debian includes Raspbian'
	echo '    3. You do not need to specify the version'
	echo ''
	echo '   Ubuntu, type ....: ./autogeh.sh --with-distro=ubuntu'
	echo '   Mint, type ......: ./autogen.sh --with-distro=mint'
	echo '   Debian, type ....: ./autogen.sh --with-distro=debian'
	echo '   Raspbian, type ..: ./autogen.sh --with-distro=debian'
	echo ''
	exit 1
fi

# ------------------------------------------------------------------------------
#  canonical host information
# ------------------------------------------------------------------------------
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_SRCDIR([src/jtsdk.sh.in])
AC_CONFIG_MACRO_DIR([m4])
AC_CANONICAL_HOST
AC_DEFINE_UNQUOTED(_NAME, "${host}",[Canonical name (cpu-vendor-os) of your system.])
AC_DEFINE_UNQUOTED(_CPU, "${host_cpu}",[Name of the CPU of your system.])
AC_DEFINE_UNQUOTED(_VENDOR, "${host_vendor}",[Name of the vendor of your system.])
AC_DEFINE_UNQUOTED(_OS, "${host_os}",[Name of the OS of your system.])
AC_SUBST(HOST_NAME, [${host}])
AC_SUBST(HOST_OS, [${host_os}])
AC_SUBST(HOST_CPU, [${host_cpu}])

# ------------------------------------------------------------------------------
#  set default install path
# ------------------------------------------------------------------------------
AC_PREFIX_DEFAULT("/usr/local")
if test "$prefix" = "NONE"; then 
	prefix=${ac_default_prefix}
fi

# ------------------------------------------------------------------------------
#  enable user defined paths and options
# ------------------------------------------------------------------------------

AC_ARG_WITH([homedir],
AC_HELP_STRING([--with-homedir=PATH], [Home directory path]), [homedir=$with_homedir])
if test -n "$with_homedir"; then
	AC_SUBST([HOMEDIR], ["$with_homedir"])
else
	AC_SUBST([HOMEDIR], ["/home/$LOGNAME/jtsdk"])
fi

# ------------------------------------------------------------------------------
#  system and $USER paths ( also used in build scripts )
# ------------------------------------------------------------------------------
LOGNAME=$LOGNAME
BINDIR="$prefix"/bin
SHARE="$prefix"/share/jtsdk
MANDIR="$prefix"/share/man/man1
DOCDIR="$prefix"/share/jtsdk/doc
DOCSRC=$(exec pwd)/docs/source
SRCD="$HOMEDIR/src"
TMPD="$HOMEDIR/tmp"
LOGD="$HOMEDIR/logs"
MKRD="$HOMEDIR/mkrd"

# hamlib3 directories
HL3SRC="$HOMEDIR/src/g4wjs-hamlib"
HL3B="$HOMEDIR/src/build/hamlib"
HL3I="$HOMEDIR/hamlib3"

# ------------------------------------------------------------------------------
#  check compilers
# ------------------------------------------------------------------------------
OCFLAGS="$CFLAGS"
AC_PROG_CC
AC_PROG_CXX
AC_PROG_FC
AC_PROG_GCC_TRADITIONAL
AC_PROG_MAKE_SET
AC_PROG_RANLIB
AC_USE_SYSTEM_EXTENSIONS
CFLAGS="$OCFLAGS"

# ------------------------------------------------------------------------------
#  check general use tools
# ------------------------------------------------------------------------------
AC_PATH_PROG([AWK], [awk])
AC_PATH_PROG([SHELL], [bash])
AC_PATH_PROG([CHOWN], [chown])
AC_PATH_PROG([CHMOD], [chmod])
AC_PATH_PROG([CP], [cp])
AC_PATH_PROG([INSTALL], [install])
AC_PATH_PROG([LN], [ln])
AC_PATH_PROG([MKDIR], [mkdir])
AC_PATH_PROG([MV], [mv])
AC_PATH_PROG([RM], [rm])
AC_PATH_PROG([SED], [sed])
AC_PATH_PROG([TAR], [tar])
AC_PATH_PROG([TOUCH], [touch])
AC_PATH_PROG([ASCIIDOC], [asciidoc])
AC_PATH_PROG([A2X], [a2x])

# ------------------------------------------------------------------------------
#  check gfortran (m4)
# ------------------------------------------------------------------------------
AC_GFORTRAN_CHECK

# ------------------------------------------------------------------------------
#  check for python3 installation (m4)
# ------------------------------------------------------------------------------
AC_PYTHON3_CHECK

# ------------------------------------------------------------------------------
#  check for f2py3 installation (m4)
# ------------------------------------------------------------------------------
AC_F2PY3_CHECK

# ------------------------------------------------------------------------------
#  check for Git (m4)
# ------------------------------------------------------------------------------
AC_GIT_CHECK

# ------------------------------------------------------------------------------
#  check for SVN (m4)
# ------------------------------------------------------------------------------
AC_SVN_CHECK

# ------------------------------------------------------------------------------
#  check for Cmake (m4)
# ------------------------------------------------------------------------------
AC_CMAKE_CHECK

# ------------------------------------------------------------------------------
#  check for Qmake (m4)
# ------------------------------------------------------------------------------
AC_QMAKE_CHECK

# ------------------------------------------------------------------------------
#  check parallel option (m4)
# ------------------------------------------------------------------------------
AC_BUILD_PARALLEL

# ------------------------------------------------------------------------------
#  check for building docs (m4)
# ------------------------------------------------------------------------------
AC_BUILD_DOCS

# ------------------------------------------------------------------------------
#  separate SVN folders for each build (m4)
# ------------------------------------------------------------------------------
AC_BUILD_SEPARATE

# ------------------------------------------------------------------------------
#  substitutions
# ------------------------------------------------------------------------------

# package subs
AC_SUBST([LOGNAME], ["$LOGNAME"])
AC_SUBST([PREFIX], ["$prefix"])
AC_SUBST([PROGRAM], ["$PACKAGE_NAME"])
AC_SUBST([VERSION], ["$PACKAGE_VERSION"])
AC_SUBST([BUGS], ["$PACKAGE_BUGREPORT"])
AC_SUBST([WEB], ["$PACKAGE_URL"])
AC_SUBST([AUTHORS], ["$JTSDK_AUTHORS"])
AC_SUBST([COPYRIGHT], ["$JTSDK_COPYRIGHT"])
AC_SUBST([DOCSRC], ["$DOCSRC"])
AC_SUBST([ASCIIDOC], ["$ASCIIDOC"])
AC_SUBST([A2X], ["$A2X"])

# system subs
AC_SUBST([BINDIR], ["$BINDIR"])
AC_SUBST([SHARE], ["$SHARE"])
AC_SUBST([MANDIR], ["$MANDIR"])
AC_SUBST([DOCDIR], ["$DOCDIR"])

# home directory subs
AC_SUBST([HOMEDIR], ["$HOMEDIR"])
AC_SUBST([SRCD], ["$SRCD"])
AC_SUBST([TMPD], ["$TMPD"])
AC_SUBST([LOGD], ["$LOGD"])
AC_SUBST([MKRD], ["$MKRD"])
AC_SUBST([ADOCD], ["$ADOCD"])

# hamlib3 subs
AC_SUBST([HL3SRC], ["$HL3SRC"])
AC_SUBST([HL3B], ["$HL3B"])
AC_SUBST([HL3I], ["$HL3I"])

# ------------------------------------------------------------------------------
#  configure makefiles and scripts
# ------------------------------------------------------------------------------
AC_CONFIG_FILES([
Makefile
src/jtsdk.sh
src/jtsdk-hamlib3.sh
src/jtsdk-wspr.sh
src/jtsdk-wsjt.sh
src/jtsdk-wsjtx.sh
data/jtsdk.desktop
docs/Makefile
manpages/jtsdk.1.txt
manpages/Makefile
])
AC_OUTPUT

# ------------------------------------------------------------------------------
#  configure summary
# ------------------------------------------------------------------------------
echo ''
echo '-------------------------------------------------'
echo 'Configuration Summary'
echo '-------------------------------------------------'
echo "
 Package ...................: ${PROGRAM} ${VERSION}
 Distribution ..............: ${DESC} ${HOST_CPU}
 Install prefix ............: ${PREFIX}
 Working Directory .........: ${HOMEDIR}
 Python3 Directory .........: ${PYTHON3}
 F2PY3 Directory ...........: ${F2PY3}
 Needed Packages ...........: ${PKG_COUNT}
 
 OPTIONS
 CPU Cores .................: ${JJJJ}
 With HTML Docs ............: ${BDOC}
 Enable Folder Separation ..: ${SEPARATE}
"
if test ${PKGCOUNT} -gt 0 ; then
echo ' ADDITIONAL PACKAGES NEEDED'
echo ' * List needed pkgs ........: make list-needed'
echo ' * Install pkgs ............: make'
echo ''
else
echo " Build ${PROGRAM}, type .........: make"
echo ''
echo ''
fi
