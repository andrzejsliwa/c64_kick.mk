VICE_REMOTE_MONITOR = true
VICE_REU            = true
VICE_CARTRR         = cartridge/rr38p-tmp12reu.bin
VICE_PATH           = x64 #/Applications/x64.app/Contents/MacOS/x64
VICE_OPTS           = -rrbioswrite #+confirmexit
DEFAULT_PRG         = example

include c64_kick.mk
