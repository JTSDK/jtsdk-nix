# ------------------------------------------------------------------------------
#  check for Git installation
# ------------------------------------------------------------------------------
AC_DEFUN([AC_GIT_CHECK],[

AC_PATH_PROG(GIT, git, [no])
AC_SUBST(GIT, ["$ac_cv_path_GIT"])

]) # End Gfortran Check
