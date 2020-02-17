
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name TestLVDSClock -dir "F:/codetemp/TestLVDSClock/planAhead_run_5" -part xc7k325tfbg900-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "TestLVDSTop.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {src/TestLVDSTop.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top TestLVDSTop $srcset
add_files [list {TestLVDSTop.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc7k325tfbg900-2
