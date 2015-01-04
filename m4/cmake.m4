# ------------------------------------------------------------------------------
#  check for Cmake installation
# ------------------------------------------------------------------------------
AC_DEFUN([AC_CMAKE_CHECK],[

AC_PATH_PROG(CMAKE, cmake, [no])
AC_SUBST(CMAKE, ["$ac_cv_path_CMAKE"])

]) # End Gfortran Check
