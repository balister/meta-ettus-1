SUMMARY = "Simple program to connect a 9-dof IMU to an embedded Linux system."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=37115da1c12308918756b9c3b42627c8"

SRC_URI = "git://github.com/balister/RTIMULib.git;protocol=http \
           file://0001-If-ini-file-is-not-found-in-the-current-working-dire.patch \
           "

SRC_URI_append_ettus-e300 = " file://RTIMULib.ini"

SRCREV = "fe59096a7a3c96a4465be3dec39e059b23469e2a"

S = "${WORKDIR}/git"

inherit cmake qt4x11

export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                        -DQT_LRELEASE_EXECUTABLE=${OE_QMAKE_LRELEASE} \
                        -DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
                        -DQT_UIC_EXECUTABLE=${OE_QMAKE_UIC} \
                        -DQT_RCC_EXECUTABLE=${OE_QMAKE_RCC} \
                        -DQT_LIBRARY_DIR=${OE_QMAKE_LIBDIR_QT} \
                        -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
                        -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
                        "

do_configure() {
	# Ensure we get the cmake configure and not qmake
	cmake_do_configure
}

do_install_append() {
	install -d ${D}/${sysconfdir}
	install -m 0644 ${WORKDIR}/RTIMULib.ini ${D}/${sysconfdir}
}

SOLIBS = ".so"
SOLIBSDEV = "xxx"

PACKAGES =+ "${PN}-conf"

FILES_${PN}-conf = "${sysconfdir}/RTIMULib.ini"
