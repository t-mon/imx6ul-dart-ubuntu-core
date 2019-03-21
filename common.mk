# compiler
ARCH := arm
CC := arm-linux-gnueabihf-
CPUS := $(shell getconf _NPROCESSORS_ONLN)

# Build output
OUTPUT_DIR := $(PWD)

# kernel
KERNEL_DIR := $(PWD)/kernel
KERNEL_NAME := `grep name: $(KERNEL_DIR)/snapcraft.yaml | awk '{print $$2}'`
KERNEL_VERSION := `grep version: $(KERNEL_DIR)/snapcraft.yaml | awk '{print $$2}'`
KERNEL_DTS := imx6ul-var-dart-sd_emmc

# gadget
GADGET_DIR := $(OUTPUT_DIR)/gadget
GADGET_NAME := `grep name $(GADGET_DIR)/meta/snap.yaml | awk '{print $$2}'`
GADGET_VERSION := `grep version $(GADGET_DIR)/meta/snap.yaml | awk '{print $$2}'`
GADGET_UBOOT := $(GADGET_DIR)/boot-assets/u-boot.img
GADGET_SPL := $(GADGET_DIR)/boot-assets/SPL

# snaps
GADGET_SNAP := $(GADGET_NAME)_$(GADGET_VERSION)_armhf.snap
KERNEL_SNAP := $(KERNEL_NAME)_$(KERNEL_VERSION)_armhf.snap

# u-boot
UBOOT_SRC := $(PWD)/u-boot
UBOOT_REPO := https://github.com/varigit/uboot-imx.git
UBOOT_BRANCH := imx_v2017.03_4.9.11_1.0.0_ga_var01
UBOOT_DEFCONFIG := mx6ul_var_dart_mmc_defconfig
UBOOT_OUT := $(PWD)/u-boot-build
UBOOT_SPL := $(UBOOT_OUT)/SPL
UBOOT_BIN := $(UBOOT_OUT)/u-boot.img

# image
IMAGE_SIZE := 1G
IMAGE_MODEL := $(PWD)/model/imx6ul-dart.model
IMAGE_OUTPUT_DIR := $(OUTPUT_DIR)/image
IMAGE_DEFAULT_NAME := $(IMAGE_OUTPUT_DIR)/imx6ul-dart.img
UBUNTU_CORE_CHANNEL = stable
UBUNTU_IMAGE_TOOL := /snap/bin/ubuntu-image
SNAPPY_IMAGE := $(IMAGE_OUTPUT_DIR)/ubuntu-core-imx6ul-dart-nymea-$(UBUNTU_CORE_CHANNEL)-`date +%Y%m%d`.img
