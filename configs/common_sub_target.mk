# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    common_sub_target.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    06/12 2019 14:32
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        06/12 2019      create the file
# 
#     last modified: 06/12 2019 14:32
# ===============================================================

$(TARGET_DIR)-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(BUILD_DIR)/$(@:-make=) && $(MAKE) && make install

$(TARGET_DIR)-src:
ifneq ($(TARGET_DIR), $(wildcard $(TARGET_DIR)))
ifeq ($(GITHUB_FLAG), yes)
	$(call echo-download-msg, $(@:-src=))
	$(WGET) $(TARGET_DOWNLOAD_PATH) -O $(PROJECT_TARGET)-$(TARGET_VERSION).$(TAR_SUFFIX)
	$(MKDIR) $(TARGET_DIR)
	$(TAR_CMD) $(@:-src=).$(TAR_SUFFIX) -C $(TARGET_DIR)
	$(RM) $(@:-src=).$(TAR_SUFFIX)
else
	$(call echo-download-msg, $(@:-src=))
	$(WGET) $(TARGET_DOWNLOAD_PATH)/$(@:-src=).$(TAR_SUFFIX)
	$(MKDIR) $(TARGET_DIR)
	$(TAR_CMD) $(@:-src=).$(TAR_SUFFIX) -C $(TARGET_DIR)
	$(RM) $(@:-src=).$(TAR_SUFFIX)
endif
endif

clean:
	$(ECHO) "    rm $(PROJECT_TARGET)/$(BUILD_DIR)"
	$(RM) $(BUILD_DIR)

distclean: clean
	$(ECHO) "    rm $(TARGET_DIR)"
	$(RM) $(TARGET_DIR)

list:
ifeq ($(PROJECT_TARGET_SERVER), )
ifneq ($(makefile_list), ) # 在顶层显示
	$(ECHO) "\tmake project=$(PROJECT_TARGET) \t\t\t- compile $(PROJECT_TARGET)."
else # 在项目层显示
	$(ECHO) "\tmake \t\t\t- compile $(PROJECT_TARGET)."
endif
else#两级目录显示
	$(ECHO) "\tmake project=$(PROJECT_TARGET_SERVER) \t\t\t- compile $(PROJECT_TARGET_SERVER)."
endif

include $(CONFIGS_DIR)/common_target.mk

