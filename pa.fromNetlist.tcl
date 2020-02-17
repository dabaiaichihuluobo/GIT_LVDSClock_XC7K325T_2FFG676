
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name TestLVDSClock -dir "F:/codetemp/TestLVDSClock/planAhead_run_3" -part xc7k325tfbg900-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "F:/codetemp/TestLVDSClock/TestLVDSTop.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {F:/codetemp/TestLVDSClock} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "TestLVDSTop.ucf" [current_fileset -constrset]
add_files [list {TestLVDSTop.ucf}] -fileset [get_property constrset [current_run]]
link_design
