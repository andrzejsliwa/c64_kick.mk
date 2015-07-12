.const GLOBAL_VIC_RAM_SIZE            = $4000  
.const GLOBAL_VIC_BANK_CONFIG_VALUE   = 3 - GLOBAL_VIC_BANK_NR_CONFIG	 
.const GLOBAL_VIC_SCREEN_BASE_ADDRESS = GLOBAL_VIC_BANK_NR_CONFIG * GLOBAL_VIC_RAM_SIZE

.const GLOBAL_VIC_SCREEN_CONFIG_VALUE = GLOBAL_VIC_SCREEN_CONFIG << 4
.const GLOBAL_VIC_SCREEN_ADDRESS      = GLOBAL_VIC_SCREEN_BASE_ADDRESS + 
								        GLOBAL_VIC_SCREEN_CONFIG * $0400

.macro VIC_global_setup_bank() { 
	lda CIA2_DD02_data_direction_register_a 
	ora #%00000011	                   
	sta CIA2_DD02_data_direction_register_a 

	lda CIA2_DD00_data_port_a_serial_bus_rs232_vice_base_mem 
	and #%11111100
	ora #GLOBAL_VIC_BANK_CONFIG_VALUE
	sta CIA2_DD00_data_port_a_serial_bus_rs232_vice_base_mem
	
	.print ""
	.print "VIC_BANK_NR              = " + GLOBAL_VIC_BANK_NR_CONFIG
	.if (GLOBAL_VIC_BANK_NR_CONFIG == 3 ||
	     GLOBAL_VIC_BANK_NR_CONFIG == 1 ) {	
		.print "  * WARNING: charset unavailable for BANK " + GLOBAL_VIC_BANK_NR_CONFIG
	}
	.print "VIC_SCREEN_BASE_ADDRESS  = $" + toHexString(GLOBAL_VIC_SCREEN_BASE_ADDRESS)
	.print "VIC_SCREEN_ADDRESS_RANGE = $" + 
		toHexString(GLOBAL_VIC_SCREEN_BASE_ADDRESS) + " - $" +
		toHexString(GLOBAL_VIC_SCREEN_BASE_ADDRESS + GLOBAL_VIC_RAM_SIZE - 1)
}

.macro VIC_global_setup_screen_memory() {
	lda VIC_D018_memory_control_register
	and #%00001111
	ora #GLOBAL_VIC_SCREEN_CONFIG_VALUE
	sta VIC_D018_memory_control_register

	.print ""
	.print "VIC_SCREEN_OFFSET        = $" + toHexString(GLOBAL_VIC_SCREEN_CONFIG * $0400)
 	.print "VIC_SCREEN_ADDRESS       = $" + toHexString(GLOBAL_VIC_SCREEN_ADDRESS)
}
