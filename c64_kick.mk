DISK_NAME ?= $(notdir $(shell pwd))
DISK_NEW  ?= true
VICE_OPTS ?=
VICE_PATH ?= x64
DEFAULT_TARGET ?=
ASM_EXTENSION ?=.a
INC_EXTENSION ?=.i

ifdef VICE_REMOTE_MONITOR
	ifeq ($(VICE_REMOTE_MONITOR),true)
		VICE_OPTS += -remotemonitor -remotemonitoraddress localhost:6510
	endif
endif

ifdef VICE_REU
VICE_REU_FILE ?= .reuimage
VICE_REU_SIZE ?= 16384
	ifeq ($(VICE_REU),true)
		VICE_OPTS += -reu -reusize $(VICE_REU_SIZE) -reuimage $(VICE_REU_FILE) -reuimagerw
	endif
endif

ifdef VICE_CARTRR
	VICE_OPTS += -cartrr $(VICE_CARTRR)
endif

SOURCE_DIR = src
BUILD_DIR  = build
BACKUP_DIR = backup

DISK ?= $(BUILD_DIR)/$(DISK_NAME).d64

ASM_FILES = $(wildcard $(SOURCE_DIR)/*$(ASM_EXTENSION))
ASM_INCS  = $(wildcard $(SOURCE_DIR)/*$(INC_EXTENSION))
ASM_PRGS  = $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_FILES:$(ASM_EXTENSION)=.prg)))
ASM_SOURCES  = $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_FILES:$(ASM_EXTENSION)=$(ASM_EXTENSION))))
ASM_INCLUDES = $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_INCS:$(INC_EXTENSION)=$(INC_EXTENSION))))

BAS_FILES = $(wildcard $(SOURCE_DIR)/*.bas)
BAS_PRGS  = $(addprefix $(BUILD_DIR)/,$(notdir $(BAS_FILES:.bas=.prg)))

all:
	make start $(DEFAULT_PRG)

.PHONY : disk start stop

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.prg: $(SOURCE_DIR)/%$(ASM_EXTENSION)
	java -jar kickass.jar \
		$< \
		-o $@ \
		-afo \
		-aom \
		-showmem \
		-vicesymbols \
		-symbolfile \
		-symbolfiledir $(BUILD_DIR)

$(BUILD_DIR)/%.prg: $(SOURCE_DIR)/%.bas
	petcat -w2 -o $@ -- $<

clean:
	@rm -r $(BUILD_DIR)

$(BACKUP_DIR):
	mkdir -p $(BACKUP_DIR)

disk_backup: $(BACKUP_DIR)
	$(shell mv $(DISK) $(BACKUP_DIR)/$(DISK_NAME)_$$(date '+%Y%m%d%H%M%S').d64)

disk_prepare: disk_backup $(BUILD_DIR)
	c1541 -format $(DISK_NAME),DF d64 $(DISK)

define write_file_on_disk
	c1541 -attach $(1) -write $(2) $(patsubst build/%.prg,%,$(2))
endef

define write_seq_file_on_disk
	c1541 -attach $(1) -write $(2) "$(patsubst build/%,%,$(2)),s"
endef

compile: $(BUILD_DIR) $(ASM_PRGS)

convert: $(BUILD_DIR) $(BAS_PRGS)

ifeq ($(DISK_NEW),true)
disk: disk_prepare compile convert
else
disk: compile convert
endif
	@$(foreach prg,$(ASM_PRGS),$(call write_file_on_disk,$(DISK),$(prg));)
	@$(foreach prg,$(BAS_PRGS),$(call write_file_on_disk,$(DISK),$(prg));)

ifeq (start,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "start"
  START_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn argument to starting config
  ifneq ($(START_ARGS),)
	APP_NAME  := $(firstword $(START_ARGS))
	START_APP := $(DISK):$(APP_NAME)
  endif

  $(eval $(START_ARGS):;@:)
endif

start: stop disk run

run:
	@$(VICE_PATH) $(VICE_OPTS) \
	-moncommands $(BUILD_DIR)/monitor.txt \
    -moncommands $(BUILD_DIR)/$(APP_NAME).vs \
	-8 $(DISK) $(START_APP) 2>&1 > /dev/null

mon:
	telnet localhost 6510

stop:
	killall -TERM x64 || true

help::
	@printf "%s\n" \
		"c64_kick.mk targets:" \
        "  compile          - compile KICK ASSEMBLER source files (src/*.s) " \
	    "  convert          - convert BASIC source files (src/*.bas) " \
	    "  disk             - compile, convert, create disk file d64" \
        "  start            - compile, convert, build disk image and start emulator" \
	    "  start PROGNAME   - compile, convert, build disk image and start emulator with PROGNAME " \
		"  stop             - stop VICE emulator " \
        "  clean            - clean build directory "
