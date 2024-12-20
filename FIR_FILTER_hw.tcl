# TCL File Generated by Component Editor 23.1
# Wed Nov 06 21:36:42 GMT+07:00 2024
# DO NOT MODIFY


# 
# FIR_FILTER "FIR_FILTER" v1.0
#  2024.11.06.21:36:42
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module FIR_FILTER
# 
set_module_property DESCRIPTION ""
set_module_property NAME FIR_FILTER
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME FIR_FILTER
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL fir_wrapper
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file fir_csr.sv SYSTEM_VERILOG PATH fir_csr.sv
add_fileset_file fir_fil.sv SYSTEM_VERILOG PATH fir_fil.sv
add_fileset_file fir_wrapper.sv SYSTEM_VERILOG PATH fir_wrapper.sv TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL fir_wrapper
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE true
add_fileset_file fir_csr.sv SYSTEM_VERILOG PATH fir_csr.sv
add_fileset_file fir_fil.sv SYSTEM_VERILOG PATH fir_fil.sv
add_fileset_file fir_wrapper.sv SYSTEM_VERILOG PATH fir_wrapper.sv


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0
set_interface_property clock_sink ENABLED true
set_interface_property clock_sink EXPORT_OF ""
set_interface_property clock_sink PORT_NAME_MAP ""
set_interface_property clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink SVD_ADDRESS_GROUP ""

add_interface_port clock_sink clk clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_sink
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink rst_n reset_n Input 1


# 
# connection point avalon_slave_0_1
# 
add_interface avalon_slave_0_1 avalon end
set_interface_property avalon_slave_0_1 addressUnits WORDS
set_interface_property avalon_slave_0_1 associatedClock clock_sink
set_interface_property avalon_slave_0_1 associatedReset reset_sink
set_interface_property avalon_slave_0_1 bitsPerSymbol 8
set_interface_property avalon_slave_0_1 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0_1 burstcountUnits WORDS
set_interface_property avalon_slave_0_1 explicitAddressSpan 0
set_interface_property avalon_slave_0_1 holdTime 0
set_interface_property avalon_slave_0_1 linewrapBursts false
set_interface_property avalon_slave_0_1 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0_1 maximumPendingWriteTransactions 0
set_interface_property avalon_slave_0_1 readLatency 0
set_interface_property avalon_slave_0_1 readWaitTime 1
set_interface_property avalon_slave_0_1 setupTime 0
set_interface_property avalon_slave_0_1 timingUnits Cycles
set_interface_property avalon_slave_0_1 writeWaitTime 0
set_interface_property avalon_slave_0_1 ENABLED true
set_interface_property avalon_slave_0_1 EXPORT_OF ""
set_interface_property avalon_slave_0_1 PORT_NAME_MAP ""
set_interface_property avalon_slave_0_1 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_0_1 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_0_1 chipselect chipselect Input 1
add_interface_port avalon_slave_0_1 write write Input 1
add_interface_port avalon_slave_0_1 read read Input 1
add_interface_port avalon_slave_0_1 address address Input 4
add_interface_port avalon_slave_0_1 writedata writedata Input 32
add_interface_port avalon_slave_0_1 readdata readdata Output 32
set_interface_assignment avalon_slave_0_1 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0_1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0_1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0_1 embeddedsw.configuration.isPrintableDevice 0

