set projDir "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/vivado"
set projName "FinalGame"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/au_top_0.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/button_conditioner_1.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/edge_detector_2.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/edge_detector_3.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/game_main_4.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/reset_conditioner_5.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/pipeline_6.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/modified_counter_7.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/pn_gen_8.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/counter_9.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/counter_10.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/multi_seven_seg_11.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/seven_seg_12.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/alu_13.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/difficulty1_14.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/difficulty2_15.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/difficulty3_16.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/counter_17.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/decoder_18.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/adder_19.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/compare_20.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/shifter_21.v" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/verilog/boolean_22.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/constraint/custom.xdc" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/constraint/buttons.xdc" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/constraint/custom.xdc" "C:/Users/Nicholas/Desktop/backup\ game\ FPGA/FinalGame/work/constraint/original.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
