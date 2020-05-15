read_netlist FAS_dft.v
read_netlist /home/raid7_2/course/cvsd/CBDK_IC_Contest/CIC/Verilog/tsmc13.v

run_build_model FAS
report_violations -all

run_drc FAS_dft.spf

set_faults -model stuck 
add_faults -all 

set_atpg -abort_limit 100 -merge high
run_atpg -auto_compression

report_summaries > FAS_atpg.sum_rpt

set_faults -report collapsed
report_summaries > FAS_atpg.col_rpt

set_faults -fault_coverage
report_summaries > FAS_atpg.fc_rpt

report_patterns -all 

write_patterns FAS_atpg.wgl -format WGL 
write_patterns FAS_atpg.stil -format STIL -vcs
