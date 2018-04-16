FILESEXTRAPATHS_prepend_ettus-e300 := "${THISDIR}/ettus-e300-2017.3:"

SRC_URI_append_ettus-e300 = "\
                  file://axi-fpga.scc \
                  file://axi-fpga.cfg \
                  file://ettus-e300.scc \
                  file://ettus-e300.cfg \
                  file://usb-audio.cfg \
                  file://usb-wifi.cfg \
                  file://usb-serial.cfg \
                  file://usb-cam.cfg \
                  file://bluetooth.cfg \
		"

COMPATIBLE_MACHINE_ettus-e300 = "ettus-e3xx-sg3|ettus-e3xx-sg1"

#KCONFIG_MODE ?= "--alldefconfig"
KBUILD_DEFCONFIG_ettus-e300 = "xilinx_zynq_defconfig"
