#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), VFD600)

##include all files under msm8909 if avaliable
.PHONY: CURRENT_BOARD_MK_FILES

CURRENT_BOARD_MK_FILES:
CBMKFLS :=device/Vodafone/msm8909-common/; \
-include $(call all-makefiles-under,$(CBMKFLS));
#replace the configs of the board with the right config...
-include device/Vodafone/msm8909-common/board/00-qcom-platform-msm8909.mk
#-include device/Vodafone/msm8909-common/init/Android.mk
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

# Create a link for the WCNSS config file, which ends up as a writable
# version in /data/misc/wifi
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wlan/prima; \
ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
$(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini)

endif
