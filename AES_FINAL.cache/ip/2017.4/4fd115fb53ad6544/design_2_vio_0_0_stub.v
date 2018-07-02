// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Apr 24 16:14:07 2018
// Host        : DESKTOP-2O40SDS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_2_vio_0_0_stub.v
// Design      : design_2_vio_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbv484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2017.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe_in0, probe_out0, probe_out1, 
  probe_out2, probe_out3, probe_out4)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[127:0],probe_out0[127:0],probe_out1[127:0],probe_out2[127:0],probe_out3[0:0],probe_out4[0:0]" */;
  input clk;
  input [127:0]probe_in0;
  output [127:0]probe_out0;
  output [127:0]probe_out1;
  output [127:0]probe_out2;
  output [0:0]probe_out3;
  output [0:0]probe_out4;
endmodule
