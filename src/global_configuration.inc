.const GLOBAL_VIC_MEMORY_SIZE                 = $4000  
.const GLOBAL_VIC_BANK_CONFIG_VALUE           = 3 - GLOBAL_VIC_BANK_CONFIG	 
.const GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS = GLOBAL_VIC_BANK_CONFIG * GLOBAL_VIC_MEMORY_SIZE

.const GLOBAL_VIC_SCREEN_CONFIG_VALUE         = GLOBAL_VIC_SCREEN_CONFIG << 4
.const GLOBAL_VIC_SCREEN_OFFSET               = GLOBAL_VIC_SCREEN_CONFIG * $0400
.const GLOBAL_VIC_SCREEN_ADDRESS              = GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS + 
	  											GLOBAL_VIC_SCREEN_OFFSET

.const GLOBAL_VIC_CHARSET_SIZE                = $100 /* 256 characters */ * 8 /* bytes per character */
.const GLOBAL_VIC_CHARSET_CONFIG_VALUE        = GLOBAL_VIC_CHARSET_CONFIG << 1
.const GLOBAL_VIC_CHARSET_OFFSET              = GLOBAL_VIC_CHARSET_CONFIG * $0800
.const GLOBAL_VIC_CHARSET_ADDRESS             = GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS +
												GLOBAL_VIC_CHARSET_OFFSET

.const GLOBAL_MEMORY_MAP_CONFIG_VALUE_1       = [GLOBAL_CPU_PORT_MEMORY_CONFIG & %00000011] 
.const GLOBAL_MEMORY_MAP_CONFIG_VALUE_2       = [GLOBAL_CPU_PORT_MEMORY_CONFIG & %00000100] 
.const GLOBAL_MEMORY_MAP_CONFIG_VALUE         = GLOBAL_MEMORY_MAP_CONFIG_VALUE_1 |
								                GLOBAL_MEMORY_MAP_CONFIG_VALUE_2
.macro VIC_global_setup_bank() { 
	.if (GLOBAL_VIC_BANK_CONFIG > 3 ||
		 GLOBAL_VIC_BANK_CONFIG < 0 ) {
		.error "GLOBAL_VIC_BANK_CONFIG out of range (0 - 3)"
	}
	lda CIA2_DD02_data_direction_register_a 
	ora #%00000011	                   
	sta CIA2_DD02_data_direction_register_a 

	lda CIA2_DD00_data_port_a_serial_bus_rs232_vice_base_mem 
	and #%11111100
	ora #GLOBAL_VIC_BANK_CONFIG_VALUE
	sta CIA2_DD00_data_port_a_serial_bus_rs232_vice_base_mem
	
	.print ""
	.print "VIC BANK " + GLOBAL_VIC_BANK_CONFIG

	.print "VIC Memory mapping:"
	.print "  $" + 
		toHexString(GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS, 4) + 
		" - $" +
		toHexString(GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS + GLOBAL_VIC_MEMORY_SIZE - 1, 4)
	
	.if (GLOBAL_VIC_BANK_CONFIG == 0) {
 		.print "  * DEFAULT!"
 	}	
 	.print ""
 	.print "-----------------------------------------------------"
}

.macro VIC_global_setup_screen_memory() {
	.if (GLOBAL_VIC_SCREEN_CONFIG > 15 ||
		 GLOBAL_VIC_SCREEN_CONFIG < 0 ) {
		.error "GLOBAL_VIC_SCREEN_CONFIG out of range (0 - 15)"
	}

	lda VIC_D018_memory_control_register
	and #%00001111
	ora #GLOBAL_VIC_SCREEN_CONFIG_VALUE

	.print "VIC $D018 modified by %" + toBinaryString(GLOBAL_VIC_SCREEN_CONFIG, 4) + "xxxx"
	sta VIC_D018_memory_control_register

	.print "VIC Screen offset                   = $" +
		toHexString(GLOBAL_VIC_SCREEN_OFFSET, 4)

 	.print "VIC Screen offset + BANK " + GLOBAL_VIC_BANK_CONFIG + 
 		" ($"+ toHexString(GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS, 4) + ")  = $" +
 		toHexString(GLOBAL_VIC_SCREEN_ADDRESS, 4)
 	.if (GLOBAL_VIC_SCREEN_CONFIG == 1) {
 		.print "  * DEFAULT!"
 	}
 	.print ""
 	.print "-----------------------------------------------------"
}

