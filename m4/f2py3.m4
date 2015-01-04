# ------------------------------------------------------------------------------
#  check for f2py3 installation
# ------------------------------------------------------------------------------
AC_DEFUN([AC_F2PY3_CHECK],[
AC_ARG_WITH([f2py3],
AC_HELP_STRING([--with-f2py3=PATH], [Path to f2py3]), [f2py3=$with_f2py3])

if test -n "$with_f2py3"; then
	AC_SUBST([F2PY3], ["$with_f2py3"])

else
	AC_PATH_PROG([F2PY3], [f2py3])
	AC_SUBST(F2PY3, ["$ac_cv_path_F2PY3"])
fi


]) # End F2PY3 check

