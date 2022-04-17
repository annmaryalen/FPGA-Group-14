set projDir "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/vivado"
set projName "FinalGame_Zootopia"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/au_top_0.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/game_minibeta_1.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/reset_conditioner_2.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/button_conditioner_3.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/edge_detector_4.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/edge_detector_5.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/game_cu_6.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/game_regfile_7.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/multi_seven_seg_8.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/seven_seg_9.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/alu_10.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/pipeline_11.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/pn_gen_12.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/counter_13.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/modified_counter_14.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/counter_15.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/difficulty1_16.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/difficulty2_17.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/difficulty3_18.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/counter_19.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/decoder_20.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/adder_21.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/compare_22.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/shifter_23.v" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/verilog/boolean_24.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/constraint/custom.xdc" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/constraint/custom.xdc" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/constraint/original.xdc" "C:/Users/Nicholas/Desktop/FPGA\ Group\ 14/FinalGame_Zootopia/work/constraint/buttons.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
