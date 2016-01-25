AC_DEFUN([AC_BUILD_PARALLEL], [
	AC_ARG_ENABLE([parallel],
		AC_HELP_STRING([--disable-parallel], [Disable Multi-Core Builds]),
		[], [ac_cv_parallel=yes])

num1=`grep -c proc /proc/cpuinfo`
if test "x$ac_cv_parallel" = "xyes"; then
	case "$HOST_CPU" in
		armv6*|armv7*)
			AC_MSG_WARN([ARM Device detected, reducing cores by (1)])
			JJJJ=`expr $num1 - 1`
			AC_MSG_NOTICE([Multi-Core builds *enabled*. Using ( $JJJJ ) cores])
		;;
		*)
			JJJJ="$num1"
			AC_MSG_NOTICE([Multi-Core builds *enabled*. Using ( $JJJJ ) cores])
		;;
	esac
else
	JJJJ=1
	AC_MSG_NOTICE([Milti-Core builds *disabled*. Using ($JJJJ) cores])
fi
	AC_SUBST([JJJJ], ["$JJJJ"])

])
