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

.macro VIC_global_setup_bank() { 
	lda CIA2_DD02_data_direction_register_a 
	ora #%00000011	                   
	sta CIA2_DD02_data_direction_register_a 

	lda CIA2_DD00_data_port_a_serial_bus_rs232_vice_base_mem 
	and #%11111100
	ora #GLOBAL_VIC_BANK_CONFIG_VALUE
	sta CIA2_DD00_data_port_a_serial_bus_rs232_vice_base_mem
	
	.print ""
	.print "VIC BANK " + GLOBAL_VIC_BANK_CONFIG

	.print "VIC *memory mapping* = $" + 
		toHexString(GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS) + 
		" - $" +
		toHexString(GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS + GLOBAL_VIC_MEMORY_SIZE - 1)
	
	.if (GLOBAL_VIC_BANK_CONFIG == 0) {
 		.print "  - DEFAULT"
 	}	
 	.print ""
}

.macro VIC_global_setup_screen_memory() {
	lda VIC_D018_memory_control_register
	and #%00001111
	ora #GLOBAL_VIC_SCREEN_CONFIG_VALUE
	sta VIC_D018_memory_control_register

	.print "VIC *screen* location = $" + 
		toHexString(GLOBAL_VIC_SCREEN_OFFSET)

 	.print "VIC *screen* location + BANK " + GLOBAL_VIC_BANK_CONFIG + 
 		" ($"+ toHexString(GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS) + ") = $" + 
 		toHexString(GLOBAL_VIC_SCREEN_ADDRESS)
 	.if (GLOBAL_VIC_SCREEN_CONFIG == 1) {
 		.print "  - DEFAULT"
 	}
 	.print ""
}

.macro VIC_global_setup_charset_memory() {
	.if (GLOBAL_VIC_BANK_CONFIG == 3 ||
	     GLOBAL_VIC_BANK_CONFIG == 1 ) {	
		.print "WARNING: charset unavailable for BANK " + 
			GLOBAL_VIC_BANK_CONFIG + "!"
		.print ""
	} else {
		lda VIC_D018_memory_control_register
		and #%11110000
		ora #GLOBAL_VIC_CHARSET_CONFIG_VALUE
		sta VIC_D018_memory_control_register

		.print "VIC *charset* location = $" + 
			toHexString(GLOBAL_VIC_CHARSET_OFFSET)

		.print "VIC *charset* location + BANK " + GLOBAL_VIC_BANK_CONFIG + 
	 		" ($"+ toHexString(GLOBAL_VIC_MEMORY_MAPPING_BASE_ADDRESS) + ") = $" + 
	 		toHexString(GLOBAL_VIC_CHARSET_ADDRESS)	+
	 		" - $" +
	 		toHexString(GLOBAL_VIC_CHARSET_ADDRESS + GLOBAL_VIC_CHARSET_SIZE - 1)


	 	.if ([GLOBAL_VIC_BANK_CONFIG == 0 || GLOBAL_VIC_BANK_CONFIG == 2 ] && 
	 		 [GLOBAL_VIC_CHARSET_CONFIG == 2 || GLOBAL_VIC_CHARSET_CONFIG == 3]) {
	 		.print "  - on ROM IMAGE"
	 	}
	 	.if (GLOBAL_VIC_CHARSET_CONFIG == 2) {
	 		.print "  - DEFAULT"
	 	}	
	 	.print ""
 	}
}
