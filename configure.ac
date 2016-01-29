# ------------------------------------------------------------------------------
# Process this file with autoconf -*- autoconf -*-
# ------------------------------------------------------------------------------
AC_PREREQ([2.69])
AC_INIT([JTSDK],[2.0.19],[wsjt-devel@lists.sourceforge.net],[],
[http://physics.princeton.edu/pulsar/k1jt/devel.html])
JTSDK_AUTHORS="Greg Beam, Joseph H Taylor, and others"
JTSDK_COPYRIGHT="Copyright (C) Greg Beam (KI7MT), Joseph H Taylor, Jr (K1JT)"

AC_SUBST([PROGRAM], ["$PACKAGE_NAME"])
AC_SUBST([WEB], ["$PACKAGE_URL"])
AC_SUBST([VERSION], ["$PACKAGE_VERSION"])
AC_SUBST([AUTHORS], ["$JTSDK_AUTHORS"])
AC_SUBST([BUGS], ["$PACKAGE_BUGREPORT"])
AC_SUBST([COPYRIGHT], ["$JTSDK_COPYRIGHT"])

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
#  set general use variables
# ------------------------------------------------------------------------------
LOGNAME="$LOGNAME"
BINDIR="$prefix/bin"
SHARED="$prefix/share/jtsdk"
MANDIR="$prefix/share/man/man1"
DOCDIR="$prefix/share/jtsdk/doc"
DTDIR="$prefix/share/applications"
MENUDIR="$prefix/share/menu"
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
AC_PATH_PROG([ASCIIDOCTOR], [asciidoctor])
AC_PATH_PROG([A2X], [a2x])
AC_PATH_PROG(AWK, awk)
AC_PATH_PROG(CUT, cut)
AC_PATH_PROG(CHOWN, chown)
AC_PATH_PROG(CHMOD, chmod)
AC_PATH_PROG(HEAD, head)
AC_PATH_PROG([CHMOD], [chmod])
AC_PATH_PROG([CHOWN], [chown])
AC_PATH_PROG([CP], [cp])
AC_PATH_PROG([DIALOG], [dialog])
AC_PATH_PROG([INSTALL], [install])
AC_PATH_PROG([LN], [ln])
AC_PATH_PROG([MKDIR], [mkdir])
AC_PATH_PROG([MV], [mv])
AC_PATH_PROG([RM], [rm])
AC_PATH_PROG(SED, sed)
AC_PATH_PROG([SHELL], [bash])
AC_PATH_PROG(SORT, sort)
AC_PATH_PROG(TEST, [test], [test])
AC_PATH_PROG([TR], [tr])
AC_PATH_PROG([TOUCH], [touch])


# ------------------------------------------------------------------------------
#  set path to Python2
# ------------------------------------------------------------------------------
AC_JTSDK_PYTHON2

# ------------------------------------------------------------------------------
#  set path to Python3
# ------------------------------------------------------------------------------
AC_JTSDK_PYTHON3

# ------------------------------------------------------------------------------
#  set Path to F2PY3
# ------------------------------------------------------------------------------
AC_JTSDK_F2PY

# ------------------------------------------------------------------------------
#  check parallel option (m4)
# ------------------------------------------------------------------------------
AC_JTSDK_PARALLEL

# ------------------------------------------------------------------------------
#  check for building docs (m4)
# ------------------------------------------------------------------------------
AC_JTSDK_DOCS

# ------------------------------------------------------------------------------
#  check for building docs (m4)
# ------------------------------------------------------------------------------
AC_JTSDK_MANPAGES

# ------------------------------------------------------------------------------
#  separate SVN folders for each build (m4)
# ------------------------------------------------------------------------------
AC_JTSDK_SEPARATE

# ------------------------------------------------------------------------------
#  substitutions
# ------------------------------------------------------------------------------

# general subs
AC_SUBST([A2X], ["$A2X"])
AC_SUBST([ASCIIDOC], ["$ASCIIDOC"])
AC_SUBST([ASCIIDOCTOR], ["$ASCIIDOCTOR"])
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
echo ""
echo " Package ............: ${PROGRAM} ${VERSION}"
echo " Distribution .......: ${DESC} ${HOST_CPU}"
echo " Install prefix .....: ${PREFIX}"
echo " Python2 ............: ${PYTHON2} ${PY2V}"
echo " Python3 ............: ${PYTHON3} ${PY3V}"
echo " F2py ...............: ${F2PY}"
echo ''
echo 'JTSDK OPTIONS'
echo " CPU Cores ..........: ${JJJJ}"
if test "${BDOC}" = "Yes"; then
echo " With HTML Docs .....: ${BDOC}"
fi
if test "${BMANP}" = "Yes"; then
echo " With Manpages ......: ${BDOC}"
fi
if test "${SEPARATE}" = "Yes"; then
echo " Folder Separation ..: ${SEPARATE}"
fi
echo ''
echo 'JTSDK INFO'
echo " Copyright...........: ${COPYRIGHT}"
echo " Website ............: ${WEB}"
echo " Report Bugs To .....: ${BUGS}"
echo ''
echo "To Build, type ......: make"
echo ''

