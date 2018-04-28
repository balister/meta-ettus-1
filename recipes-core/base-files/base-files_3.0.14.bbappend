FILESEXTRAPATHS_prepend_ettus-e300 := "${THISDIR}/base-files/ettus-e300:"
FILESEXTRAPATHS_prepend_ni-sulfur := "${THISDIR}/base-files/sulfur:"

dirs755_append_ettus-e300 = " /media/FAT"

SRC_URI_append_ni-sulfur = " file://rfnoc-ports.conf \
                           "
do_install_append_ni-sulfur() {
	install -D -m 0644 ${WORKDIR}/rfnoc-ports.conf ${D}/${sysconfdir}/sysctl.d/rfnoc-ports.conf
}
