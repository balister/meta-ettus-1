SUMMARY = "USRP DMA Engine interface library"
HOMEPAGE = "http://www.ettus.com/"
SECTION = "libs"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"

inherit autotools pkgconfig

S = "${WORKDIR}/git"

RDEPENDS_liberio = "libudev"
DEPENDS = "udev"

SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
SRC_URI = "git://github.com/EttusResearch/liberio.git;rev=d0e8a603f5f4dddf29764fc0fc6f6f965de77b8a"

FILES_${PN} = "${libdir}/lib*.so.* ${libdir}/lib*.la ${libdir}/liberio.pc"
FILES_${PN}-dev += "${includedir}/liberio/"

TARGET_CC_ARCH += "-pthread"

do_install_append() {
	rm ${D}/${bindir} -r
}

