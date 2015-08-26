# ------------------------------------------------------------------------------
# Process this file with autoconf -*- autoconf -*-
# ------------------------------------------------------------------------------
AC_PREREQ([2.69])
AC_INIT([JTSDK],[2.0.13],[wsjt-devel@lists.sourceforge.net],[],
[http://physics.princeton.edu/pulsar/k1jt/devel.html])
JTSDK_AUTHORS="Greg Beam, Joseph H Taylor, and others"
JTSDK_COPYRIGHT="Copyright (C) 2014-2015 Joseph H Taylor, Jr, K1JT"

# ------------------------------------------------------------------------------
#  canonical host information
# ------------------------------------------------------------------------------
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_SRCDIR([src/jtsdk.in])
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
AC_PREFIX_DEFAULT("/usr")
if test "$prefix" = "NONE"; then 
	prefix=${ac_default_prefix}
fi


# ------------------------------------------------------------------------------
#  set path to Python2
# ------------------------------------------------------------------------------
AC_ARG_WITH([python2],
AC_HELP_STRING([--with-python2=PATH], [Path to python2]), [python2=$with_python2])

if test -n "$with_python2"; then
	AC_SUBST([PYTHON2], ["$with_python2"])

else
	AC_PATH_PROG([PYTHON2], [python])
	AC_SUBST([PYTHON2], ["$ac_cv_path_PYTHON2"])

fi

# ------------------------------------------------------------------------------
#  set path to Python3
# ------------------------------------------------------------------------------
AC_ARG_WITH([python3],
AC_HELP_STRING([--with-python3=PATH], [Path to python3]), [python3=$with_python3])

if test -n "$with_python3"; then
	AC_SUBST([PYTHON3], ["$with_python3"])

else
	AC_PATH_PROG([PYTHON3], [python3])
	AC_SUBST([PYTHON3], ["$ac_cv_path_PYTHON3"])

fi

# ------------------------------------------------------------------------------
#  set Path to F2PY3
# ------------------------------------------------------------------------------
AC_ARG_WITH([f2py3],
AC_HELP_STRING([--with-f2py3=PATH], [Path to f2py3]), [f2py3=$with_f2py3])

if test -n "$with_f2py3"; then
	AC_SUBST([F2PY3], ["$with_f2py3"])
else
	AC_PATH_PROG([F2PY3], [f2py3])
	AC_SUBST([F2PY3], ["$ac_cv_path_F2PY3"])
fi


# ------------------------------------------------------------------------------
#  set general use variables
# ------------------------------------------------------------------------------
LOGNAME="$LOGNAME"
BINDIR="$prefix/bin"
SHARE="$prefix/share/jtsdk"
MANDIR="$prefix/share/man/man1"
DOCDIR="$prefix/share/jtsdk/doc"
DTDIR="$prefix/share/applications"
MANSRC=$(exec pwd)/manpages
DOCSRC=$(exec pwd)/docs/source
DATASRC=$(exec pwd)/data

# Get Distro Information
distrosd=$(lsb_release -sd | tr -d [\(\)])
distrov=$(lsb_release -sr)
distroc=$(lsb_release -sc)


# ------------------------------------------------------------------------------
#  check general use tools
# ------------------------------------------------------------------------------
AC_PATH_PROG([ASCIIDOC], [asciidoc])
AC_PATH_PROG([A2X], [a2x])
AC_PATH_PROG([CHMOD], [chmod])
AC_PATH_PROG([CHOWN], [chown])
AC_PATH_PROG([CP], [cp])
AC_PATH_PROG([DIALOG], [dialog])
AC_PATH_PROG([INSTALL], [install])
AC_PATH_PROG([LN], [ln])
AC_PATH_PROG([MKDIR], [mkdir])
AC_PATH_PROG([MV], [mv])
AC_PATH_PROG([RM], [rm])
AC_PATH_PROG([SED], [sed])
AC_PATH_PROG([SHELL], [bash])
AC_PATH_PROG([TOUCH], [touch])
AC_PATH_PROG([PYTHON2], [python])
AC_PATH_PROG([PYTHON3], [python3])

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

# general subs
AC_SUBST([ASCIIDOC], ["$ASCIIDOC"])
AC_SUBST([A2X], ["$A2X"])
AC_SUBST([AUTHORS], ["$JTSDK_AUTHORS"])
AC_SUBST([BUGS], ["$PACKAGE_BUGREPORT"])
AC_SUBST([COPYRIGHT], ["$JTSDK_COPYRIGHT"])
AC_SUBST([DIALOG], ["$ac_cv_path_DIALOG"])
AC_SUBST([DATASRC], ["$DATASRC"])
AC_SUBST([DISTROV], [${distrov}])
AC_SUBST([DISTROC], [${distroc}])
AC_SUBST([DESC], [${distrosd}])
AC_SUBST([DOCSRC], ["$DOCSRC"])
AC_SUBST([DTDIR], ["$DTDIR"])
AC_SUBST([ICOND], [/usr/share/pixmaps])
AC_SUBST([LOGNAME], ["$LOGNAME"])
AC_SUBST([MANSRC], ["$MANSRC"])
AC_SUBST([PKGMGR], [${PKGMGR}])
AC_SUBST([PREFIX], ["$prefix"])
AC_SUBST([PROGRAM], ["$PACKAGE_NAME"])
AC_SUBST([PYTHON2], ["$ac_cv_path_PYTHON2"])
AC_SUBST([PYTHON3], ["$ac_cv_path_PYTHON3"])
AC_SUBST([WEB], ["$PACKAGE_URL"])
AC_SUBST([VERSION], ["$PACKAGE_VERSION"])

# system subs
AC_SUBST([BINDIR], ["$BINDIR"])
AC_SUBST([SHARE], ["$SHARE"])
AC_SUBST([MANDIR], ["$MANDIR"])
AC_SUBST([DOCDIR], ["$DOCDIR"])

# ------------------------------------------------------------------------------
#  configure makefiles and scripts
# ------------------------------------------------------------------------------
AC_CONFIG_FILES([
Makefile
src/jtsdk
src/jtsdk-hamlib3
src/jtsdk-wspr
src/jtsdk-wsjt
src/jtsdk-wsjtx
src/jtsdk-wsjtx-sb
data/jtsdk.desktop
data/jtsdk.menu
docs/Makefile
manpages/jtsdk.1.txt
manpages/jtsdk-hamlib3.1.txt
manpages/jtsdk-wsjt.1.txt
manpages/jtsdk-wsjtx.1.txt
manpages/jtsdk-wsjtx-sb.1.txt
manpages/jtsdk-wspr.1.txt
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
 Python2 Directory .........: ${PYTHON2}
 Python3 Directory .........: ${PYTHON3}
 F2PY3 Directory ...........: ${F2PY3}

 OPTIONS
 CPU Cores .................: ${JJJJ}
 With HTML Docs ............: ${BDOC}
 Enable Folder Separation ..: ${SEPARATE}

 Build ${PROGRAM}, type ....: make
"