.macro VIC_global_setup_charset_memory() {
	.if (GLOBAL_VIC_CHARSET_CONFIG > 7 ||
		 GLOBAL_VIC_CHARSET_CONFIG < 0 ) {
		.error "GLOBAL_VIC_BANK_CONFIG out of range (0 - 7)"
	}
	.if (GLOBAL_VIC_BANK_CONFIG == 3 ||
	     GLOBAL_VIC_BANK_CONFIG == 1 ) {	
		.print "WARNING: charset unavailable for BANK " + 
			GLOBAL_VIC_BANK_CONFIG + "!"
		.print ""
	} else {
		lda VIC_D018_memory_control_register
		and #%11110000
		ora #GLOBAL_VIC_CHARSET_CONFIG_VALUE

		.print "VIC $D018 modified by %xxxx" + toBinaryString(GLOBAL_VIC_CHARSET_CONFIG, 3) + "x"

		sta VIC_D018_memory_control_register

		.print "VIC Charset offset                  = $" + 
			toHexString(GLOBAL_VIC_CHARSET_OFFSET, 4)

		.print "VIC Charset offset + BANK " + GLOBAL_VIC_BANK_CONFIG + 
	 		" ($"+ toHexString(GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS, 4) + ") = $" + 
	 		toHexString(GLOBAL_VIC_CHARSET_ADDRESS, 4)	+
	 		" - $" +
	 		toHexString(GLOBAL_VIC_CHARSET_ADDRESS + GLOBAL_VIC_CHARSET_SIZE - 1, 4)


	 	.if ([GLOBAL_VIC_BANK_CONFIG == 0 || GLOBAL_VIC_BANK_CONFIG == 2 ] && 
	 		 [GLOBAL_VIC_CHARSET_CONFIG == 2 || GLOBAL_VIC_CHARSET_CONFIG == 3]) {
	 		.print "  * on ROM IMAGE"
	 	}
	 	.if (GLOBAL_VIC_CHARSET_CONFIG == 2) {
	 		.print "  * DEFAULT!"
	 	}	
	 	.print ""
	 	.print "-----------------------------------------------------"
 	}
}

.macro CPU_PORT_memory_setup() {
	.if (GLOBAL_CPU_PORT_MEMORY_CONFIG > %111 ||
		 GLOBAL_CPU_PORT_MEMORY_CONFIG < 0 ) {
		.error "GLOBAL_CPU_PORT_MEMORY_CONFIG out of range (%000 - %111)"
	}

	lda ZERO_01_6510_on_chip_8_bit_input_output_register
	and #%00000111
	ora #GLOBAL_MEMORY_MAP_CONFIG_VALUE	
	sta ZERO_01_6510_on_chip_8_bit_input_output_register						     

	.print "CPU port configuration "
	.print "  - MEMORY ($" + GLOBAL_MEMORY_MAP_CONFIG_VALUE +
		toHexString(ZERO_01_6510_on_chip_8_bit_input_output_register, 2) +
		") modyfied by %xxxxx" + toBinaryString(GLOBAL_MEMORY_MAP_CONFIG_VALUE, 3)
	.if (GLOBAL_MEMORY_MAP_CONFIG_VALUE_1 == %00) {
		.print "RAM visible at        $a000-$bfff"
		.print "                      $d000-$dfff"
		.print "                      $e000-$ffff"
	}
	.if (GLOBAL_MEMORY_MAP_CONFIG_VALUE_1 == %01) {
		.print "RAM visible at        $a000-$bfff"
		.print "                      $e000-$ffff"
	}
	.if (GLOBAL_MEMORY_MAP_CONFIG_VALUE_1 == %10) {
		.print "RAM visible at        $a000-$bfff"
		.print "KERNAL ROM visible at $e000-$ffff"
	}
	.if (GLOBAL_MEMORY_MAP_CONFIG_VALUE_1 == %11) {
		.print "BASIC ROM visible at  $a000-$bfff"
		.print "KERNAL ROM visible at $e000-$ffff"
	}

	.if (GLOBAL_MEMORY_MAP_CONFIG_VALUE_1 != %00 && 
		 GLOBAL_MEMORY_MAP_CONFIG_VALUE_2 == %100) {
		.print "I/O area visible at   $d000-$dfff"
	}
	.print ""
	.print "-----------------------------------------------------"
}
