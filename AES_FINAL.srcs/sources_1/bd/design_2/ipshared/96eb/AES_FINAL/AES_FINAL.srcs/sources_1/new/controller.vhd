----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2018 15:56:47
-- Design Name: 
-- Module Name: controller - Behavioral
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

entity controller is
    Port ( clk,clr,s : in STD_LOGIC;
           en,de : out STD_LOGIC);
end controller;

architecture Behavioral of controller is

begin
process(clr,clk)
begin
if clr='0' then en<='0';de<='0';
elsif clk='0' and clk'event then
  if s='0' then en<='1';de<='0';
  elsif s='1' then de<='1';en<='0';
  end if;
end if;
end process;

end Behavioral;
