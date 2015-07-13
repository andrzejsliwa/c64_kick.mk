.import source "memory_map.inc"
.import source "tools.inc"

.var GLOBAL_VIC_BANK_CONFIG    = 0 // 0 - default ($0000 - $3fff)
.var GLOBAL_VIC_SCREEN_CONFIG  = 1 // 1 - default ($0400)
.var GLOBAL_VIC_CHARSET_CONFIG = 2 // 2 - default ($1000 - $17ff)
.import source "vic_configuration.inc"

:basic_upstart(start, 2015)

.pc = $1000 "Program"
start:
    :VIC_global_setup_bank()
    :VIC_global_setup_screen_memory()
    :VIC_global_setup_charset_memory()
    rts

