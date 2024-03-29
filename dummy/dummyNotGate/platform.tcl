# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/subi/codes/vscode/vivado/PL-and-PS/dummy/dummyNotGate/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/subi/codes/vscode/vivado/PL-and-PS/dummy/dummyNotGate/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {dummyNotGate}\
-hw {/home/subi/codes/vscode/vivado/PL-and-PS/dummy/design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/subi/codes/vscode/vivado/PL-and-PS/dummy}

platform write
platform generate -domains 
platform active {dummyNotGate}
platform generate
