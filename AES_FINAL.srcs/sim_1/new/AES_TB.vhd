----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2018 16:19:49
-- Design Name: 
-- Module Name: AES_TB - Behavioral
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

entity AES_TB is
--  Port ( );
end AES_TB;

architecture Behavioral of AES_TB is
component AES_FINAL IS
Port ( a,p1,p2 : in STD_LOGIC_VECTOR (127 downto 0);
           clk,clr,s : in STD_LOGIC;
           b : out STD_LOGIC_VECTOR (127 downto 0));
           end component;
  signal sa,sb,sp1,sp2:std_logic_vector(127 downto 0);signal sclk,sclr,ss:std_logic;
  
begin
uut:AES_FINAL PORT MAP(a=>sa,p1=>sp1,p2=>sp2,b=>sb,clk=>sclk,clr=>sclr,s=>ss);
process
begin
sclk<='0';wait for 20ns;
sclk<='1';wait for 20ns;
end process;
process
begin
sa<=x"f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0";sp1<=x"000102030405060708090a0b0c0d0e0f";sp2<=x"000102030405060708090a0b250d0e0f";
wait for 50ns;
sa<=x"c3f74b41f8a2164867ce08959903cc51";sp1<=x"000102030405060708090a0b0c0d0e0f";sp2<=x"000102030405060708090a0b250d0e0f";
wait for 50ns;
end process;
process
begin
sclr<='0';wait for 5ns;
sclr<='1';wait;
end process;
process
begin
ss<='0';
wait for 50ns;
ss<='1';wait for 50ns;
end process;



end Behavioral;
