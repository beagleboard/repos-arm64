Programmable Real-time Unit (PRU) Software Support Package
------------------------------------------------------------
============================================================
   EXAMPLES
============================================================

DESCRIPTION

	This directory provides basic "building block" examples for the PRU. Each
	example demonstrates a particular feature of the PRU. The concepts shown in
	these examples can be combined to create PRU applications. Hence, they are
	considered "building blocks."



WHAT EXAMPLES ARE INCLUDED?

	The following examples are included in this directory.

	EXAMPLE
	---------
	PRU_access_const_table
	PRU_ARMtoPRU_Interrupt
	PRU_Direct_Connect0
	PRU_Direct_Connect1
	PRU_Halt
	PRU_edmaConfig
	PRU_gpioToggle
	PRU_Hardware_UART
	PRU_IEP
	PRU_MAC_Multiply_Accum
	PRU_mem1DTransfer
	PRU_PRUtoARM_Interrupt
	PRU_RPMsg_Echo_Interrupt0_0
	PRU_RPMsg_Echo_Interrupt0_1
	PRU_RPMsg_Echo_Interrupt1_0
	PRU_RPMsg_Echo_Interrupt1_1

PATCHES

	The patches directory contains a single patch that can be applied to the
	Linux source in order to load the PRU firmwares into PRUSS0 instead of
	PRUSS1 on the AM437x device.

ADDITIONAL RESOURCES

	For more information about the PRU, visit:

	PRU-ICSS Wiki            - http://processors.wiki.ti.com/index.php/PRU-ICSS
	PRU Training Slides      - http://www.ti.com/sitarabootcamp
	PRU Evaluation Hardware  - http://www.ti.com/tool/PRUCAPE
	AM437x TRM               - https://www.ti.com/lit/pdf/spruhl7
	Support                  - http://e2e.ti.com

