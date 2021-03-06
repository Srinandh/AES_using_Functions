# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7k160tfbv484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/vivado/AES_FINAL/AES_FINAL.cache/wt [current_project]
set_property parent.project_path C:/vivado/AES_FINAL/AES_FINAL.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_repo_paths c:/vivado [current_project]
set_property ip_output_repo c:/vivado/AES_FINAL/AES_FINAL.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib C:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/hdl/design_2_wrapper.vhd
add_files C:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/design_2.bd
set_property used_in_implementation false [get_files -all c:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/ip/design_2_AES_FINAL_0_0/AES_FINAL/AES_FINAL.srcs/constrs_1/new/CONST.xdc]
set_property used_in_implementation false [get_files -all c:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/ip/design_2_vio_0_0/design_2_vio_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/ip/design_2_vio_0_0/design_2_vio_0_0_ooc.xdc]
set_property used_in_synthesis false [get_files -all c:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/ip/design_2_ila_0_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all c:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/ip/design_2_ila_0_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all c:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/ip/design_2_ila_0_0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all c:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/ip/design_2_ila_0_0/design_2_ila_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/design_2_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/vivado/AES_FINAL/AES_FINAL.srcs/constrs_1/new/CONST.xdc
set_property used_in_implementation false [get_files C:/vivado/AES_FINAL/AES_FINAL.srcs/constrs_1/new/CONST.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top design_2_wrapper -part xc7k160tfbv484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef design_2_wrapper.dcp
create_report "synth_2_synth_report_utilization_0" "report_utilization -file design_2_wrapper_utilization_synth.rpt -pb design_2_wrapper_utilization_synth.pb"
