FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI_ni-sulfur = " \
    file://gpsd-machine \
    file://device-hook \
"

SRC_URI_ettus-e300 = " \
    file://gpsd-machine \
    file://device-hook \
"

inherit update-alternatives

ALTERNATIVE_${PN}_ni-sulfur = "gpsd-defaults"
ALTERNATIVE_${PN}_ettus-e300 = "gpsd-defaults"
ALTERNATIVE_LINK_NAME[gpsd-defaults] = "${sysconfdir}/default/gpsd"
ALTERNATIVE_TARGET[gpsd-defaults] = "${sysconfdir}/default/gpsd.machine"
ALTERNATIVE_PRIORITY[gpsd-defaults] = "100"
COMPATIBLE_MACHINE = "ni-sulfur-rev6|ni-sulfur-rev5|ni-sulfur-rev4|ni-sulfur-rev3|ettus-e300"

RREPLACES_${PN} += "gpsd-conf"

do_install() {
    install -d ${D}/${sysconfdir}/default
    install -m 0644 ${WORKDIR}/gpsd-machine ${D}/${sysconfdir}/default/gpsd.machine
    install -d ${D}${sysconfdir}/gpsd/
    install -m 0755 ${WORKDIR}/device-hook ${D}/${sysconfdir}/gpsd/device-hook
}
