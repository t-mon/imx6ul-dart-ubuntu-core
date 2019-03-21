include common.mk

all: build

clean:
	cd $(KERNEL_DIR); snapcraft clean

distclean: clean
	cd $(KERNEL_DIR); snapcraft clean

build:
	cd $(KERNEL_DIR); snapcraft --target-arch armhf
	cp $(KERNEL_DIR)/$(KERNEL_SNAP) $(OUTPUT_DIR)

.PHONY: build
