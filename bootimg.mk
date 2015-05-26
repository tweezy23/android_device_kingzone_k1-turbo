LOCAL_PATH := $(call my-dir)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) \
		$(recovery_kernel)
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot image: $@")
	$(hide) cp device/kingzone/k1_turbo/wifi/wpa_supplicant out/target/product/k1_turbo/system/bin/wpa_supplicant
	$(hide) cp device/kingzone/k1_turbo/wifi/hostapd out/target/product/k1_turbo/system/bin/hostapd
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

.PHONY: bootimage-nodeps
bootimage-nodeps: $(MKBOOTIMG)
	@echo "make $@: ignoring dependencies"
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $(INSTALLED_BOOTIMAGE_TARGET)
	$(hide) $(call assert-max-image-size,$(INSTALLED_BOOTIMAGE_TARGET),$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo -e ${CL_INS}"Made boot image: $@"${CL_RST}
