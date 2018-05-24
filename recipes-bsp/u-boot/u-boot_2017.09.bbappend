FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot-${PV}:"

require u-boot_2017.09.inc

SPL_BINARY = "spl/boot.bin"
SPL_BINARY = "boot.bin"
UBOOT_SUFFIX = "img"
UBOOT_BINARY = "u-boot.${UBOOT_SUFFIX}"

E3XX_PATCHES = " \
           file://0001-e3xx-Add-platform-definition-files-for-e3xx.patch \
           file://0002-e3xx-Add-device-tree-files-for-Ettus-E3xx-series.patch \
           file://0003-e3xx-Add-support-for-the-Ettus-Research-E3XX-family-.patch \
           file://0004-Add-support-for-mender.io-software-update.patch \
"

SRC_URI_append_ettus-e3xx-sg1 = " \
		 ${E3XX_PATCHES} \
		 file://fpga-1.bin \
		 "
SRC_URI_append_ettus-e3xx-sg3 = " \
		 ${E3XX_PATCHES} \
		 file://fpga-3.bin \
		 "
do_compile_append() {
	ln -sf ${B}/spl/${SPL_BINARY} ${B}/${SPL_BINARY}
}

do_deploy_append_ettus-e3xx-sg1() {
	cp ${WORKDIR}/fpga-1.bin ${DEPLOYDIR}/fpga.bin
}

do_deploy_append_ettus-e3xx-sg3() {
	cp ${WORKDIR}/fpga-3.bin ${DEPLOYDIR}/fpga.bin
}

