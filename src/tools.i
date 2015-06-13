.const BASIC_SYS = $9e

.macro basic_upstart(address, year) {
    .pc = $0801 "Basic - begining"
    .word end
    .word year
    .byte BASIC_SYS
    .text toIntString(address)
    .byte 0
end:
    .word 0
    .pc = $080e "Basic - end"
}
