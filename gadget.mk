include common.mk

all: build

clean:
	rm -rf $(GADGET_DIR)/boot-assets
	rm -f $(GADGET_DIR)/uboot.conf
	rm -f $(GADGET_DIR)/uboot.env
	rm -f $(GADGET_SNAP)

distclean: clean

u-boot:
	@if [ ! -d $(GADGET_DIR)/boot-assets ] ; then mkdir $(GADGET_DIR)/boot-assets; fi
	@if [ ! -f $(UBOOT_BIN) ] ; then echo "Build u-boot first."; exit 1; fi
	cp -f $(UBOOT_BIN) $(GADGET_UBOOT)
	cp -f $(UBOOT_SPL) $(GADGET_SPL)

preload: u-boot
	mkenvimage -r -s 8192 -o $(GADGET_DIR)/uboot.env $(GADGET_DIR)/uboot.env.in
	@if [ ! -f $(GADGET_DIR)/uboot.conf ]; then ln -s uboot.env $(GADGET_DIR)/uboot.conf; fi
	cp -f $(GADGET_DIR)/uboot.conf $(GADGET_DIR)/boot-assets/uEnv.txt

snappy: preload
	snapcraft pack $(GADGET_DIR)

build: u-boot preload snappy

.PHONY: u-boot snappy gadget build preload
