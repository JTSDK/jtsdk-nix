# ------------------------------------------------------------------------------
#  Debian distro config
# ------------------------------------------------------------------------------
AC_DEFUN([AC_DEBIAN_CONFIG],[
case "${DISTRO}" in
	debian )
		distrosd=$(lsb_release -sd)
		distrov=$(lsb_release -sr)
		case "${distrov}" in
			8.0 )
				AC_PATH_PROG([PKGMGR], [apt-get],[]) 
				# establish base package list
				# TO_DO: Test native install package requirments
				#        using both Pulseaudio and ALSA
BASE_LIST='automake clang-3.5 cmake dialog g++ gcc gettext gfortran git libfftw3-dev \
libhamlib-dev libhamlib-utils libqt5multimedia5-plugins libqt5serialport5-dev \
libsamplerate0-dev libtool libusb-dev packaging-dev pkg-config portaudio19-dev \
python3-dev python3-numpy python3-pil python3-pil.imagetk python3-pip \
python3-setuptools python3-tk python-dev qtmultimedia5-dev source-highlight \
subversion texinfo'

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
		;;
		* )
			ACTUAL=$(lsb_release -si)
			if test $(lsb_release -si) != "Debian"; then
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
				echo ' Supported Versions for Debian:'
				echo ''
				echo ' Debian ..: 8.0'
				echo ''
				echo ''
			fi
			exit 1
		;;
		esac
	;;
esac

# now substitute variables for the Makefile and install-dep target
AC_SUBST([PKGCOUNT], [${PKG_COUNT}])
AC_SUBST([PKGLIST], [${PKG_LIST}])
AC_SUBST([DESC], [${distrosd}])
AC_SUBST([PKGMGR], [${PKGMGR}])
AC_SUBST([DTDIR], [/usr/share/applications])
AC_SUBST([ICOND], [/usr/share/pixmap])
]) # End Debian distro config
