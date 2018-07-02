-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Tue Apr 24 16:14:10 2018
-- Host        : DESKTOP-2O40SDS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/vivado/AES_FINAL/AES_FINAL.srcs/sources_1/bd/design_2/ip/design_2_vio_0_0/design_2_vio_0_0_stub.vhdl
-- Design      : design_2_vio_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tfbv484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_2_vio_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end design_2_vio_0_0;

architecture stub of design_2_vio_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[127:0],probe_out0[127:0],probe_out1[127:0],probe_out2[127:0],probe_out3[0:0],probe_out4[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2017.4";
begin
end;
