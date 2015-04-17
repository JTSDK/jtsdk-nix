# ------------------------------------------------------------------------------
# Process this file with autoconf -*- autoconf -*-
# ------------------------------------------------------------------------------
AC_PREREQ([2.69])
AC_INIT([JTSDK],[2.0.0],[wsjt-devel@lists.sourceforge.net],[],
[http://physics.princeton.edu/pulsar/k1jt/devel.html])
JTSDK_AUTHORS="Greg Beam, Joseph H Taylor, and others"
JTSDK_COPYRIGHT="Copyright (C) 2015 Joseph H Taylor, Jr, K1JT"

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
#  system install paths ( also used in build scripts )
# ------------------------------------------------------------------------------
LOGNAME=$LOGNAME
BINDIR="$prefix"/bin
SHARE="$prefix"/share/jtsdk
MANDIR="$prefix"/share/man/man1
DOCDIR="$prefix"/share/jtsdk/doc

# ------------------------------------------------------------------------------
#  $USER paths ( also used in build scripts )
# ------------------------------------------------------------------------------
SRCD="$HOMEDIR/src"
TMPD="$HOMEDIR/tmp"
LOGD="$HOMEDIR/logs"
MKRD="$HOMEDIR/mkrd"
ADOCD="$HOMEDIR/asciidoc"

# hamlib3 directories
HL3SRC="$HOMEDIR/src/g4wjs-hamlib"
HL3B="$HOMEDIR/src/build/hamlib"
HL3I="$HOMEDIR/hamlib3"

# ------------------------------------------------------------------------------
#  Application Install Paths ( used in build scripts )
# ------------------------------------------------------------------------------

# install directories
WSJTI="$HOMEDIR/wsjt/install"
WSPRI="$HOMEDIR/wspr/install"

# WSJTX 1.6.0 devel (adds JT4 Mode)
WSJTXEXPIR="$HOMEDIR/wsjtxexp/install/release"
WSJTXEXPID="$HOMEDIR/wsjtxexp/install/debug"

# WSJTX 1.5.0 devel
WSJTXIR="$HOMEDIR/wsjtx/install/release"
WSJTXID="$HOMEDIR/wsjtx/install/debug"

# WSJTX 1.4.0 RC
WSJTXRCIR="$HOMEDIR/wsjtxrc/install/release"
WSJTXRCID="$HOMEDIR/wsjtxrc/install/debug"

# WSPR
WSPRXIR="$HOMEDIR/wsprx/install/release"
WSPRXID="$HOMEDIR/wsprx/install/debug"

# MAP65
MAP65IR="$HOMEDIR/map65/install/release"
MAP65ID="$HOMEDIR/map65/install/debug"

# build directories
# WSJTX 1.6.0 exp (add JT4 mode)
WSJTXEXPBR="$HOMEDIR/wsjtxexp/build/release"
WSJTXEXPBD="$HOMEDIR/wsjtxexp/build/debug"

# WSJTX 1.5.0 devel
WSJTXBR="$HOMEDIR/wsjtx/build/release"
WSJTXBD="$HOMEDIR/wsjtx/build/debug"

# WSJTX 1.4 RC
WSJTXRCBR="$HOMEDIR/wsjtxrc/build/release"
WSJTXRCBD="$HOMEDIR/wsjtxrc/build/debug"

# WSPRX
WSPRXBR="$HOMEDIR/wsprx/build/release"
WSPRXBD="$HOMEDIR/wsprx/build/debug"

# MAP65
MAP65BR="$HOMEDIR/map65/build/release"
MAP65BD="$HOMEDIR/map65/build/debug"

# package directories
WSJTXPD="$HOMEDIR/wsjtx/package"
WSJTXEXPPD="$HOMEDIR/wsjtxexp/package"
WSJTXRCPD="$HOMEDIR/wsjtxrc/package"

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
AC_PATH_PROG([TOUCH], [touch])

# ------------------------------------------------------------------------------
#  distro setup
# ------------------------------------------------------------------------------
AC_ARG_WITH([distro],
AC_HELP_STRING([--with-distro=DISTRO], [Distro Name: (debian, ubuntu, mint etc)]), [distro=$with_distro])

if test -n "$with_distro" ; then
	AC_SUBST([DISTRO], ["$with_distro"])

	case "${DISTRO}" in
		ubuntu|kubuntu|xubuntu|lubuntu )
			AC_UBUNTU_CONFIG ;;
		debian )
			AC_DEBIAN_CONFIG ;;
		mint )
			AC_MINT_CONFIG ;;
		* )
			AC_MSG_ERROR([Unsupported Distribution: ${DISTRO}

The Following distribuitons are currently supported:

 * debian, mint, ubuntu
 * ubuntu includes, xubuntu, lubuntu and kubuntu

 Usage:
 ./autogen.sh --with-distro=<distribution>

 Example:
 ./autogen.sh --with-distro=ubuntu
 
]) 	;;
	esac
