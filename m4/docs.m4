AC_DEFUN([AC_BUILD_DOCS], [
	AC_ARG_ENABLE([docs],
		AC_HELP_STRING([--disable-docs], [Disable Building Documentation]),
		[ac_cv_docs=Yes], [])

if test "x$ac_cv_docs" = "xyes"; then
	BDOC=No
	AC_MSG_NOTICE([Build Documentation is Disabled])
else
	BDOC=Yes
	AC_MSG_NOTICE([Build Documentation is Enabled])
fi
	AC_SUBST([BDOC], ["$BDOC"])

])
