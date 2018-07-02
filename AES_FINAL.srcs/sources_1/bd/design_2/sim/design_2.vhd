--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
--Date        : Tue Apr 24 16:11:19 2018
--Host        : DESKTOP-2O40SDS running 64-bit major release  (build 9200)
--Command     : generate_target design_2.bd
--Design      : design_2
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_2 is
  port (
    clk_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_2 : entity is "design_2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_2,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_2 : entity is "design_2.hwdef";
end design_2;

architecture STRUCTURE of design_2 is
  component design_2_AES_FINAL_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 127 downto 0 );
    p1 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    p2 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    clk : in STD_LOGIC;
    clr : in STD_LOGIC;
    s : in STD_LOGIC;
    b : out STD_LOGIC_VECTOR ( 127 downto 0 )
  );
  end component design_2_AES_FINAL_0_0;
  component design_2_vio_0_0 is
  port (
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_2_vio_0_0;
  component design_2_ila_0_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 127 downto 0 )
  );
  end component design_2_ila_0_0;
  signal AES_FINAL_0_b : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal vio_0_probe_out0 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal vio_0_probe_out1 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal vio_0_probe_out2 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal vio_0_probe_out3 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal vio_0_probe_out4 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN design_2_clk_0, FREQ_HZ 100000000, PHASE 0.000";
begin
  clk_0_1 <= clk_0;
AES_FINAL_0: component design_2_AES_FINAL_0_0
     port map (
      a(127 downto 0) => vio_0_probe_out0(127 downto 0),
      b(127 downto 0) => AES_FINAL_0_b(127 downto 0),
      clk => clk_0_1,
      clr => vio_0_probe_out3(0),
      p1(127 downto 0) => vio_0_probe_out1(127 downto 0),
      p2(127 downto 0) => vio_0_probe_out2(127 downto 0),
      s => vio_0_probe_out4(0)
    );
ila_0: component design_2_ila_0_0
     port map (
      clk => clk_0_1,
      probe0(127 downto 0) => AES_FINAL_0_b(127 downto 0)
    );
vio_0: component design_2_vio_0_0
     port map (
      clk => clk_0_1,
      probe_in0(127 downto 0) => AES_FINAL_0_b(127 downto 0),
      probe_out0(127 downto 0) => vio_0_probe_out0(127 downto 0),
      probe_out1(127 downto 0) => vio_0_probe_out1(127 downto 0),
      probe_out2(127 downto 0) => vio_0_probe_out2(127 downto 0),
      probe_out3(0) => vio_0_probe_out3(0),
      probe_out4(0) => vio_0_probe_out4(0)
    );
end STRUCTURE;
