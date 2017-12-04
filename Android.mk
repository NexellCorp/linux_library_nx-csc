LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES += \
	system/core/include \
	frameworks/native/include \
	$(LOCAL_PATH)

LOCAL_SRC_FILES := csc.cpp
	
LOCAL_SHARED_LIBRARIES := liblog libutils libion

ANDROID_VERSION_STR := $(subst ., ,$(PLATFORM_VERSION))
ANDROID_VERSION_MAJOR := $(firstword $(ANDROID_VERSION_STR))

LOCAL_C_INCLUDES += system/core/libion/include

LOCAL_SRC_FILES_arm += \
	csc_ARGB8888_to_NV12_NEON.s \
	csc_ARGB8888_to_NV21_NEON.s

LOCAL_MODULE := libnx_csc

LOCAL_MODULE_TAGS := optional

LOCAL_32_BIT_ONLY := true

include $(BUILD_SHARED_LIBRARY)
