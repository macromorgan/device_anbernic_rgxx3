#
# Copyright 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Support updatable APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

TARGET_KERNEL_DIR ?= device/anbernic/rgxx3-kernel

# Use a pre-built kernel image.
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

# Inherit the gsi keys so if we choose to lock the bootloader we can
# still run a public GSI image.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)


# Set zram size
PRODUCT_VENDOR_PROPERTIES += \
    vendor.zram.size=75%

# Put all the modules in the rootfs.
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(TARGET_KERNEL_DIR)/*.ko)

# Exclude modules from vendor RAM disk that are not critical or require firmware.
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(BOARD_VENDOR_KERNEL_MODULES)

# Allow the use of a dynamic super partition.
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# DRM HAL
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm-service.widevine
