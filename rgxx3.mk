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
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/anbernic/rgxx3/device.mk)

# Device has no onboard cellular modem.
BOARD_WITHOUT_RADIO := true

# Device only has 2GB of RAM, Go defaults seem reasonable.
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)

PRODUCT_NAME := rgxx3
PRODUCT_DEVICE := rgxx3
PRODUCT_BRAND := Anbernic
PRODUCT_MODEL := Anbernic RG353
PRODUCT_MANUFACTURER := Anbernic
