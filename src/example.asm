.import source "memory_map.inc"
.import source "tools.inc"

.var GLOBAL_VIC_BANK_NR_CONFIG = 1 // 0 - default ($0000 - $3fff)
.var GLOBAL_VIC_SCREEN_CONFIG  = 1 // 1 - default ($0400)
.import source "vic_configuration.inc"

:basic_upstart(start, 2015)

.pc = $1000 "Program"
start:
    :VIC_global_setup_bank()
    :VIC_global_setup_screen_memory()
    rts

