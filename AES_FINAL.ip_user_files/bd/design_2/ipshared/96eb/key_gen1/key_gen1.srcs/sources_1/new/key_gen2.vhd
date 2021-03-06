----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2018 14:22:03
-- Design Name: 
-- Module Name: key_gen1 - Behavioral
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

entity key_gen2 is
    Port ( p2 : in STD_LOGIC_vector(3 downto 0);
           g2 : out STD_LOGIC_vector(3 downto 0));
end key_gen2;

architecture Behavioral of key_gen2 is

begin
process(p2)
variable vp1,vs,vg1,vkey:integer range 0 to 15;
 begin
 vp1:=to_integer(unsigned(p2)); 
vg1:=(2**vp1) mod 11;

 g2<=std_logic_vector(to_unsigned(vg1,g2'length));  
  end process;

end Behavioral;
