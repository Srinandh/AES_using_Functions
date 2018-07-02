----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2018 16:01:21
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
  Port (a,p1,p2:in std_logic_vector(127 downto 0);b : out STD_LOGIC_VECTOR (127 downto 0);en,de : in STD_LOGIC  );
end datapath;

architecture Behavioral of datapath is
component encrypt is 
Port ( a : in STD_LOGIC_VECTOR (127 downto 0);en:in std_logic;
           key : in STD_LOGIC_VECTOR (127 downto 0);
           b : out STD_LOGIC_VECTOR (127 downto 0));
           end component;
 component decrypt is
 Port ( a : in STD_LOGIC_VECTOR (127 downto 0);de:in std_logic;
            key : in STD_LOGIC_VECTOR (127 downto 0);
            b : out STD_LOGIC_VECTOR (127 downto 0));
            end component;
  component dh_128 is
            Port ( p1,p2 : in STD_LOGIC_VECTOR (127 downto 0);
                       key : out STD_LOGIC_VECTOR (127 downto 0));
                       end component;
             signal s0,s1,s2:std_logic_vector(127 downto 0);
begin
x1:encrypt port map(a=>a,key=>s2,en=>en,b=>s0);
x2:decrypt port map(a=>a,key=>s2,de=>de,b=>s1);
x3:dh_128 port map(p1=>p1,p2=>p2,key=>s2);
process(s0,s1)
begin
if en='1'and de='0' then b<=s0;
elsif de='1' and en='0' then b<=s1;
else
b<=s0;
end if;
end process;
--b<=s0;
end Behavioral;
