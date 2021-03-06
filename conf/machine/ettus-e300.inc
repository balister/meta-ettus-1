#@TYPE: Machine
#@Name: Ettus Research E3XX.
#@DESCRIPTION: Machine configuration for the Ettus Research E3XX Software Radio.

PREFERRED_PROVIDER_virtual/kernel ?= "linux-xlnx"

require ettus-zynq.inc
require conf/machine/include/machine-xilinx-default.inc
require conf/machine/include/machine-xilinx-board.inc

KERNEL_EXTRA_ARGS_ettus-e300 = "UIMAGE_LOADADDR=0x8000"

KERNEL_CLASSES += "kernel-fitimage"
KERNEL_IMAGETYPE = "fitImage"

MACHINEOVERRIDES = "ettus-e300:${MACHINE}"

MACHINE_FEATURES = "vfat ethernet alsa usbhost bluetooth ext2 wifi"

SERIAL_CONSOLE = "115200 ttyPS0"

UBOOT_BINARY_ettus-e300 = "u-boot.${UBOOT_SUFFIX}"

MACHINE_EXTRA_RRECOMMENDS = "kernel-modules acpid rtimulib rtimulib-conf \
                             e3xx-udev-rules \
                             gpsd gps-config gpsd-gpsctl gps-utils \
                            "

IMAGE_BOOT_FILES += "boot.bin fpga.bin"

IMAGE_FSTYPES += "wic wic.bmap"
WKS_FILE ?= "e300-sd.wks"

