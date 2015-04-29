# ------------------------------------------------------------------------------
#  check for SVN installation
# ------------------------------------------------------------------------------
AC_DEFUN([AC_SVN_CHECK],[

AC_PATH_PROG(SVN, svn, [no])
AC_SUBST(SVN, ["$ac_cv_path_SVN"])

]) # End Gfortran Check
