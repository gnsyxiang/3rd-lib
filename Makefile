# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    14/11 2019 20:18
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        14/11 2019      create the file
# 
#     last modified: 14/11 2019 20:18
# ===============================================================

TOP_DIR := $(shell pwd)
export TOP_DIR

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk

makefile_list := $(wildcard ./project/*/Makefile)
makefile_list += $(wildcard ./project/gdb/*/Makefile)
# makefile_list += $(wildcard ./project/lua/*/Makefile)
makefile_list += $(wildcard ./project/tcpdump/*/Makefile)
makefile_list += $(wildcard ./project/ffmpeg/*/Makefile)
makefile_list += $(wildcard ./project/audio/*/Makefile)
makefile_list += $(wildcard ./project/gperftools/*/Makefile)

export makefile_list

all: 
ifdef project
	$(call run_dir_makefile_make_project, $(makefile_list), $(project))
else
	$(ECHO) "the instructions are as follows:"
	$(ECHO) ''
	$(ECHO) "\tmake list  \t\t- show all projects that can be compiled."
	$(ECHO) "\tmake clean \t\t- clean all build projects."
	$(ECHO) "\tmake distclean\t\t- clean all projects."
	$(ECHO) ''
endif

include $(CONFIGS_DIR)/common_target.mk

list:
	$(ECHO) "support compiled projects"
	$(call run_dir_makefile_make_target, $(makefile_list), list)

clean:
	$(ECHO) "clean all build projects"
	$(RM) $(PREFIX_PATH)
	$(call run_dir_makefile_make_target, $(makefile_list), clean)

distclean:
	$(ECHO) "clean all projects"
	$(RM) $(PREFIX_PATH)
	$(call run_dir_makefile_make_target, $(makefile_list), distclean)

debug:
	echo $(makefile_list)

.PHONY: all list

