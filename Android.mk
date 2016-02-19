LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := cpufreq-sc8810.ko
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/modules
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)


$(LOCAL_PATH)/cpufreq-sc8810.ko:
	$(MAKE) -C $(shell dirname $@) ARCH=arm CROSS_COMPILE=$(ARM_EABI_TOOLCHAIN)/arm-eabi- KDIR=$(ANDROID_PRODUCT_OUT)/obj/KERNEL_OBJ clean
	$(MAKE) -C $(shell dirname $@) ARCH=arm CROSS_COMPILE=$(ARM_EABI_TOOLCHAIN)/arm-eabi- KDIR=$(ANDROID_PRODUCT_OUT)/obj/KERNEL_OBJ
	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(shell dirname $@)/cpufreq-sc8810.ko 
