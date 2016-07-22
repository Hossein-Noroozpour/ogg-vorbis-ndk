LOCAL_PATH := $(call my-dir)

OGG_DIR        := $(LOCAL_PATH)/../../libogg-1.3.2
VORBIS_DIR     := $(LOCAL_PATH)/../../libvorbis-1.3.5
OGG_INCLUDES    := $(OGG_DIR)/include
VORBIS_INCLUDES := $(VORBIS_DIR)/include $(VORBIS_DIR)/lib

######################################################################
# OGG
include $(CLEAR_VARS)

# LOCAL_ARM_MODE := arm
LOCAL_MODULE   := libogg
LOCAL_CFLAGS   := -ffast-math -fsigned-char -O3 -fPIC -DPIC -DBYTE_ORDER=LITTLE_ENDIAN -D_ARM_ASSEM_

LOCAL_C_INCLUDES := $(OGG_INCLUDES)

LOCAL_SRC_FILES := $(addprefix ../$(OGG_DIR)/, $(shell cd $(OGG_DIR); find -type f -name '*.c'))

include $(BUILD_STATIC_LIBRARY)

######################################################################
# VORBIS
include $(CLEAR_VARS)

# LOCAL_ARM_MODE := arm
LOCAL_MODULE   := libvorbis
LOCAL_CFLAGS   := -ffast-math -fsigned-char -O3 -fPIC -DPIC -DBYTE_ORDER=LITTLE_ENDIAN -D_ARM_ASSEM_

LOCAL_C_INCLUDES := $(OGG_INCLUDES) $(VORBIS_INCLUDES)

LOCAL_SRC_FILES := $(addprefix ../, $(shell cd $(LOCAL_PATH)/../; find $(VORBIS_DIR)/lib -type f -name '*.c' | grep -v psytune.c))

include $(BUILD_STATIC_LIBRARY)
