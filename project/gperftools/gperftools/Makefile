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

PROJECT_TARGET_TOP_DIR 	:= gperftools
PROJECT_TARGET 			:= gperftools
TARGET_VERSION 			:= 2.7.90
TARGET_DOWNLOAD_PATH 	:= https://codeload.github.com/$(PROJECT_TARGET)/$(PROJECT_TARGET)/tar.gz/$(PROJECT_TARGET)-$(TARGET_VERSION)
GITHUB_FLAG 			:= yes

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

# FIXME
TARGET_PATH 			:= $(PROJECT_DIR)/$(PROJECT_TARGET_TOP_DIR)/$(PROJECT_TARGET)
PREFIX_PATH 			:= $(TARGET_PATH)/../../$(INSTALL_DIR)

LIBUNWIND_FILE         	:= $(PREFIX_PATH)/include/libunwind-common.h

all: depend_lib $(TARGET_DIR)-make

depend_lib:
ifneq ($(LIBUNWIND_FILE), $(wildcard $(LIBUNWIND_FILE)))
	$(ECHO) "\tuse \"make project=libunwind\" first to  compile libunwind."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
ifneq ($(TARGET_DIR), $(wildcard $(TARGET_DIR)))
	mv $(PROJECT_TARGET)-$(PROJECT_TARGET)-$(TARGET_VERSION) $(@:-config=)
endif
	cd $(@:-config=) && ./autogen.sh
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		LDFLAGS="$(LDFLAGS) -L$(PREFIX_PATH)/lib" \
		LIBS="$(LIBS) -lunwind" \
		CPPFLAGS="$(CPPFLAGS) -I$(PREFIX_PATH)/include" \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=$(HOST)
	
	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

