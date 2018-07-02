----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2018 14:30:54
-- Design Name: 
-- Module Name: dh - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dh is
    Port ( p1,p2 : in STD_LOGIC_VECTOR (3 downto 0);
           key : out STD_LOGIC_VECTOR (3 downto 0));
end dh;

architecture Behavioral of dh is
component key_gen1 is
Port ( p1 : in STD_LOGIC_vector(3 downto 0);
           g1 : out STD_LOGIC_vector(3 downto 0));
           end component;
  component key_gen2 is
  Port ( p2 : in STD_LOGIC_vector(3 downto 0);
             g2 : out STD_LOGIC_vector(3 downto 0));
             end component;
  signal s1,s2:std_logic_vector(3 downto 0);
begin
x1:key_gen1 port map(p1=>p1,g1=>s2);
x2:key_gen2 port map(p2=>p2,g2=>s1);

process(s2)
variable vs,vg2,vkey:integer range 0 to 15;

 
constant vp2:integer:=to_integer(unsigned(p2));  
begin
vs:=to_integer(unsigned(s2));
vkey:=1;
 for  i in 0 to 10 loop
  vkey:=vkey*vs;
  end loop;
  vkey:=vkey mod 11;
  key<=std_logic_vector(to_unsigned(vkey,key'length));
  end process;
end Behavioral;
