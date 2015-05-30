AC_DEFUN([AC_BUILD_DOCS], [
	AC_ARG_ENABLE([docs],
		AC_HELP_STRING([--disable-docs], [Enable Building HTML Documentation]),
		[ac_cv_docs=yes], [ac_cv_docs=no])

if test "x$ac_cv_docs" = "xyes"; then
	BDOC=Yes
	AC_MSG_NOTICE([Enabled Building Documentation])
else
	BDOC=No
	AC_MSG_NOTICE([Disable Building Documentation])
fi
	AC_SUBST([BDOC], ["$BDOC"])

])
