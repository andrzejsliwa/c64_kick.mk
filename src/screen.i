.macro set_background_color(color) {
    ldx #color
    stx VIC_background_color
}
