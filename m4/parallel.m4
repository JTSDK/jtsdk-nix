AC_DEFUN([AC_BUILD_PARALLEL], [
  AC_ARG_ENABLE([parallel],
                AC_HELP_STRING([--enable-parallel], [Enable Multi-Core Builds (--enable-parallel=yes)]),
                [case "${enableval}" in
                  yes|no) ac_cv_parallel="${enableval}" ;;
                  *)      AC_MSG_ERROR([bad value ${enableval} for --enable-parallel]) ;;
                 esac],
                 [ac_cv_parallel=no])

if test "x$ac_cv_parallel" = "xyes"; then
	JJJJ=$(grep -c proc /proc/cpuinfo)
	AC_MSG_NOTICE([Enabled Multi-Core Build ( $JJJJ ) Cores])
else
	JJJJ=1
	AC_MSG_NOTICE([Using Single Core For Builds])
fi
	AC_SUBST([JJJJ], ["$JJJJ"])

])
