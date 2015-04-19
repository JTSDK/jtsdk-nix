# ------------------------------------------------------------------------------
#  ubuntu distro config
# ------------------------------------------------------------------------------
AC_DEFUN([AC_UBUNTU_CONFIG],[
case "${DISTRO}" in
	ubuntu|kubuntu|xubuntu|lubuntu )
	distrosd=$(lsb_release -sd)
	distrov=$(lsb_release -sr)

pilpkgs='libfreetype6-dev libjpeg-dev liblcms2-dev libtiff5-dev libwebp-dev \
libwebpmux1 mime-support tcl8.6-dev tk8.6-dev zlib1g-dev'

basepkgs='automake clang-3.5 cmake dialog g++ gettext gfortran git libfftw3-dev \
libhamlib-dev libhamlib-utilslibqt5multimedia5-plugins libqt5serialport5-dev \
libqt5opengl5-dev libsamplerate0-dev libtool libusb-dev packaging-dev \
pkg-config portaudio19-dev python3-pil python3-pil.imagetk python3-tk \
python3-dev python3-numpy python3-pip python3-setuptools python-dev \
qtbase5-dev qtmultimedia5-dev source-highlight subversion texinfo'

		case "${distrov}" in
			14.04*|14.10|15.04)
				AC_PATH_PROG([PKGMGR], [apt-get],[]) 

				# configure package list based on distro version
				case "${distrov}" in
					14.04 )
						BASE_LIST="${basepkgs}"
					;;
					14.10 )
						BASE_LIST="${basepkgs}  ${pilpkgs}"
					;;
					15.04 )
					BASE_LIST="${basepkgs}"
					;;
				esac

	# sort the listing into a file
	if test -f needed.txt ; then rm -f needed.txt ; fi
	if test -f installed.txt ; then rm -f installed.txt ; fi
	echo $BASE_LIST |tr ' ' '\n'|sort -su |awk '{if (NR!=1) {print}}' > temp.list
			
	# loop through temp.list
	while read line
	do
	apt-cache policy $line |grep '(none)' >/dev/null 2>&1
		if test $? = "0" ; then
			echo "$line" >> needed.txt
		else
			echo "$line" >> installed.txt
		fi
	done < temp.list

		# if needed.txt is not empty, add to $PKG_LIST
		if test -s needed.txt ; then
			PKG_COUNT=$(cat needed.txt |wc -l)
			PKG_LIST=$(cat needed.txt |tr ' ' '\n' |sort -su |tr '\n' ' ')	
			rm -f temp.list
			cp needed.txt orig-needed.txt
			cp installed.txt orig-install.txt
			AC_DEFINE([PKG_NEEDED], [1], [${PKG_COUNT}: Package(s) Needed for Installation])
		else
			PKG_COUNT=0
		fi			

	# Pip-3 Commands, whether python3-pil is installed or not
	apt-cache policy python-pil |grep 'Installed' > /dev/null 2>&1
	if test $? = "1" ; then pip_command='sudo pip3 install pillow' ; fi
	if test $? = "0" ; then pip_command='sudo pip3 install --upgrade pillow' ; fi
	;;
	* )
		ACTUAL=$(lsb_release -si)
		if test $(lsb_release -si) != "Ubuntu"; then
			AC_MSG_WARN([Wrong Distribution ${DISTRO}])
			echo ''
			echo 'Are you sure you set the correct distribution name?'
			echo " Set Name .....: --with-distro=$DISTRO"
			echo " Actual Name ..: --with-distro="`echo $ACTUAL | perl -ne 'print lc'`
			echo ''
			echo ''
		else
			AC_MSG_WARN([Unsupported Version: ${distrov}])
			echo ''
			echo ' Supported Versions for Ubuntu:'
			echo ''
			echo ' Ubuntu ..: 14.04'
			echo ''
			echo ''
		fi
		exit 1
		;;
	esac
	;;
esac

# now substitute variables for the Makefile and install-dep target
AC_SUBST([PIPCOMMAND], [${pip_command}])
AC_SUBST([DISTROV], [${distrov}])
AC_SUBST([PKGCOUNT], [${PKG_COUNT}])
AC_SUBST([PKGLIST], [${PKG_LIST}])
AC_SUBST([DESC], [${distrosd}])
AC_SUBST([PKGMGR], [${PKGMGR}])
AC_SUBST([DTDIR], [/usr/share/applications])
AC_SUBST([ICOND], [/usr/share/pixmaps])
]) # End Ubuntu distro config

