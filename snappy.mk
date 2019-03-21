include common.mk

all: build

clean:
	rm -rf $(IMAGE_OUTPUT_DIR)

distclean: clean

build-snappy:
	$(UBUNTU_IMAGE_TOOL) snap \
		-c $(UBUNTU_CORE_CHANNEL) \
		--image-size $(IMAGE_SIZE) \
		--extra-snaps $(GADGET_SNAP) \
		--extra-snaps $(KERNEL_SNAP) \
		-O $(IMAGE_OUTPUT_DIR) \
		$(IMAGE_MODEL)

pack: build-snappy
	mv $(IMAGE_DEFAULT_NAME) $(SNAPPY_IMAGE)
	# TODO: create xz

build: build-snappy pack

.PHONY: build-snappy pack build
