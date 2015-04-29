AC_DEFUN([AC_BUILD_PARALLEL], [
	AC_ARG_ENABLE([parallel],
		AC_HELP_STRING([--disable-parallel], [Disable Multi-Core Builds]),
		[], [ac_cv_parallel=yes])

if test "x$ac_cv_parallel" = "xyes"; then
	JJJJ=$(grep -c proc /proc/cpuinfo)
	AC_MSG_NOTICE([Multi-Core builds *enabled*. Using ( $JJJJ ) cores])
else
	JJJJ=1
	AC_MSG_NOTICE([Milti-Core builds *disabled*. Using ($JJJJ) cores])
fi
	AC_SUBST([JJJJ], ["$JJJJ"])

])
