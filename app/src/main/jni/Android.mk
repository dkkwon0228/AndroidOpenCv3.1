LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

include /home/dannykwon/OpenCV-android-sdk/sdk/native/jni/OpenCV.mk

LOCAL_MODULE    := mixed_sample
LOCAL_LDLIBS +=  -llog -ldl

include $(BUILD_SHARED_LIBRARY)
