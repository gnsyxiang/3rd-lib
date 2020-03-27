# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    26/03 2020 16:44
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        26/03 2020      create the file
# 
#     last modified: 26/03 2020 16:44
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../../..
endif

# https://codeload.github.com/libunwind/libunwind/tar.gz/v1.3.1

PROJECT_TARGET_TOP_DIR 	:= gperftools
PROJECT_TARGET 			:= libunwind
TARGET_VERSION 			:= 1.3.1
TARGET_DOWNLOAD_PATH 	:= https://codeload.github.com/$(PROJECT_TARGET)/$(PROJECT_TARGET)/tar.gz/v$(TARGET_VERSION)
GITHUB_FLAG 			:= yes

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

# FIXME
TARGET_PATH 			:= $(PROJECT_DIR)/$(PROJECT_TARGET_TOP_DIR)/$(PROJECT_TARGET)
PREFIX_PATH 			:= $(TARGET_PATH)/../../$(INSTALL_DIR)

all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(@:-config=) && sed  '/NOCONFIGURE/d' ./autogen.sh | bash
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=$(HOST)

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

