# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/subi/codes/vscode/vivado/PL-and-PS/dummy/dummyNotGateApp_system/_ide/scripts/systemdebugger_dummynotgateapp_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/subi/codes/vscode/vivado/PL-and-PS/dummy/dummyNotGateApp_system/_ide/scripts/systemdebugger_dummynotgateapp_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo 210279545306A" && level==0 && jtag_device_ctx=="jsn-Zybo-210279545306A-13722093-0"}
fpga -file /home/subi/codes/vscode/vivado/PL-and-PS/dummy/dummyNotGateApp/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/subi/codes/vscode/vivado/PL-and-PS/dummy/dummyNotGate/export/dummyNotGate/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/subi/codes/vscode/vivado/PL-and-PS/dummy/dummyNotGateApp/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/subi/codes/vscode/vivado/PL-and-PS/dummy/dummyNotGateApp/Debug/dummyNotGateApp.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con