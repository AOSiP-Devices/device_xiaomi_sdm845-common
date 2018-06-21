LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

LOCAL_MODULE := android.hardware.power@1.3-service.xiaomi_sdm845-libperfmgr
LOCAL_INIT_RC := android.hardware.power@1.3-service.xiaomi_sdm845-libperfmgr.rc
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional

LOCAL_VENDOR_MODULE := true

LOCAL_SRC_FILES := \
    InteractionHandler.cpp \
    Power.cpp \
    power-helper.c \
    display-helper.c \
    service.cpp

LOCAL_SHARED_LIBRARIES := \
    android.hardware.power@1.0 \
    android.hardware.power@1.1 \
    android.hardware.power@1.2 \
    android.hardware.power@1.3 \
    libbase \
    libcutils \
    libhidlbase \
    libhidltransport \
    liblog \
    libutils \
    libperfmgr

LOCAL_HEADER_LIBRARIES := generated_kernel_headers
LOCAL_HEADER_LIBRARIES += libhardware_headers

LOCAL_CFLAGS += -Werror -Wall

include $(BUILD_EXECUTABLE)
