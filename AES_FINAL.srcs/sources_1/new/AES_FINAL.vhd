----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2018 15:55:56
-- Design Name: 
-- Module Name: AES_FINAL - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AES_FINAL is
    Port ( a,p1,p2 : in STD_LOGIC_VECTOR (127 downto 0);
           clk,clr,s : in STD_LOGIC;
           b : out STD_LOGIC_VECTOR (127 downto 0));
end AES_FINAL;

architecture Behavioral of AES_FINAL is
component controller is
Port ( clk,clr,s : in STD_LOGIC;
           en,de : out STD_LOGIC);
           end component;
component datapath is
Port (a,p1,p2:in std_logic_vector(127 downto 0);b : out STD_LOGIC_VECTOR (127 downto 0);en,de : in STD_LOGIC  );
end component;

signal s0,s1:std_logic;signal skey:std_logic_vector(127 downto 0);
begin
x1:controller port map(clk=>clk,clr=>clr,s=>s,en=>s0,de=>s1);
x2:datapath port map(a=>a,b=>b,en=>s0,de=>s1,p1=>p1,p2=>p2);
end Behavioral;
