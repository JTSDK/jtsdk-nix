AC_DEFUN([AC_BUILD_SEPARATE], [
	AC_ARG_ENABLE([separate],
		AC_HELP_STRING([--enable-separate], [Enable separate folders for each SVN revision]),
		[ac_cv_separate=yes], [ac_cv_separate=no])

if test "x$ac_cv_separate" = "xyes"; then
	SEPARATE=Yes
	AC_MSG_NOTICE([Sparate SVN folders is *enabled* for each build])
else
	SEPARATE=No
	AC_MSG_NOTICE([Sparate SVN folders is *disabled* for each build])
fi
	AC_SUBST([SEPARATE], ["$SEPARATE"])

])
