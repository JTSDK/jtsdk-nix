# ------------------------------------------------------------------------------
#  check for python3 installation
# ------------------------------------------------------------------------------
AC_DEFUN([AC_PYTHON3_CHECK],[
AC_ARG_WITH([python3],
AC_HELP_STRING([--with-python3=PATH], [Path to python3]), [python3=$with_python3])

if test -n "$with_python3"; then
	AC_SUBST([PYTHON3], ["$with_python3"])

else
	AC_PATH_PROG([PYTHON3], [python3])
	AC_SUBST([PYTHON3], ["$ac_cv_path_PYTHON3"])

fi

]) # End Python3 Check
