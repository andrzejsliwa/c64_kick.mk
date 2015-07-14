# c64_kick.mk

Example project for C64 Kick Assembler with importing memory map as labels

## Usage

```bash
*[master][~/c64_example]$ make help
c64_kick.mk targets:
  compile          - compile KICK ASSEMBLER source files (src/*.s)
  convert          - convert BASIC source files (src/*.bas)
  disk             - compile, convert, create disk file d64
  start            - compile, convert, build disk image and start emulator
  start PROGNAME   - compile, convert, build disk image and start emulator with PROGNAME
  stop             - stop VICE emulator
  clean            - clean build directory
```
## Example labels output

![vice_labels](https://raw.githubusercontent.com/andrzejsliwa/c64_kick.mk/master/vice_labels.png)

## Example monitor with labels

![vice_monitor](https://raw.githubusercontent.com/andrzejsliwa/c64_kick.mk/master/vice_monitor.png)

## Example of global configuration

![global_config](https://raw.githubusercontent.com/andrzejsliwa/c64_kick.mk/master/global_config.png)

## Example of output from global configuration

![output_of_global_config](https://raw.githubusercontent.com/andrzejsliwa/c64_kick.mk/master/output_of_global_config.png)