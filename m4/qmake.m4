# ------------------------------------------------------------------------------
#  check for Qmake installation
# ------------------------------------------------------------------------------
AC_DEFUN([AC_QMAKE_CHECK],[

AC_PATH_PROG(QMAKE, qmake, [no])
AC_SUBST(QMAKE, ["$ac_cv_path_QMAKE"])

]) # End Gfortran Check
