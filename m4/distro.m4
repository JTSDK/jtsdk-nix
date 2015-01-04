# ------------------------------------------------------------------------------
#  get distro information
# ------------------------------------------------------------------------------
AC_DEFUN([DISTRO_CHECK],[
AC_ARG_WITH([distro],
AC_HELP_STRING([--with-distro=DISTRO], [Distro Name: (debian, ubuntu, mint etc)]), [distro=$with_distro])

if test -n "$with_distro" ; then
	AC_SUBST([DISTRO], ["$with_distro"])
fi

case "${DISTRO}" in
	ubuntu|kubuntu|xubuntu|lubuntu )
		ver=$(lsb_release -sr)
		desc=`(lsb_release -d |awk '{print $2}')`
		AC_SUBST([DESC], ["$desc"])
			case "${ver}" in

# Ubuntu 14..04
				14.04 )
					PKG_MGR="apt-get"
					PKG_LIST='autoconf automake autotools-dev gcc clang-3.5 cmake \
dialog g++ gettext gfortran git libtool libfftw3-dev libgfortran3:i386 \
libusb-dev libhamlib-dev libhamlib-utils libsamplerate0-dev pkg-config \
portaudio19-dev python-dev python3-dev python3-pil python3-pil.imagetk \
python3-tk python3-numpy python3-pip python3-setuptools qtmultimedia5-dev \
subversion texinfo xsltproc'
				AC_SUBST([PKGLIST], [${PKG_LIST}]) ;;
			* )
					AC_MSG_WARN([Unsupported Version: ${desc}])
					echo ''
					echo ' Supported Versions for Ubuntu and Friends:'
					echo ''
					echo ' Ubuntu ..: 14.04'
					exit 1 ;;
			esac ;;
	debian )
		ver=$(lsb_release -sr)
		desc=$(lsb_release -d) |cut -c2-4
		AC_SUBST([DESC], ["$desc"])
			case "${ver}" in

# Debian Jessie
				jessie )
					PKG_MGR="apt-get"
					PKG_LIST='autoconf automake autotools-dev gcc clang-3.5 cmake \
dialog g++ gettext gfortran git libtool libfftw3-dev libgfortran3:i386 \
libusb-dev libhamlib-dev libhamlib-utils libsamplerate0-dev pkg-config \
portaudio19-dev python-dev python3-dev python3-pil python3-pil.imagetk \
python3-tk python3-numpy python3-pip python3-setuptools qtmultimedia5-dev \
subversion texinfo xsltproc'
					AC_SUBST([PKGLIST], [${PKG_LIST}]) ;;
				* )
					AC_MSG_WARN([Unsupported Version: ${desc}])
					echo ''
					echo ' Supported Versions for Debian:'
					echo ''
					echo '   Debian ..: jessie'
					echo ''
					exit 1 ;;
			esac ;;
	mint )
		ver=$(lsb_release -sr)
		desc=$(lsb_release -d) |cut -c2-4
		AC_SUBST([DESC], ["$desc"])
			case "${ver}" in

# Mint 17	
				17 )
					PKG_MGR="apt-get"
					PKG_LIST='autoconf automake autotools-dev gcc clang-3.5 cmake \
dialog g++ gettext gfortran git libtool libfftw3-dev libgfortran3:i386 \
libusb-dev libhamlib-dev libhamlib-utils libsamplerate0-dev pkg-config \
portaudio19-dev python-dev python3-dev python3-pil python3-pil.imagetk \
python3-tk python3-numpy python3-pip python3-setuptools qtmultimedia5-dev \
subversion texinfo xsltproc'
					AC_SUBST([PKGLIST], [${PKG_LIST}]) ;;
				* )
					AC_MSG_WARN([Unsupported Version: ${desc}])
					echo
					echo ' Supported Versions for Mint:'
					echo ''
					echo '   Mint ..: 17'
					echo ''
					exit 1 ;;
				esac ;;
	* )
		AC_MSG_WARN([Unsupported Distribution: ${DISTRO}])
		echo ''
		echo ' You must specify a supported distribution in order to correctly '
		echo ' to configure the Makefiles. Supported Distributions:'
		echo ''
		echo ' Supported Distributions Versions < All Lower Case >:'
		echo '  Distribution   Version'
		echo '   debian         Jessie'
		echo '   ubuntu         14.04'
		echo '   mint           17'
		echo ''
		echo '   Note: Ubuntu includes Xubuntu, Lubuntu, Kubuntu'
		echo ''
		echo ' Example:'
		echo ' ./autogen.sh --with-distro=ubuntu'
		echo ''
		exit 0 ;;
esac
])