else
	AC_MSG_WARN([Distribution Not Specified])
	echo ''
	echo ' You must specify a supported distribution in order to'
	echo ' configure the Makefiles. Supported Distributions:'
	echo ''
	echo '  Distribution   Version'
	echo '   debian         Jessie  (8.0)'
	echo '   ubuntu         Trusty  (14.04)'
	echo '   mint           Rebecca (17.1)'
	echo ''
	echo '   Note(s):'
	echo '    1. Ubuntu includes Xubuntu, Lubuntu, Kubuntu'
	echo '    2. You do not need to specify the version'
	echo ''
	echo '   Usage: ./autogen.sh --with-distro=<distribution>'
	echo ''
	echo '   Example:'
	echo '   ./autogen.sh --with-distro=ubuntu'
	echo ''
	exit 1
fi

# ------------------------------------------------------------------------------
#  check parallel option
# ------------------------------------------------------------------------------
AC_BUILD_PARALLEL

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

# application install subs
AC_SUBST([WSJTI], ["$WSJTI"])
AC_SUBST([WSPRI], ["$WSPRI"])

# WSJTX-EXP v1.6.0 
AC_SUBST([WSJTXEXPIR], ["$WSJTXEXPIR"])
AC_SUBST([WSJTXEXPID], ["$WSJTXEXPID"])

# WSJTX v1.5.0
AC_SUBST([WSJTXIR], ["$WSJTXIR"])
AC_SUBST([WSJTXID], ["$WSJTXID"])

# WSJTX v1.4.0 Release Candidate
AC_SUBST([WSJTXRCIR], ["$WSJTXRCIR"])
AC_SUBST([WSJTXRCID], ["$WSJTXRCID"])

AC_SUBST([WSPRXIR], ["$WSPRXIR"])
AC_SUBST([WSPRXID], ["$WSPRXID"])

AC_SUBST([MAP65IR], ["$MAP65IR"])
AC_SUBST([MAP65ID], ["$MAP65ID"])

# application build subs

# WSJTX v1.6.0 EXP
AC_SUBST([WSJTXEXPBR], ["$WSJTXEXPBR"])
AC_SUBST([WSJTXEXPBD], ["$WSJTXEXPBD"])

# WSJTX v1.5.0
AC_SUBST([WSJTXBR], ["$WSJTXBR"])
AC_SUBST([WSJTXBD], ["$WSJTXBD"])

# WSJTX v1.4.0 RC
AC_SUBST([WSJTXRCBR], ["$WSJTXRCBR"])
AC_SUBST([WSJTXRCBD], ["$WSJTXRCBD"])

AC_SUBST([WSPRXBR], ["$WSPRXBR"])
AC_SUBST([WSPRXBD], ["$WSPRXBD"])

AC_SUBST([MAP65BR], ["$MAP65BR"])
AC_SUBST([MAP65BD], ["$MAP65BD"])

# package subs
AC_SUBST([WSJTXPD], ["$WSJTXPD"])
AC_SUBST([WSJTXEXPPD], ["$WSJTXEXPPD"])
AC_SUBST([WSJTXRCPD], ["$WSJTXRCPD"])


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
src/jtsdk-map65.sh
src/jtsdk-wsprx.sh
data/jtsdk.desktop
])
AC_OUTPUT
# ------------------------------------------------------------------------------
#  configure summary
# ------------------------------------------------------------------------------

if test "$PKGCOUNT" -gt "0" ; then
echo "
-------------------------------------------------

 ADDITIONAL PACKAGES REQUIRED
 
 Configuration finished, however, you have
 ( ${PKG_COUNT} ) package(s) that should be installed
 before you run make install.
 
 * List Needed Packages, type ....: make list-needed
 * Simulate Installation, type ...: make simulate
 * Install Packages, type ........: make
 
-------------------------------------------------
"
else
echo ''
echo '-------------------------------------------------'
echo 'Configuration Summary'
echo '-------------------------------------------------'
echo "
 Package: ...........: ${PROGRAM} ${VERSION}
 Distribution .......: ${DESC} ${HOST_CPU}
 Install prefix .....: ${PREFIX}
 Working Directory ..: ${HOMEDIR}
 Needed Packages ....: ${PKG_COUNT}

 To Install ,type ...: sudo make install

"
fi
